; first point d0,d1
; second point d6,d3
; third point d4,d5
  IFD                                          USE_3D
TRIANGLE3D:
  movem.l                                      d0-d6/a1,-(sp)

  POINT_TRANSFORM_AND_STORE_IN_FILLTABLE_3D    VERTEX_LIST_3D_1,VERTEX_LIST_3D_1+2,VERTEX_LIST_3D_1+4,0
  POINT_TRANSFORM_AND_STORE_IN_FILLTABLE_3D    VERTEX_LIST_3D_2,VERTEX_LIST_3D_2+2,VERTEX_LIST_3D_2+4,4
  bsr.w                                        ammxlinefill
    
  POINT_TRANSFORM_AND_STORE_IN_FILLTABLE_3D    VERTEX_LIST_3D_3,VERTEX_LIST_3D_3+2,VERTEX_LIST_3D_3+4,4
  bsr.w                                        ammxlinefill
    
  POINT_TRANSFORM_AND_STORE_IN_FILLTABLE_3D    VERTEX_LIST_3D_2,VERTEX_LIST_3D_2+2,VERTEX_LIST_3D_2+4,0
  bsr.w                                        ammxlinefill

  move.l                                       AMMX_FILL_FUNCT_ADDR(PC),a1
  jsr                                          (a1)

  movem.l                                      (sp)+,d0-d6/a1
  rts

TRIANGLE3D_NODRAW:
  movem.l                                      d0-d6/a1,-(sp)

  POINT_TRANSFORM_AND_STORE_IN_FILLTABLE_3D    VERTEX_LIST_3D_1,VERTEX_LIST_3D_1+2,VERTEX_LIST_3D_1+4,0
  POINT_TRANSFORM_AND_STORE_IN_FILLTABLE_3D    VERTEX_LIST_3D_2,VERTEX_LIST_3D_2+2,VERTEX_LIST_3D_2+4,4
  bsr.w                                        ammxlinefill
    
  POINT_TRANSFORM_AND_STORE_IN_FILLTABLE_3D    VERTEX_LIST_3D_3,VERTEX_LIST_3D_3+2,VERTEX_LIST_3D_3+4,4
  bsr.w                                        ammxlinefill
    
  POINT_TRANSFORM_AND_STORE_IN_FILLTABLE_3D    VERTEX_LIST_3D_2,VERTEX_LIST_3D_2+2,VERTEX_LIST_3D_2+4,0
  bsr.w                                        ammxlinefill

  movem.l                                      (sp)+,d0-d6/a1
  rts
  ENDC