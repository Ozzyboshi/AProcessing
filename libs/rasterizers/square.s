SQUARE:
    movem.l d0-d7/a0-a1,-(sp)

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
    bsr.w ammxlinefill

    ;bsr.w ammx_fill_table_clip
    move.l AMMX_FILL_FUNCT_ADDR,a0
    jsr (a0)

    movem.l (sp)+,d0-d7/a0-a1
    rts


SQUARE2:
    movem.l d0-d7/a0-a1,-(sp)

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
   ; bsr.w ammxlinefill

    
    move.w #1,AMMX_FILL_TABLE_FIRST_DRAW
    move.w #0,AMMXFILLTABLE_CURRENT_ROW
    move.w #0,AMMXFILLTABLE_END_ROW
    bsr.w ammx_fill_table_clip2
    ;move.l AMMX_FILL_FUNCT_ADDR,a0
    ;jsr (a0)

    movem.l (sp)+,d0-d7/a0-a1
    rts

ammx_fill_table_clip2:
	movem.l d0-d7/a0-a1,-(sp) ; stack save
	move.w #1,AMMX_FILL_TABLE_FIRST_DRAW

	lea FILL_TABLE,a0

	; Reposition inside the fill table according to the starting row
	move.w AMMXFILLTABLE_CURRENT_ROW,d6
	mulu.w #4,d6
	add.w d6,a0
	move.w AMMXFILLTABLE_CURRENT_ROW,d5
	; end of repositioning

ammx_fill_table_nextline_clip2:

	cmp.w AMMXFILLTABLE_END_ROW,d5
	bgt.s ammx_fill_table_end_clip2

	move.w (a0),d6 ; start of fill line
	move.w #$7FFF,(a0)+
	move.l #$013F0000,d7
	move.w (a0),d7 ; end of fill line
	move.w #$8000,(a0)+
	
	
	; clip start
	; if left is negative left is zero
	btst #15,d6
	seq d0
	ext.w d0
	and.w d0,d6
	
	; if right > screen resolution then right = screen resolution
	cmpi.w #319,d7
	sgt d0
	move.w #16,d1
	and.w d0,d1
	lsr.l d1,d7
	; clip end
	
	move.l #0,d6
    move.l #6,d7

    bsr.w ammx_fill_table_single_line
	add.w #1,d5
	move.w d5,AMMXFILLTABLE_CURRENT_ROW
	
	bra.w ammx_fill_table_nextline_clip2
ammx_fill_table_end_clip2:
	move.w #-1,AMMXFILLTABLE_END_ROW
	movem.l (sp)+,d0-d7/a0-a1
	rts