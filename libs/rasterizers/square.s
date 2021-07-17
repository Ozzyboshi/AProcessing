SQUARE:
    movem.l d0-d7/a0-a1,-(sp)

    ;RESETFILLTABLE
    lea LINEVERTEX_START_FINAL,a1
    
    ; Start of line 1
    move.w d0,d6
    move.w d1,d7

	bsr.w point_execute_transformation

    ; save transformed values
    move.w d0,(a1)+
    move.w d1,(a1)+

    ; restore first point
    move.w d6,d0
    move.w d7,d1
    ; add width
    add.w d5,d0
    bsr.w point_execute_transformation
    ; save transformed values
    move.w d0,(a1)+
    move.w d1,(a1)+

    bsr.w ammxlinefill
    ; End of Line 1


    ; Start of line 2
    lea LINEVERTEX_START_FINAL,a1
    addq #4,a1

    ; restore first point
    move.w d6,d0
    move.w d7,d1
    ; add height
    add.w d5,d1

    bsr.w point_execute_transformation
    ; save transformed values
    move.w d0,(a1)
    move.w d1,2(a1)
    MINUWORD d1,AMMXFILLTABLE_CURRENT_ROW
    MAXUWORD d1,AMMXFILLTABLE_END_ROW
    bsr.w ammxlinefill
    ; End of line 2

    ; Start of line 3
    lea LINEVERTEX_START_FINAL,a1
    ; restore first point
    move.w d6,d0
    move.w d7,d1
    ; add height and width
    add.w d5,d0
    add.w d5,d1
    bsr.w point_execute_transformation
    ; save transformed values
    move.w d0,(a1)+
    move.w d1,(a1)+
    MINUWORD d1,AMMXFILLTABLE_CURRENT_ROW
    MAXUWORD d1,AMMXFILLTABLE_END_ROW
    bsr.w ammxlinefill
    ; ENd of line 3

    lea LINEVERTEX_START_FINAL,a1
    addq #4,a1
    ; restore first point
    move.w d6,d0
    move.w d7,d1
    ; add width
    add.w d5,d0
    bsr.w point_execute_transformation
    ; save transformed values
    move.w d0,(a1)+
    move.w d1,(a1)+
    MINUWORD d1,AMMXFILLTABLE_CURRENT_ROW
    MAXUWORD d1,AMMXFILLTABLE_END_ROW
    bsr.w ammxlinefill


    ;move.w #120,AMMXFILLTABLE_CURRENT_ROW
	;move.w #135,AMMXFILLTABLE_END_ROW

    bsr.w ammx_fill_table

    movem.l (sp)+,d0-d7/a0-a1
    rts