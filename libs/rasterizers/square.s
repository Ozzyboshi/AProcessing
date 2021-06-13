SQUARE:
    movem.l d0-d6/a0-a6,-(sp)

    RESETFILLTABLE
    lea LINEVERTEX_START_FINAL,a1
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
    add.w d2,d0
    bsr.w point_execute_transformation
    ; save transformed values
    move.w d0,(a1)+
    move.w d1,(a1)+
    bsr.w ammxlinefill

    ; restore first point
    move.w d6,d0
    move.w d7,d1
    ; add height
    add.w d2,d1

    bsr.w point_execute_transformation
    ; save transformed values
    move.w d0,(a1)+
    move.w d1,(a1)+

    ; restore first point
    move.w d6,d0
    move.w d7,d1
    ; add height and width
    add.w d2,d0
    add.w d2,d1
    bsr.w point_execute_transformation
    ; save transformed values
    move.w d0,(a1)+
    move.w d1,(a1)+



    move.w #100,AMMXFILLTABLE_CURRENT_ROW
	move.w #200,AMMXFILLTABLE_END_ROW

    bsr.w ammx_fill_table



    movem.l d0-d6/a0-a6,-(sp)

    rts