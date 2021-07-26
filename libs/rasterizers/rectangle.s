; first point d0,d1
; width d5
; height d6

RECT:
  movem.l                                   d0-d7/a0-a1,-(sp)
    
  ;line1 start
  move.w                                    d0,d3
  move.w                                    d1,d4
  POINT_TRANSFORM_AND_STORE_IN_FILLTABLE    d0,d1,0

  move.w                                    d3,d7
  add.w                                     d5,d7
  POINT_TRANSFORM_AND_STORE_IN_FILLTABLE    d7,d4,4
  bsr.w                                     ammxlinefill
  ;line 1 end
    
  ;line 2 start
  move.w                                    d3,d0
  move.w                                    d4,d1
  add.w                                     d6,d1
  POINT_TRANSFORM_AND_STORE_IN_FILLTABLE    d0,d1,4
  bsr.w                                     ammxlinefill
  ;line2 end
    

  ;line 3 start
  move.w                                    d3,d0
  add.w                                     d5,d0
  move.w                                    d4,d1
  add.w                                     d6,d1
  POINT_TRANSFORM_AND_STORE_IN_FILLTABLE    d0,d1,0

  bsr.w                                     ammxlinefill
  ;line 3 end
    

  ;line4 start
  move.w                                    d3,d0
  add.w                                     d5,d0
  POINT_TRANSFORM_AND_STORE_IN_FILLTABLE    d0,d4,4
  bsr.w                                     ammxlinefill
  ;line4 end
    
  move.l                                    AMMX_FILL_FUNCT_ADDR,a0
  jsr                                       (a0)

  movem.l                                   (sp)+,d0-d7/a0-a1
  rts

