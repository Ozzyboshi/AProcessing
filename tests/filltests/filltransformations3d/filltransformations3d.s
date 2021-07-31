  XDEF                                          _filltransformations3d_test1
  XDEF                                          _filltransformations3d_test2
  XDEF                                          _filltransformations3d_test3

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
  include                                       "../../../libs/rasterizers/clipping.s"



_filltransformations3d_test1:

  movem.l                                       d2,-(sp)

  LOADIDENTITY

  move.w                                        #50,d0
  move.w                                        #50,d1
  move.w                                        #-50,d2

  bsr.w                                         point_execute_transformation_3d
  bsr.w                                         point_project_3d

  lea                                           LINEVERTEX_START_FINAL,a1
  move.w                                        d0,(a1)+
  move.w                                        d1,(a1)+

  move.l #LINEVERTEX_START_FINAL,d0
  movem.l                                       (sp)+,d2
  rts

_filltransformations3d_test2:

  movem.l                                       d2,-(sp)

  LOADIDENTITY

  move.w                                        #50,d0
  move.w                                        #50,d1
  move.w                                        #0,d2

  bsr.w                                         point_execute_transformation_3d
  bsr.w                                         point_project_3d

  lea                                           LINEVERTEX_START_FINAL,a1
  move.w                                        d0,(a1)+
  move.w                                        d1,(a1)+

  move.l #LINEVERTEX_START_FINAL,d0
  movem.l                                       (sp)+,d2
  rts

_filltransformations3d_test3:

  movem.l                                       d2,-(sp)

  LOADIDENTITY

  move.w #50,d0
  move.w #50,d1
  move.w #-50,d2

  bsr.w TRANSLATE3D

  move.w                                        #0,d0
  move.w                                        #0,d1
  move.w                                        #1,d2

  bsr.w                                         point_execute_transformation_3d
  bsr.w                                         point_project_3d

  lea                                           LINEVERTEX_START_FINAL,a1
  move.w                                        d0,(a1)+
  move.w                                        d1,(a1)+
  move.w                                        d2,(a1)+

  move.l #LINEVERTEX_START_FINAL,d0
  movem.l                                       (sp)+,d2
  rts
