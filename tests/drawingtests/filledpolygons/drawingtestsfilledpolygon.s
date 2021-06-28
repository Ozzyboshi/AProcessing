  XDEF                                          _drawing_test1
  XDEF                                          _drawing_test2
  XDEF                                          _drawing_test3
  XDEF                                          _drawing_test4
  XDEF                                          _drawing_test5
  XDEF                                          _drawing_test6
  XDEF                                          _drawing_test7

  SECTION                                       PROCESSING,CODE_F

  include                                       "../../../libs/rasterizers/globaloptions.s"
  include                                       "../../../libs/ammxmacros.i"
  include                                       "../../../libs/matrix/matrix.s"
  include                                       "../../../libs/matrix/scale.s"
  include                                       "../../../libs/trigtables.i"
  include                                       "../../../libs/rasterizers/processing_bitplanes_fast.s"
  include                                       "../../../libs/rasterizers/processing_table_plotrefs.s"
  include                                       "../../../libs/rasterizers/processingclearfunctions.s"
  include                                       "../../../libs/rasterizers/point.s"
  include                                       "../../../libs/rasterizers/square.s"
  include                                       "../../../libs/rasterizers/triangle.s"
  include                                       "../../../libs/rasterizers/rectangle.s"
  include                                       "../../../libs/rasterizers/circle.s"
  include                                       "../../../libs/rasterizers/processingfill.s"

_drawing_test1:
	;movem.l        d0-d7/a0-a6,-(sp)
	
  CLEARFASTBITPLANES                                                                                       ; Clear fast bitplanes
  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6


  move.w                                        #160,d0
  move.w                                        #128,d1
  bsr.w                                         TRANSLATE


  ROTATE                                        #45



  move.w                                        #-5,d0
  move.w                                        #-5,d1
  move.w                                        #10,d5

  bsr.w                                         SQUARE                                                     ;#-5,#-5,#10

  bsr.w                                         processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
	;movem.l        (sp)+,d0-d7/a0-a6
  rts

_drawing_test2:
	;movem.l        d0-d7/a0-a6,-(sp)
	
  CLEARFASTBITPLANES                                                                                       ; Clear fast bitplanes
	
  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

	


  move.w                                        #160,d0
  move.w                                        #128,d1
  bsr.w                                         TRANSLATE

  ROTATE                                        #0

  move.w                                        #0,d0
  move.w                                        #-5,d1

  move.w                                        #-5,d6
  move.w                                        #5,d3

  move.w                                        #5,d4
  move.w                                        #5,d5

	
  bsr.w                                         TRIANGLE

  bsr.w                                         processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
	;movem.l        (sp)+,d0-d7/a0-a6
  rts

_drawing_test3:
	;movem.l        d0-d7/a0-a6,-(sp)
	
  CLEARFASTBITPLANES                                                                                       ; Clear fast bitplanes
	
  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

	


  move.w                                        #160,d0
  move.w                                        #128,d1
  bsr.w                                         TRANSLATE

  ROTATE                                        #180

  move.w                                        #0,d0
  move.w                                        #-5,d1

  move.w                                        #-5,d6
  move.w                                        #5,d3

  move.w                                        #5,d4
  move.w                                        #5,d5

	
  bsr.w                                         TRIANGLE

  bsr.w                                         processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
	;movem.l        (sp)+,d0-d7/a0-a6
  rts

_drawing_test4:
	;movem.l        d0-d7/a0-a6,-(sp)
	
  CLEARFASTBITPLANES                                                                                       ; Clear fast bitplanes
	
  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

  move.w                                        #160,d0
  move.w                                        #128,d1
  bsr.w                                         TRANSLATE

  ROTATE                                        #0

  move.w                                        #-5,d0
  move.w                                        #-10,d1

  move.w                                        #10,d5
  move.w                                        #20,d6

  bsr.w                                         RECT

  bsr.w                                         processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
	;movem.l        (sp)+,d0-d7/a0-a6
  rts

_drawing_test5:
	;movem.l        d0-d7/a0-a6,-(sp)
	
  CLEARFASTBITPLANES                                                                                       ; Clear fast bitplanes
	
  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

  move.w                                        #160,d0
  move.w                                        #128,d1
  bsr.w                                         TRANSLATE

  ROTATE                                        #30

  move.w                                        #-5,d0
  move.w                                        #-10,d1

  move.w                                        #10,d5
  move.w                                        #20,d6

  bsr.w                                         RECT

  bsr.w                                         processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
	;movem.l        (sp)+,d0-d7/a0-a6
  rts

_drawing_test6:
	;movem.l        d0-d7/a0-a6,-(sp)
	
  CLEARFASTBITPLANES                                                                                       ; Clear fast bitplanes
	
  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

  move.w                                        #160,d0
  move.w                                        #128,d1
  bsr.w                                         TRANSLATE

	; scale 0,5 on Y axis
  move.w                                        #%0000000001000000,d0
  move.w                                        #%0000000000100000,d1
  bsr.w                                         SCALE

  move.w                                        #-5,d0
  move.w                                        #-10,d1

  move.w                                        #10,d5
  move.w                                        #20,d6

  bsr.w                                         RECT

  bsr.w                                         processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
	;movem.l        (sp)+,d0-d7/a0-a6
  rts

_drawing_test7:
	movem.l        d2,-(sp)
	
  CLEARFASTBITPLANES                                                                                       ; Clear fast bitplanes
	
  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

  move.w                                        #160,d0
  move.w                                        #128,d1
  bsr.w                                         TRANSLATE

  move.w                                        #0,d0
  move.w                                        #0,d1

  move.w                                        #10,d2

  bsr.w                                         CIRCLE

  bsr.w                                         processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  movem.l        (sp)+,d2
  rts