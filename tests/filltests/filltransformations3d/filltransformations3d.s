  XDEF                                         _filltransformations3d_test1
  XDEF                                         _filltransformations3d_test2
  XDEF                                         _filltransformations3d_test3
  XDEF                                         _filltransformations3d_test4
  XDEF                                         _filltransformations3d_test5
  XDEF                                         _filltransformations3d_test6
  XDEF                                         _filltransformations3d_test7
  XDEF                                         _filltransformations3d_test8
  XDEF                                         _filltransformations3d_test9

  SECTION                                      PROCESSING,CODE_F
  include                                      "../../../libs/rasterizers/globaloptions.s"
  include                                      "../../../libs/ammxmacros.i"
  include                                      "../../../libs/matrix/matrixcommon.s"
  include                                      "../../../libs/matrix/matrix.s"
  include                                      "../../../libs/matrix/scale.s"
  include                                      "../../../libs/trigtables.i"
  include                                      "../../../libs/rasterizers/3dglobals.i"
  include                                      "../../../libs/rasterizers/processing_bitplanes_fast.s"
  include                                      "../../../libs/rasterizers/processing_table_plotrefs.s"
  include                                      "../../../libs/rasterizers/processingclearfunctions.s"
  include                                      "../../../libs/rasterizers/point.s"
  include                                       "../../../libs/matrix/point.s"
  include                                      "../../../libs/rasterizers/square.s"
  include                                      "../../../libs/rasterizers/triangle3d.s"
  include                                      "../../../libs/rasterizers/rectangle.s"
  include                                      "../../../libs/rasterizers/circle.s"
  include                                      "../../../libs/rasterizers/processingfill.s"
  include                                      "../../../libs/rasterizers/clipping.s"



_filltransformations3d_test1:

  movem.l                                      d2,-(sp)

  LOADIDENTITY

  move.w                                       #50,d0
  move.w                                       #50,d1
  move.w                                       #-50,d2

  bsr.w                                        point_execute_transformation_3d
  bsr.w                                        point_project_3d

  lea                                          LINEVERTEX_START_FINAL,a1
  move.w                                       d0,(a1)+
  move.w                                       d1,(a1)+

  move.l                                       #LINEVERTEX_START_FINAL,d0
  movem.l                                      (sp)+,d2
  rts

_filltransformations3d_test2:

  movem.l                                      d2,-(sp)

  LOADIDENTITY

  move.w                                       #50,d0
  move.w                                       #50,d1
  move.w                                       #0,d2

  bsr.w                                        point_execute_transformation_3d
  bsr.w                                        point_project_3d

  lea                                          LINEVERTEX_START_FINAL,a1
  move.w                                       d0,(a1)+
  move.w                                       d1,(a1)+

  move.l                                       #LINEVERTEX_START_FINAL,d0
  movem.l                                      (sp)+,d2
  rts

_filltransformations3d_test3:

  movem.l                                      d2,-(sp)

  LOADIDENTITY

  move.w                                       #50,d0
  move.w                                       #50,d1
  move.w                                       #-50,d2

  jsr                                          TRANSLATE3D

  move.w                                       #0,d0
  move.w                                       #0,d1
  move.w                                       #1,d2

  bsr.w                                        point_execute_transformation_3d
  bsr.w                                        point_project_3d

  lea                                          LINEVERTEX_START_FINAL,a1
  move.w                                       d0,(a1)+
  move.w                                       d1,(a1)+
  move.w                                       d2,(a1)+

  move.l                                       #LINEVERTEX_START_FINAL,d0
  movem.l                                      (sp)+,d2
  rts


_filltransformations3d_test4:

  movem.l                                      d2,-(sp)
  RESETFILLTABLE
  LOADIDENTITY

  move.w                                       #0,d0
  move.w                                       #0,d1
  move.w                                       #1,d2

  jsr                                          TRANSLATE3D

  move.w                                       #10,d0
  move.w                                       #10,d1
  move.w                                       #0,d2

  POINT_TRANSFORM_AND_STORE_IN_FILLTABLE_3D    d0,d1,d2,0

  move.w                                       #-10,d0
  move.w                                       #10,d1
  move.w                                       #0,d2

  POINT_TRANSFORM_AND_STORE_IN_FILLTABLE_3D    d0,d1,d2,4

  move.l                                       #LINEVERTEX_START_FINAL,d0
  movem.l                                      (sp)+,d2
  rts

_filltransformations3d_test5:

  movem.l                                      d2,-(sp)
  RESETFILLTABLE
  LOADIDENTITY

  VERTEX_INIT                                  1,#0,#-5,#0
  VERTEX_INIT                                  2,#10,#10,#0
  VERTEX_INIT                                  3,#-10,#10,#0
  
  POINT_TRANSFORM_AND_STORE_IN_FILLTABLE_3D    VERTEX_LIST_3D_1,VERTEX_LIST_3D_1+2,VERTEX_LIST_3D_1+4,0
  POINT_TRANSFORM_AND_STORE_IN_FILLTABLE_3D    VERTEX_LIST_3D_2,VERTEX_LIST_3D_2+2,VERTEX_LIST_3D_2+4,4
  bsr.w                                        ammxlinefill
    
  POINT_TRANSFORM_AND_STORE_IN_FILLTABLE_3D    VERTEX_LIST_3D_3,VERTEX_LIST_3D_3+2,VERTEX_LIST_3D_3+4,4
  bsr.w                                        ammxlinefill
    
  POINT_TRANSFORM_AND_STORE_IN_FILLTABLE_3D    VERTEX_LIST_3D_1,VERTEX_LIST_3D_1+2,VERTEX_LIST_3D_1+4,0
  bsr.w                                        ammxlinefill

  bsr.w                                        processing_fill_table_addr
  movem.l                                      (sp)+,d2
  rts

_filltransformations3d_test6:

  movem.l                                      d2,-(sp)
  RESETFILLTABLE
  LOADIDENTITY

  VERTEX_INIT                                  1,#0,#-5,#0
  VERTEX_INIT                                  2,#10,#10,#-200
  VERTEX_INIT                                  3,#-10,#10,#0
  
  POINT_TRANSFORM_AND_STORE_IN_FILLTABLE_3D    VERTEX_LIST_3D_1,VERTEX_LIST_3D_1+2,VERTEX_LIST_3D_1+4,0
  POINT_TRANSFORM_AND_STORE_IN_FILLTABLE_3D    VERTEX_LIST_3D_2,VERTEX_LIST_3D_2+2,VERTEX_LIST_3D_2+4,4
  
  bsr.w                                        ammxlinefill
    
  POINT_TRANSFORM_AND_STORE_IN_FILLTABLE_3D    VERTEX_LIST_3D_3,VERTEX_LIST_3D_3+2,VERTEX_LIST_3D_3+4,4
  bsr.w                                        ammxlinefill
    
  POINT_TRANSFORM_AND_STORE_IN_FILLTABLE_3D    VERTEX_LIST_3D_1,VERTEX_LIST_3D_1+2,VERTEX_LIST_3D_1+4,0
  bsr.w                                        ammxlinefill

  bsr.w                                        processing_fill_table_addr
  movem.l                                      (sp)+,d2
  rts


_filltransformations3d_test7:
  RESETFILLTABLE
  LOADIDENTITY
  move.w                                       #0,d0
  move.w                                       #0,d1
  jsr                                          TRANSLATE

  ROTATE_X_INV_Q_5_11                          #180

  move.w                                       #-5,d0
  move.w                                       #-5,d1

  ; start of square
  bsr.w                                        point_execute_transformation

  ; save transformed values
  lea                                          LINEVERTEX_START_FINAL,a1
  move.w                                       d0,(a1)+
  move.w                                       d1,(a1)+

  move.l                                       #LINEVERTEX_START_FINAL,d0

  rts

_filltransformations3d_test8:
  movem.l                                      d2,-(sp)
  RESETFILLTABLE
  
  LOADIDENTITY
  ROTATE_X_INV_Q_5_11                          #90

  move.w                                       #-50,d0
  move.w                                       #50,d1
  move.w                                       #0,d2

  ; start of square
  bsr.w                                        point_execute_transformation_3d
  bsr.w                                        point_project_3d

  ; save transformed values
  lea                                          LINEVERTEX_START_FINAL,a1
  move.w                                       d0,(a1)+
  move.w                                       d1,(a1)+

  move.l                                       #LINEVERTEX_START_FINAL,d0
  movem.l                                      (sp)+,d2
  rts

_filltransformations3d_test9:
  movem.l                                      d2,-(sp)
  RESETFILLTABLE
  
  LOADIDENTITY
  ROTATE_Y_INV_Q_5_11                          #90

  move.w                                       #-50,d0
  move.w                                       #50,d1
  move.w                                       #0,d2

  ; start of square
  bsr.w                                        point_execute_transformation_3d
  bsr.w                                        point_project_3d

  ; save transformed values
  lea                                          LINEVERTEX_START_FINAL,a1
  move.w                                       d0,(a1)+
  move.w                                       d1,(a1)+

  move.l                                       #LINEVERTEX_START_FINAL,d0
  movem.l                                      (sp)+,d2
  rts