


; first point d0,d1
; second point d6,d3
; third point d4,d5

TRIANGLE:
    movem.l d0-d7/a0-a1,-(sp)
    ;RESETFILLTABLE

    
    POINT_TRANSFORM_AND_STORE_IN_FILLTABLE_FIRST d0,d1,0
    POINT_TRANSFORM_AND_STORE_IN_FILLTABLE d6,d3,4
    bsr.w ammxlinefill
    
    POINT_TRANSFORM_AND_STORE_IN_FILLTABLE d4,d5,4
    bsr.w ammxlinefill
    
    POINT_TRANSFORM_AND_STORE_IN_FILLTABLE d6,d3,0
    bsr.w ammxlinefill
    
    bsr.w ammx_fill_table

    movem.l (sp)+,d0-d7/a0-a1
    rts

