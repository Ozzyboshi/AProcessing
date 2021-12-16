  XDEF                                          _drawpolygon_test1
  XDEF                                          _drawpolygon_test2

  include                                       "../../../libs/rasterizers/processing_bitplanes_fast.s"
  include                                       "../../../libs/rasterizers/globaloptions.s"
  include                                       "../../../libs/ammxmacros.i"
  include                                       "../../../libs/matrix/matrix.s"
  include                                       "../../../libs/rasterizers/point.s"
  include                                       "../../../libs/blitter/triangle.s"
  include                                       "../../../libs/trigtables.i"
  include                                       "../../../libs/rasterizers/processing_table_plotrefs.s"
  include                                       "../../../libs/rasterizers/processingclearfunctions.s"
  ;include               "../../../libs/rasterizers/clipping.s"
  include                                       "../../../libs/blitter/offbitplanemem.i"
  include                                       "../../../libs/blitter/lines.s"

_drawpolygon_test1:
  move.l                                        d2,-(sp)
  CLEARFASTBITPLANES
  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6
         
  MOVE.W                                        #%1000001111000000,$dff096

  move.w                                        #160,d0
  move.w                                        #128,d1
  jsr                                           TRANSLATE

  STROKE                                        #1
  FILL                                          #3

  VERTEX2D_INIT                                 1,#0,#0
  VERTEX2D_INIT                                 2,#-10,#10
  VERTEX2D_INIT                                 3,#10,#10


  lea                                           OFFBITPLANEMEM,a4
  jsr                                           TRIANGLE_BLIT

  WAITBLITTER
  bsr.w                                         processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                                        (sp)+,d2
  rts

_drawpolygon_test2:
  move.l                                        d2,-(sp)
  CLEARFASTBITPLANES
  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6
         
  MOVE.W                                        #%1000001111000000,$dff096

  move.w                                        #160,d0
  move.w                                        #128,d1
  jsr                                           TRANSLATE

  ROTATE                                        #30
  
  STROKE                                        #1
  FILL                                          #3

  VERTEX2D_INIT                                 1,#0,#0
  VERTEX2D_INIT                                 2,#-10,#10
  VERTEX2D_INIT                                 3,#10,#10

  lea                                           OFFBITPLANEMEM,a4
  jsr                                           TRIANGLE_BLIT
  
  WAITBLITTER
  bsr.w                                         processing_bitplanes_fast_screen0
  move.l                                        (sp)+,d2
  rts
