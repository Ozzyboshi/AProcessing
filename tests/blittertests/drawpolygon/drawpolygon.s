  XDEF                                          _drawpolygon_test1
  XDEF                                          _drawpolygon_test2
  XDEF                                          _drawpolygon_test3
  XDEF                                          _drawpolygon_test4
  XDEF                                          _drawpolygon_test5
  XDEF                                          _drawpolygon_test6
  XDEF                                          _drawpolygon_test7
  XDEF                                          _drawpolygon_test8
  XDEF                                          _drawpolygon_test9

  include                                       "../../../libs/rasterizers/processing_bitplanes_fast.s"
  include                                       "../../../libs/rasterizers/globaloptions.s"
  include                                       "../../../libs/ammxmacros.i"
  include                                       "../../../libs/matrix/matrixcommon.s"
  include                                       "../../../libs/matrix/matrix.s"
  include                                       "../../../libs/rasterizers/point.s"
  include                                       "../../../libs/matrix/point.s"
  include                                       "../../../libs/matrix/matrixreg.s"
  include                                       "../../../libs/matrix/pointreg.s"
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

  VERTEX2D_INIT_I                               1,0000,0000
  VERTEX2D_INIT_I                               2,FFF6,000A
  VERTEX2D_INIT_I                               3,000A,000A


  lea                                           OFFBITPLANEMEM,a4
  jsr                                           TRIANGLE_BLIT

  WAITBLITTER
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
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

  VERTEX2D_INIT_I                               1,0000,0000
  VERTEX2D_INIT_I                               2,FFF6,000A
  VERTEX2D_INIT_I                               3,000A,000A

  lea                                           OFFBITPLANEMEM,a4
  jsr                                           TRIANGLE_BLIT
  
  WAITBLITTER
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                                        (sp)+,d2
  rts

_drawpolygon_test3:
  move.l                                        d2,-(sp)
  CLEARFASTBITPLANES
  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

  MOVE.W                                        #%1000001111000000,$dff096

  move.w                                        #30,d0
  move.w                                        #128+30,d1
  jsr                                           TRANSLATE

  ROTATE                                        #0

  VERTEX2D_INIT                                 1,#-15,#-26
  VERTEX2D_INIT                                 2,#-30,#0
  VERTEX2D_INIT                                 3,#0,#0

  STROKE                                        #1
  FILL                                          #2

  lea                                           OFFBITPLANEMEM,a4
  jsr                                           TRIANGLE_BLIT

  WAITBLITTER
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                                        (sp)+,d2
  rts

_drawpolygon_test4:
  move.l                                        d2,-(sp)
  CLEARFASTBITPLANES
  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

  MOVE.W                                        #%1000001111000000,$dff096

  move.w                                        #30,d0
  move.w                                        #30,d1
  jsr                                           TRANSLATE

  ROTATE                                        #246

  VERTEX2D_INIT                                 1,#-15,#-26
  VERTEX2D_INIT                                 2,#-30,#0
  VERTEX2D_INIT                                 3,#0,#0

  STROKE                                        #1
  FILL                                          #2

  lea                                           OFFBITPLANEMEM,a4
  jsr                                           TRIANGLE_BLIT

  WAITBLITTER
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                                        (sp)+,d2
  rts

_drawpolygon_test5:
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
  VERTEX2D_INIT                                 2,#-10,#100
  VERTEX2D_INIT                                 3,#10,#100


  lea                                           OFFBITPLANEMEM,a4
  jsr                                           TRIANGLE_BLIT

  WAITBLITTER
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                                        (sp)+,d2
  rts

_drawpolygon_test6:
  move.l                                        d2,-(sp)
  CLEARFASTBITPLANES
  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6
         
  MOVE.W                                        #%1000001111000000,$dff096

  move.w                                        #160,d0
  move.w                                        #128,d1
  jsr                                           TRANSLATE
  ROTATE                                        #71

  STROKE                                        #3
  FILL                                          #1

  VERTEX2D_INIT                                 1,#0,#0
  VERTEX2D_INIT                                 2,#-10,#100
  VERTEX2D_INIT                                 3,#10,#100


  lea                                           OFFBITPLANEMEM,a4
  jsr                                           TRIANGLE_BLIT

  WAITBLITTER
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                                        (sp)+,d2
  rts

_drawpolygon_test7:
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
  VERTEX2D_INIT                                 2,#-100,#10
  VERTEX2D_INIT                                 3,#100,#10


  lea                                           OFFBITPLANEMEM,a4
  jsr                                           TRIANGLE_BLIT

  WAITBLITTER
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                                        (sp)+,d2
  rts

_drawpolygon_test8:
  move.l                                        d2,-(sp)
  CLEARFASTBITPLANES
  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6
         
  MOVE.W                                        #%1000001111000000,$dff096

  move.w                                        #160,d0
  move.w                                        #128,d1
  jsr                                           TRANSLATE
  ROTATE                                        #17

  STROKE                                        #3
  FILL                                          #2

  VERTEX2D_INIT                                 1,#0,#0
  VERTEX2D_INIT                                 2,#-100,#10
  VERTEX2D_INIT                                 3,#100,#10


  lea                                           OFFBITPLANEMEM,a4
  jsr                                           TRIANGLE_BLIT

  WAITBLITTER
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                                        (sp)+,d2
  rts

_drawpolygon_test9:
  move.l                                        d2,-(sp)
  CLEARFASTBITPLANES
  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6
         
  MOVE.W                                        #%1000001111000000,$dff096

  moveq                  #30,d0
  move.w                 #184,d1
  jsr                    LOADIDENTITYANDTRANSLATE

  STROKE #1
  FILL #1
  VERTEX2D_INIT          1,#-15,#-26
  VERTEX2D_INIT          2,#-30,#0
  VERTEX2D_INIT          3,#0,#0

  lea                    OFFBITPLANEMEM,a4
  jsr                    TRIANGLE_BLIT

  WAITBLITTER
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                                        (sp)+,d2
  rts