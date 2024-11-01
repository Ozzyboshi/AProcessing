                           XDEF                                          _drawing_test1
                           XDEF                                          _drawing_test2
                           XDEF                                          _drawing_test3
                           XDEF                                          _drawing_test4
                           XDEF                                          _drawing_test5
                           XDEF                                          _drawing_test6
                           XDEF                                          _drawing_test7
                           XDEF                                          _drawing_test8
                           XDEF                                          _drawing_test9
                           XDEF                                          _drawing_test10
                           XDEF                                          _drawing_test11
                           XDEF                                          _drawing_test12
                           XDEF                                          _drawing_test13
                           XDEF                                          _drawing_test14
                           XDEF                                          _drawing_test15
                           XDEF                                          _drawing_test16
                           XDEF                                          _drawing_test17
                           XDEF                                          _drawing_test18
                           XDEF                                          _drawing_test19
                           XDEF                                          _drawing_test20
                           XDEF                                          _drawing_test21
                           XDEF                                          _drawing_test22
                           XDEF                                          _drawing_test23
                           XDEF                                          _drawing_test24

                           SECTION                                       PROCESSING,CODE_F

                           include                                       "../../../libs/rasterizers/globaloptions.s"
                           include                                       "../../../libs/ammxmacros.i"
                           include                                       "../../../libs/matrix/matrixcommon.s"
                           include                                       "../../../libs/matrix/matrix.s"
                           include                                       "../../../libs/matrix/scale.s"
                           include                                       "../../../libs/trigtables.i"
                           include                                       "../../../libs/rasterizers/processing_bitplanes_fast.s"
                           include                                       "../../../libs/rasterizers/processing_table_plotrefs.s"
                           include                                       "../../../libs/rasterizers/processingclearfunctions.s"
                           include                                       "../../../libs/rasterizers/point.s"
                           include                                       "../../../libs/matrix/point.s"
                           include                                       "../../../libs/rasterizers/square.s"
                           include                                       "../../../libs/rasterizers/triangle.s"
                           include                                       "../../../libs/rasterizers/rectangle.s"
                           include                                       "../../../libs/rasterizers/circle.s"
                           include                                       "../../../libs/rasterizers/processingfill.s"
                           include                                       "../../../libs/rasterizers/clipping.s"

_drawing_test1:
	
                           CLEARFASTBITPLANES                                                                                       ; Clear fast bitplanes
                           RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6
                           move.w                                        #160,d0
                           move.w                                        #128,d1
                           jsr                                           TRANSLATE

                           ROTATE                                        #45

                           move.w                                        #-5,d0
                           move.w                                        #-5,d1
                           move.w                                        #10,d5

                           bsr.w                                         SQUARE                                                     ;#-5,#-5,#10

                           processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
                           rts

_drawing_test2:
	
                           CLEARFASTBITPLANES                                                                                       ; Clear fast bitplanes
	
                           RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

                           move.w                                        #160,d0
                           move.w                                        #128,d1
                           jsr                                           TRANSLATE

                           ROTATE                                        #0

                           move.w                                        #0,d0
                           move.w                                        #-5,d1

                           move.w                                        #-5,d6
                           move.w                                        #5,d3

                           move.w                                        #5,d4
                           move.w                                        #5,d5

	
                           bsr.w                                         TRIANGLE

                           processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
                           rts

_drawing_test3:
	;movem.l        d0-d7/a0-a6,-(sp)
	
                           CLEARFASTBITPLANES                                                                                       ; Clear fast bitplanes
	
                           RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

	


                           move.w                                        #160,d0
                           move.w                                        #128,d1
                           jsr                                           TRANSLATE

                           ROTATE                                        #180

                           move.w                                        #0,d0
                           move.w                                        #-5,d1

                           move.w                                        #-5,d6
                           move.w                                        #5,d3

                           move.w                                        #5,d4
                           move.w                                        #5,d5

	
                           bsr.w                                         TRIANGLE

                           processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
	;movem.l        (sp)+,d0-d7/a0-a6
                           rts

_drawing_test4:
	;movem.l        d0-d7/a0-a6,-(sp)
	
                           CLEARFASTBITPLANES                                                                                       ; Clear fast bitplanes
	
                           RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

                           move.w                                        #160,d0
                           move.w                                        #128,d1
                           jsr                                           TRANSLATE

                           ROTATE                                        #0

                           move.w                                        #-5,d0
                           move.w                                        #-10,d1

                           move.w                                        #10,d5
                           move.w                                        #20,d6

                           bsr.w                                         RECT

                           processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
	;movem.l        (sp)+,d0-d7/a0-a6
                           rts

_drawing_test5:
	;movem.l        d0-d7/a0-a6,-(sp)
	
                           CLEARFASTBITPLANES                                                                                       ; Clear fast bitplanes
	
                           RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

                           move.w                                        #160,d0
                           move.w                                        #128,d1
                           jsr                                           TRANSLATE

                           ROTATE                                        #30

                           move.w                                        #-5,d0
                           move.w                                        #-10,d1

                           move.w                                        #10,d5
                           move.w                                        #20,d6

                           bsr.w                                         RECT

                           processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
	;movem.l        (sp)+,d0-d7/a0-a6
                           rts

_drawing_test6:
	;movem.l        d0-d7/a0-a6,-(sp)
	
                           CLEARFASTBITPLANES                                                                                       ; Clear fast bitplanes
	
                           RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

                           move.w                                        #160,d0
                           move.w                                        #128,d1
                           jsr                                           TRANSLATE

	; scale 0,5 on Y axis
                           move.w                                        #%0000000001000000,d0
                           move.w                                        #%0000000000100000,d1
                           jsr                                           SCALE

                           move.w                                        #-5,d0
                           move.w                                        #-10,d1

                           move.w                                        #10,d5
                           move.w                                        #20,d6

                           bsr.w                                         RECT

                           processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
	;movem.l        (sp)+,d0-d7/a0-a6
                           rts

_drawing_test7:
                           movem.l                                       d2,-(sp)
	
                           CLEARFASTBITPLANES                                                                                       ; Clear fast bitplanes
	
                           RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

                           move.w                                        #160,d0
                           move.w                                        #128,d1
                           jsr                                           TRANSLATE

                           move.w                                        #0,d0
                           move.w                                        #0,d1

                           move.w                                        #10,d2

                           bsr.w                                         CIRCLE

                           processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
                           movem.l                                       (sp)+,d2
                           rts

_drawing_test8:
                           movem.l                                       d2,-(sp)
	
                           CLEARFASTBITPLANES                                                                                       ; Clear fast bitplanes
	
                           RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

                           STROKE                                        #2
                           move.w                                        #160,d0
                           move.w                                        #128,d1
                           jsr                                           TRANSLATE

                           move.w                                        #0,d0
                           move.w                                        #0,d1

                           move.w                                        #10,d2

                           bsr.w                                         CIRCLE

                           STROKE                                        #1
                           move.w                                        #-15,d0
                           move.w                                        #-15,d1
                           move.w                                        #30,d5

                           bsr.w                                         SQUARE  

                           STROKE                                        #1
                           processing_bitplanes_fast_screen0
  
                           movem.l                                       (sp)+,d2
                           rts

_drawing_test9:
	
                           CLEARFASTBITPLANES                                                                                       ; Clear fast bitplanes
                           RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6
                           ENABLE_CLIPPING
                           move.w                                        #0,d0
                           move.w                                        #0,d1
                           jsr                                           TRANSLATE

                           ROTATE                                        #45

                           move.w                                        #-5,d0
                           move.w                                        #-5,d1
                           move.w                                        #10,d5
                           bsr.w                                         SQUARE                                                     ;#-5,#-5,#10

                           DISABLE_CLIPPING

                           processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
                           rts

_drawing_test10:
	
                           CLEARFASTBITPLANES                                                                                       ; Clear fast bitplanes
                           RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6
                           ENABLE_CLIPPING
                           move.w                                        #0,d0
                           move.w                                        #255,d1
                           jsr                                           TRANSLATE

                           ROTATE                                        #45

                           move.w                                        #-15,d0
                           move.w                                        #-15,d1
                           move.w                                        #30,d5
                           bsr.w                                         SQUARE                                                    

                           DISABLE_CLIPPING

                           processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
                           rts

_drawing_test11:
	
                           CLEARFASTBITPLANES                                                                                       ; Clear fast bitplanes
                           RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6
                           ENABLE_CLIPPING
                           move.w                                        #319,d0
                           move.w                                        #0,d1
                           jsr                                           TRANSLATE

                           ROTATE                                        #45

                           move.w                                        #-15,d0
                           move.w                                        #-15,d1
                           move.w                                        #30,d5
                           bsr.w                                         SQUARE                                                    

                           DISABLE_CLIPPING

                           processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
                           rts

_drawing_test12:
	
                           CLEARFASTBITPLANES                                                                                       ; Clear fast bitplanes
                           RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6
                           ENABLE_CLIPPING
                           move.w                                        #319,d0
                           move.w                                        #255,d1
                           jsr                                           TRANSLATE

                           ROTATE                                        #45

                           move.w                                        #-15,d0
                           move.w                                        #-15,d1
                           move.w                                        #30,d5
                           bsr.w                                         SQUARE                                                    

                           DISABLE_CLIPPING

                           processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
                           rts

_drawing_test13:
	
                           CLEARFASTBITPLANES                                                                                       ; Clear fast bitplanes
                           ENABLE_CLIPPING
                           RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

                           move.w                                        #0,d0
                           move.w                                        #0,d1
                           jsr                                           TRANSLATE

                           ROTATE                                        #45

                           move.w                                        #0,d0
                           move.w                                        #-5,d1

                           move.w                                        #-5,d6
                           move.w                                        #5,d3

                           move.w                                        #5,d4
                           move.w                                        #5,d5
	
                           bsr.w                                         TRIANGLE

                           DISABLE_CLIPPING

                           processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
                           rts

_drawing_test14:
	
                           CLEARFASTBITPLANES                                                                                       ; Clear fast bitplanes
                           ENABLE_CLIPPING
                           RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

                           move.w                                        #0,d0
                           move.w                                        #255,d1
                           jsr                                           TRANSLATE

                           ROTATE                                        #45

                           move.w                                        #0,d0
                           move.w                                        #-5,d1

                           move.w                                        #-5,d6
                           move.w                                        #5,d3

                           move.w                                        #5,d4
                           move.w                                        #5,d5
	
                           bsr.w                                         TRIANGLE

                           DISABLE_CLIPPING

                           processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
                           rts

_drawing_test15:
	
                           CLEARFASTBITPLANES                                                                                       ; Clear fast bitplanes
                           ENABLE_CLIPPING
                           RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

                           move.w                                        #319,d0
                           move.w                                        #0,d1
                           jsr                                           TRANSLATE

                           ROTATE                                        #45

                           move.w                                        #0,d0
                           move.w                                        #-5,d1

                           move.w                                        #-5,d6
                           move.w                                        #5,d3

                           move.w                                        #5,d4
                           move.w                                        #5,d5
	
                           bsr.w                                         TRIANGLE

                           DISABLE_CLIPPING

                           processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
                           rts

_drawing_test16:
	
                           CLEARFASTBITPLANES                                                                                       ; Clear fast bitplanes
                           ENABLE_CLIPPING
                           RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

                           move.w                                        #319,d0
                           move.w                                        #255,d1
                           jsr                                           TRANSLATE

                           ROTATE                                        #45

                           move.w                                        #0,d0
                           move.w                                        #-5,d1

                           move.w                                        #-5,d6
                           move.w                                        #5,d3

                           move.w                                        #5,d4
                           move.w                                        #5,d5
	
                           bsr.w                                         TRIANGLE

                           DISABLE_CLIPPING

                           processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
                           rts

_drawing_test17:
	
                           CLEARFASTBITPLANES                                                                                       ; Clear fast bitplanes
                           ENABLE_CLIPPING
                           RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

                           move.w                                        #0,d0
                           move.w                                        #0,d1
                           jsr                                           TRANSLATE

                           ROTATE                                        #90

                           move.w                                        #160,d0
                           move.w                                        #123,d1

                           move.w                                        #155,d6
                           move.w                                        #128,d3

                           move.w                                        #165,d4
                           move.w                                        #128,d5
	
                           bsr.w                                         TRIANGLE

                           DISABLE_CLIPPING

                           processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
                           rts


_drawing_test18:
	
                           CLEARFASTBITPLANES                                                                                       ; Clear fast bitplanes
                           ENABLE_CLIPPING
                           RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

                           move.w                                        #0,d0
                           move.w                                        #0,d1
                           jsr                                           TRANSLATE

                           ROTATE                                        #38

                           move.w                                        #160,d0
                           move.w                                        #123,d1

                           move.w                                        #155,d6
                           move.w                                        #128,d3

                           move.w                                        #165,d4
                           move.w                                        #128,d5
                           STROKE                                        #3
	
                           bsr.w                                         TRIANGLE

                           STROKE                                        #1

                           DISABLE_CLIPPING

                           processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
                           rts

_drawing_test19:
	
                           CLEARFASTBITPLANES                                                                                       ; Clear fast bitplanes
                           ENABLE_CLIPPING
                           RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

                           ROTATE                                        #292
                           STROKE                                        #2


                           move.w                                        #160-10,d0
                           move.w                                        #128-10,d1
                           move.w                                        #20,d5
                           bsr.w                                         SQUARE      
	
                           DISABLE_CLIPPING

                           processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
                           rts

AMMX_FILL_FUNCT_ADDR_OLD:  dc.l                                          0
_drawing_test20:
	
                           CLEARFASTBITPLANES                                                                                       ; Clear fast bitplanes
	
                           RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

                           move.w                                        #160,d0
                           move.w                                        #128,d1
                           jsr                                           TRANSLATE

                           move.w                                        #0,d0
                           move.w                                        #-5,d1

                           move.w                                        #-5,d6
                           move.w                                        #5,d3

                           move.w                                        #5,d4
                           move.w                                        #5,d5

                           move.l                                        AMMX_FILL_FUNCT_ADDR,AMMX_FILL_FUNCT_ADDR_OLD
                           move.l                                        #ammx_fill_table_blit,AMMX_FILL_FUNCT_ADDR
                           bsr.w                                         TRIANGLE

                           processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
                           move.l                                        AMMX_FILL_FUNCT_ADDR_OLD,AMMX_FILL_FUNCT_ADDR
                           rts

_drawing_test21:
                           RESETFILLYVALS
                           CLEARFASTBITPLANES                                                                                       ; Clear fast bitplanes
	
                           move.w                                        #160,d0
                           move.w                                        #128,d1
                           jsr                                           LOADIDENTITYANDTRANSLATE

                           move.w                                        #0,d0
                           move.w                                        #-5,d1

                           move.w                                        #-5,d6
                           move.w                                        #5,d3

                           move.w                                        #5,d4
                           move.w                                        #5,d5

                           move.l                                        AMMX_FILL_FUNCT_ADDR,AMMX_FILL_FUNCT_ADDR_OLD

                           move.l                                        #ammx_fill_table_blit,AMMX_FILL_FUNCT_ADDR
                           bsr.w                                         TRIANGLE

                           processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
                           move.l                                        #FILLTABLE_FRAME_MIN_Y,d0
                           move.l                                        AMMX_FILL_FUNCT_ADDR_OLD,AMMX_FILL_FUNCT_ADDR

                           rts

_drawing_test22:
                           CLEARFASTBITPLANES                                                                                       ; Clear fast bitplanes
	
                           RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

                           move.w                                        #160,d0
                           move.w                                        #128,d1
                           jsr                                           TRANSLATE

                           ; flip horizontally (scale (-1,1))
                          FLIPX

                           move.w                                        #-10,d0
                           move.w                                        #0,d1

                           move.w                                        #-10,d6
                           move.w                                        #100,d3

                           move.w                                        #10,d4
                           move.w                                        #100,d5

                           STROKE                                        #3
                           bsr.w                                         TRIANGLE

                           ; output must be a triangle like this
                           ;
                           ;      /|
                           ;     / |
                           ;    /  |
                           ;   /   |
                           ;  /____|

                           processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
                           rts

_drawing_test23:
                           CLEARFASTBITPLANES                                                                                       ; Clear fast bitplanes
	
                           RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

                           move.w                                        #160,d0
                           move.w                                        #128,d1
                           jsr                                           TRANSLATE

                           ; flip vertically (scale (1,-1))
                          FLIPY

                           move.w                                        #-10,d0
                           move.w                                        #0,d1

                           move.w                                        #-10,d6
                           move.w                                        #100,d3

                           move.w                                        #10,d4
                           move.w                                        #100,d5

                           STROKE                                        #3
                           bsr.w                                         TRIANGLE

                           ; output must be a triangle like this
                           ;  ______
                           ;  |    /
                           ;  |   / 
                           ;  |  /  
                           ;  | /   
                           ;  |/

                           processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
                           rts

_drawing_test24:
                           CLEARFASTBITPLANES                                                                                       ; Clear fast bitplanes
	
                           RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

                           move.w                                        #160,d0
                           move.w                                        #128,d1
                           jsr                                           TRANSLATE

                           ; flip horizontally and vertically (scale (-1,-1))
                          FLIPXY

                           move.w                                        #-10,d0
                           move.w                                        #0,d1

                           move.w                                        #-10,d6
                           move.w                                        #100,d3

                           move.w                                        #10,d4
                           move.w                                        #100,d5

                           STROKE                                        #3
                           bsr.w                                         TRIANGLE

                           ; output must be a triangle like this
                           ;  ______
                           ;  \    |
                           ;   \   | 
                           ;    \  |  
                           ;     \ |
                           ;      \|

                           processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
                           rts
