; first point d0,d1
; second point d6,d3
; third point d4,d5

TRIANGLE:
  movem.l                                   d0-d6/a1,-(sp)
    
  POINT_TRANSFORM_AND_STORE_IN_FILLTABLE    d0,d1,0
  POINT_TRANSFORM_AND_STORE_IN_FILLTABLE    d6,d3,4
  bsr.w                                     ammxlinefill
    
  POINT_TRANSFORM_AND_STORE_IN_FILLTABLE    d4,d5,4
  bsr.w                                     ammxlinefill
    
  POINT_TRANSFORM_AND_STORE_IN_FILLTABLE    d6,d3,0
  bsr.w                                     ammxlinefill
    
  move.l                                    AMMX_FILL_FUNCT_ADDR,a1
  jsr                                       (a1)

  movem.l                                   (sp)+,d0-d6/a1
  rts

TRIANGLE_NODRAW:
  movem.l                                   d0-d6/a1,-(sp)
    
  POINT_TRANSFORM_AND_STORE_IN_FILLTABLE    d0,d1,0
  POINT_TRANSFORM_AND_STORE_IN_FILLTABLE    d6,d3,4
  bsr.w                                     ammxlinefill
    
  POINT_TRANSFORM_AND_STORE_IN_FILLTABLE    d4,d5,4
  bsr.w                                     ammxlinefill
    
  POINT_TRANSFORM_AND_STORE_IN_FILLTABLE    d6,d3,0
  bsr.w                                     ammxlinefill
  movem.l                                   (sp)+,d0-d6/a1

  rts