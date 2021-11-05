  IFD                                          USE_3D
FOURSIDEPOLYGON3D:
  movem.l                                      d0-d2/a1,-(sp)
  
  ; top line
  POINT_TRANSFORM_AND_STORE_IN_FILLTABLE_3D    VERTEX_LIST_3D_1,VERTEX_LIST_3D_1+2,VERTEX_LIST_3D_1+4,0
  POINT_TRANSFORM_AND_STORE_IN_FILLTABLE_3D    VERTEX_LIST_3D_2,VERTEX_LIST_3D_2+2,VERTEX_LIST_3D_2+4,4
  bsr.w                                        ammxlinefill

  ; left line
  POINT_TRANSFORM_AND_STORE_IN_FILLTABLE_3D    VERTEX_LIST_3D_3,VERTEX_LIST_3D_3+2,VERTEX_LIST_3D_3+4,4
  bsr.w                                        ammxlinefill

  ; bottom line
  POINT_TRANSFORM_AND_STORE_IN_FILLTABLE_3D    VERTEX_LIST_3D_4,VERTEX_LIST_3D_4+2,VERTEX_LIST_3D_4+4,0
  bsr.w                                        ammxlinefill

  ; right line
  POINT_TRANSFORM_AND_STORE_IN_FILLTABLE_3D    VERTEX_LIST_3D_2,VERTEX_LIST_3D_2+2,VERTEX_LIST_3D_2+4,4
  bsr.w                                        ammxlinefill

  move.l                                       AMMX_FILL_FUNCT_ADDR,a1
  jsr                                          (a1)

  movem.l                                      (sp)+,d0-d2/a1
  rts

FOURSIDEPOLYGON3D_NODRAW:
  movem.l                                      d0-d2/a1,-(sp)
  
  ; top line
  POINT_TRANSFORM_AND_STORE_IN_FILLTABLE_3D    VERTEX_LIST_3D_1,VERTEX_LIST_3D_1+2,VERTEX_LIST_3D_1+4,0
  POINT_TRANSFORM_AND_STORE_IN_FILLTABLE_3D    VERTEX_LIST_3D_2,VERTEX_LIST_3D_2+2,VERTEX_LIST_3D_2+4,4
  bsr.w                                        ammxlinefill

  ; left line
  POINT_TRANSFORM_AND_STORE_IN_FILLTABLE_3D    VERTEX_LIST_3D_3,VERTEX_LIST_3D_3+2,VERTEX_LIST_3D_3+4,4
  bsr.w                                        ammxlinefill

  ; bottom line
  POINT_TRANSFORM_AND_STORE_IN_FILLTABLE_3D    VERTEX_LIST_3D_4,VERTEX_LIST_3D_4+2,VERTEX_LIST_3D_4+4,0
  bsr.w                                        ammxlinefill

  ; right line
  POINT_TRANSFORM_AND_STORE_IN_FILLTABLE_3D    VERTEX_LIST_3D_2,VERTEX_LIST_3D_2+2,VERTEX_LIST_3D_2+4,4
  bsr.w                                        ammxlinefill

  movem.l                                      (sp)+,d0-d2/a1
  rts

  ENDC