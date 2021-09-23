
                XDEF                _filline_test1
                XDEF                _filline_test2
                XDEF                _filline_test3
                XDEF                _filline_test4
                XDEF                _filline_test5
                XDEF                _filline_test6
                XDEF                _filline_test7
                XDEF                _filline_test8
                XDEF                _filline_test9
                XDEF                _filline_test10
                XDEF                _filline_test11
                XDEF                _filline_test12
                XDEF                _filline_test13
                XDEF                _filline_test14
                XDEF                _filline_test15
	
                SECTION             PROCESSING,CODE_F

                include             "../../../libs/ammxmacros.i"
                include             "../../../libs/rasterizers/globaloptions.s"
                include             "../../../libs/rasterizers/processing_bitplanes_fast.s"
                include             "../../../libs/rasterizers/processing_table_plotrefs.s"
                include             "../../../libs/rasterizers/processingfill.s"
                include             "../../../libs/rasterizers/processingclearfunctions.s"
                include             "../../../libs/trigtables.i"
                include             "../../../libs/rasterizers/line.s"


_filline_test1:

                RESETFILLTABLE

                lea                 LINEVERTEX_START_FINAL,a1
                move.w              #1,(a1)+
                move.w              #1,(a1)+
                move.w              #8,(a1)+
                move.w              #5,(a1)+
                bsr.w               ammxlinefill
	
                lea                 LINEVERTEX_START_FINAL,a1
                move.w              #10,(a1)+
                move.w              #1,(a1)+
                move.w              #18,(a1)+
                move.w              #5,(a1)+
                bsr.w               ammxlinefill
    

                bsr.w               processing_fill_table_addr                                 ; fill table addr in d0
                rts

_filline_test2:

                RESETFILLTABLE

                lea                 LINEVERTEX_START_FINAL,a1
                move.w              #8,(a1)+
                move.w              #5,(a1)+
                move.w              #1,(a1)+
                move.w              #1,(a1)+
                bsr.w               ammxlinefill
	
                lea                 LINEVERTEX_START_FINAL,a1
                move.w              #18,(a1)+
                move.w              #5,(a1)+
                move.w              #10,(a1)+
                move.w              #1,(a1)+
                bsr.w               ammxlinefill
    

                bsr.w               processing_fill_table_addr                                 ; fill table addr in d0
                rts

_filline_test3:
  ;movem.l        d0-d7/a0-a6,-(sp)

                RESETFILLTABLE

                lea                 LINEVERTEX_START_FINAL,a1
                move.w              #10,(a1)+
                move.w              #1,(a1)+
                move.w              #18,(a1)+
                move.w              #5,(a1)+
                bsr.w               ammxlinefill

                lea                 LINEVERTEX_START_FINAL,a1
                move.w              #1,(a1)+
                move.w              #1,(a1)+
                move.w              #8,(a1)+
                move.w              #5,(a1)+
                bsr.w               ammxlinefill
    

                bsr.w               processing_fill_table_addr                                 ; fill table addr in d0
  ;movem.l        (sp)+,d0-d7/a0-a6
                rts

_filline_test4:
	;movem.l        d0-d7/a0-a6,-(sp)

                RESETFILLTABLE

                lea                 LINEVERTEX_START_FINAL,a1
                move.w              #1,(a1)+
                move.w              #1,(a1)+
                move.w              #8,(a1)+
                move.w              #5,(a1)+
                bsr.w               ammxlinefill
	
                lea                 LINEVERTEX_START_FINAL,a1
                move.w              #18,(a1)+
                move.w              #5,(a1)+
                move.w              #10,(a1)+
                move.w              #1,(a1)+
                bsr.w               ammxlinefill
    

                bsr.w               processing_fill_table_addr                                 ; fill table addr in d0
	;movem.l        (sp)+,d0-d7/a0-a6
                rts

_filline_test5:
	;movem.l        d0-d7/a0-a6,-(sp)

                RESETFILLTABLE

                lea                 LINEVERTEX_START_FINAL,a1
                move.w              #8,(a1)+
                move.w              #5,(a1)+
                move.w              #1,(a1)+
                move.w              #1,(a1)+
                bsr.w               ammxlinefill
	
                lea                 LINEVERTEX_START_FINAL,a1
                move.w              #10,(a1)+
                move.w              #1,(a1)+
                move.w              #18,(a1)+
                move.w              #5,(a1)+
                bsr.w               ammxlinefill
    

                bsr.w               processing_fill_table_addr                                 ; fill table addr in d0
	;movem.l        (sp)+,d0-d7/a0-a6
                rts

_filline_test6:
	;movem.l        d0-d7/a0-a6,-(sp)

                RESETFILLTABLE
	
                lea                 LINEVERTEX_START_FINAL,a1
                move.w              #1,(a1)+
                move.w              #1,(a1)+
                move.w              #3,(a1)+
                move.w              #2,(a1)+
                bsr.w               ammxlinefill
	
                lea                 LINEVERTEX_START_FINAL,a1
                move.w              #150,(a1)+
                move.w              #1,(a1)+
                move.w              #155,(a1)+
                move.w              #5,(a1)+
                bsr.w               ammxlinefill

                lea                 LINEVERTEX_START_FINAL,a1
                move.w              #3,(a1)+
                move.w              #2,(a1)+
                move.w              #155,(a1)+
                move.w              #5,(a1)+
                bsr.w               ammxlinefill

                bsr.w               processing_fill_table_addr                                 ; fill table addr in d0
	;movem.l        (sp)+,d0-d7/a0-a6
                rts

_filline_test7:
	;movem.l        d0-d7/a0-a6,-(sp)

                RESETFILLTABLE

                lea                 LINEVERTEX_START_FINAL,a1
                move.w              #1,(a1)+
                move.w              #1,(a1)+
                move.w              #1,(a1)+
                move.w              #2,(a1)+
                bsr.w               ammxlinefill

                bsr.w               processing_fill_table_addr                                 ; fill table addr in d0
	;movem.l        (sp)+,d0-d7/a0-a6
                rts

_filline_test8:
	;movem.l        d0-d7/a0-a6,-(sp)
                RESETFILLTABLE
                lea                 LINEVERTEX_START_FINAL,a1
                move.w              #0,(a1)+
                move.w              #0,(a1)+
                move.w              #1,(a1)+
                move.w              #7,(a1)+
                bsr.w               ammxlinefill

                bsr.w               processing_fill_table_addr                                 ; fill table addr in d0
	;movem.l        (sp)+,d0-d7/a0-a6
                rts

_filline_test9:
	;movem.l        d0-d7/a0-a6,-(sp)
                RESETFILLTABLE
                lea                 LINEVERTEX_START_FINAL,a1
                move.w              #0,(a1)+
                move.w              #0,(a1)+
                move.w              #8,(a1)+
                move.w              #18,(a1)+
                bsr.w               ammxlinefill

                bsr.w               processing_fill_table_addr                                 ; fill table addr in d0
	;movem.l        (sp)+,d0-d7/a0-a6
                rts

_filline_test10:
	;movem.l        d0-d7/a0-a6,-(sp)
                RESETFILLTABLE
                lea                 LINEVERTEX_START_FINAL,a1
                move.w              #0,(a1)+
                move.w              #0,(a1)+
                move.w              #0,(a1)+
                move.w              #1,(a1)+
                bsr.w               ammxlinefill

                lea                 LINEVERTEX_START_FINAL,a1
                move.w              #319,(a1)+
                move.w              #0,(a1)+
                move.w              #319,(a1)+
                move.w              #1,(a1)+
                bsr.w               ammxlinefill

                bsr.w               processing_fill_table_addr                                 ; fill table addr in d0
	;movem.l        (sp)+,d0-d7/a0-a6
                rts


_filline_test11:
	;movem.l        d0-d7/a0-a6,-(sp)
                RESETFILLTABLE
                lea                 LINEVERTEX_START_FINAL,a1
                move.w              #10,(a1)+
                move.w              #10,(a1)+
                move.w              #20,(a1)+
                move.w              #10,(a1)+
                bsr.w               ammxlinefill

                lea                 LINEVERTEX_START_FINAL,a1
                move.w              #10,(a1)+
                move.w              #10,(a1)+
                move.w              #10,(a1)+
                move.w              #20,(a1)+
                bsr.w               ammxlinefill

                lea                 LINEVERTEX_START_FINAL,a1
                move.w              #20,(a1)+
                move.w              #10,(a1)+
                move.w              #20,(a1)+
                move.w              #20,(a1)+
                bsr.w               ammxlinefill

                lea                 LINEVERTEX_START_FINAL,a1
                move.w              #10,(a1)+
                move.w              #20,(a1)+
                move.w              #20,(a1)+
                move.w              #20,(a1)+
                bsr.w               ammxlinefill

                bsr.w               processing_fill_table_addr                                 ; fill table addr in d0
	;movem.l        (sp)+,d0-d7/a0-a6
                rts

_filline_test12:
	;movem.l        d0-d7/a0-a6,-(sp)
                RESETFILLTABLE

                lea                 LINEVERTEX_START_FINAL,a1
                move.w              #16,(a1)+
                move.w              #2,(a1)+
                move.w              #8,(a1)+
                move.w              #26,(a1)+
                bsr.w               ammxlinefill

                bsr.w               processing_fill_table_addr                                 ; fill table addr in d0
	;movem.l        (sp)+,d0-d7/a0-a6
                rts

_filline_test13:
	;movem.l        d0-d7/a0-a6,-(sp)
                RESETFILLTABLE
                lea                 LINEVERTEX_START_FINAL,a1
                move.w              #16,(a1)+
                move.w              #2,(a1)+
                move.w              #8,(a1)+
                move.w              #26,(a1)+
                bsr.w               ammxlinefill

	;lea LINEVERTEX_START_FINAL,a1
	;move.w #8,(a1)+
	;move.w #16,(a1)+
	;move.w #28,(a1)+
	;move.w #16,(a1)+
	;bsr.w ammxlinefill

                lea                 LINEVERTEX_START_FINAL,a1
                move.w              #16,(a1)+
                move.w              #2,(a1)+
                move.w              #28,(a1)+
                move.w              #26,(a1)+
                bsr.w               ammxlinefill

                bsr.w               processing_fill_table_addr                                 ; fill table addr in d0
	;movem.l        (sp)+,d0-d7/a0-a6
                rts

_filline_test14:
	;movem.l        d0-d7/a0-a6,-(sp)
                RESETFILLTABLE
                lea                 LINEVERTEX_START_FINAL,a1
                move.w              #26,(a1)+
                move.w              #2,(a1)+
                move.w              #8,(a1)+
                move.w              #10,(a1)+
                bsr.w               ammxlinefill

                bsr.w               processing_fill_table_addr                                 ; fill table addr in d0
	;movem.l        (sp)+,d0-d7/a0-a6
                rts

_filline_test15:
	;movem.l        d0-d7/a0-a6,-(sp)
                movem.l             d2/a0-a6,-(sp)
                RESETFILLTABLE

                move.w              #160,d0
                move.w              #11,d1
                move.w              #10,d2

  ;movem.l        d0-d7/a0-a6,-(sp)

  ; init fill routines printing center, this must be stripped after optimizations!
  
    ; load sin cos table addr here into a0
                lea                 ROT_Z_MATRIX_Q5_11,a0
    
  ; previous point x and x (x on the high word and y on the Y word)
                move.w              d0,d3
                add.w               d2,d3
                swap                d3
                move.w              d1,d3
    
                move.w              #30,d7                                                     ; let's start with first point at angle 30 deg
  
; Cycle from 0 to 90, each time encreasing the angle by 30
CIRCLE_STARTLOOP:
                cmp.w               #90,d7
                bhi.w               CIRCLE_EXIT
    
    ; load sin and cos relative to the angle
                move.w              d7,d6
                lsl.w               #3,d6
                move.l              4(a0,D6.w),d4                                              ; d4 now contains sin(x) on the high word and cos(x) on the low word
    
    ; multiply and normalize d4 data with the radius
                move.l              d4,d6
                muls.w              d2,d6
                lsr.l               #8,d6
                lsr.l               #3,d6
    ; x done , d6 now contains x*sin(angle) now same procedure with x
    
                swap                d4
                move.w              d4,d5
                muls.w              d2,d5
                lsr.l               #8,d5
                lsr.l               #3,d5
    ;lsr.l #5,d5
    
    ; at this point I expect:
    ; d6 = radius*cos(angle) (low word)
    ; d5 = radius*sin(angle) (low word)
    
    ; add the center
                add.w               d0,d6
                add.w               d1,d5
    
    ; unpack the previous point
                move.w              d3,d4                                                      ; unpack y into d4
                swap                d3                                                         ; unpack x into d3
    
    ; print line with transformation , coords d3,d4 - d6,d5
    ; 4th quadrant
  ;bsr.w CIRCLE_PRINTLINE
                lea                 LINEVERTEX_START_FINAL+0,a1
                move.w              d3,(a1)+
                move.w              d4,(a1)+

                lea                 LINEVERTEX_START_FINAL+4,a1
                move.w              d6,(a1)+
                move.w              d5,(a1)+
                bsr.w               ammxlinefill

  ; 1st quadrant
                move.w              d3,CIRCLE_TMP1_X
  
                move.w              d1,CIRCLE_TMP1_Y
                move.w              d4,d3
                sub.w               d1,d3
                sub.w               d3,CIRCLE_TMP1_Y

                move.w              d1,CIRCLE_TMP2_Y
                move.w              d5,d3
                sub.w               d1,d3
                sub.w               d3,CIRCLE_TMP2_Y

                lea                 LINEVERTEX_START_FINAL+0,a1
                move.w              CIRCLE_TMP1_X,(a1)+
                move.w              CIRCLE_TMP1_Y,(a1)+

                lea                 LINEVERTEX_START_FINAL+4,a1
                move.w              d6,(a1)+
                move.w              CIRCLE_TMP2_Y,(a1)+
                bsr.w               ammxlinefill

                move.w              CIRCLE_TMP1_X,d3




  ; 3rd quadrant
                move.w              d3,CIRCLE_TMP1_Y
                move.w              d0,CIRCLE_TMP1_X
                move.w              d3,d3
                sub.w               d0,d3
                sub.w               d3,CIRCLE_TMP1_X

                move.w              d0,CIRCLE_TMP2_X
                move.w              d6,d3
                sub.w               d0,d3
                sub.w               d3,CIRCLE_TMP2_X

                lea                 LINEVERTEX_START_FINAL+0,a1
                move.w              CIRCLE_TMP1_X,(a1)+
                move.w              d4,(a1)+

                lea                 LINEVERTEX_START_FINAL+4,a1
                move.w              CIRCLE_TMP2_X,(a1)+
                move.w              d5,(a1)+
                bsr.w               ammxlinefill

                move.w              CIRCLE_TMP1_Y,d3

  ; 2nd quadrant
                move.w              d0,CIRCLE_TMP1_X
                move.w              d3,d3
                sub.w               d0,d3
                sub.w               d3,CIRCLE_TMP1_X

                move.w              d1,CIRCLE_TMP1_Y
                move.w              d4,d3
                sub.w               d1,d3
                sub.w               d3,CIRCLE_TMP1_Y

                move.w              d0,CIRCLE_TMP2_X
                move.w              d6,d3
                sub.w               d0,d3
                sub.w               d3,CIRCLE_TMP2_X

                move.w              d1,CIRCLE_TMP2_Y
                move.w              d5,d3
                sub.w               d1,d3
                sub.w               d3,CIRCLE_TMP2_Y

                lea                 LINEVERTEX_START_FINAL+0,a1
                move.w              CIRCLE_TMP1_X,(a1)+
                move.w              CIRCLE_TMP1_Y,(a1)+

                lea                 LINEVERTEX_START_FINAL+4,a1
                move.w              CIRCLE_TMP2_X,(a1)+
                move.w              CIRCLE_TMP2_Y,(a1)+
                bsr.w               ammxlinefill
  
 
  ;sub.w d0,CIRCLE_TMP1_X
  ; move.w d4,CIRCLE_TMP1_Y

   ; MINUWORD d1,AMMXFILLTABLE_CURRENT_ROW
   ; MAXUWORD d1,AMMXFILLTABLE_END_ROW
    
    ; pack d5/d6 into d3
                move.w              d6,d3
                swap                d3
                move.w              d5,d3
    
                add.w               #30,d7
                bra.w               CIRCLE_STARTLOOP

CIRCLE_EXIT:
  ;bsr.w                                           ammx_fill_table

  ;movem.l        (sp)+,d0-d7/a0-a6
                bsr.w               processing_fill_table_addr
                movem.l             (sp)+,d2/a0-a6



                rts

CIRCLE_TMP1_X:  dc.w                0
CIRCLE_TMP1_Y:  dc.w                0
CIRCLE_TMP2_X:  dc.w                0
CIRCLE_TMP2_Y:  dc.w                0




  