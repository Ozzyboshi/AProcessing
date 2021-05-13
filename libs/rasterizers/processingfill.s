; Routines to fill areas inside polygons
; FILL_TABLE must contain correct values

AMMXFILLTABLE_CURRENT_ROW:
	dc.w 0

AMMXFILLTABLE_END_ROW:
	dc.w 0

	IFND VAMPIRE 
AMMXFILLTABLE_FILLDATA_BPL_0:
	dc.l 0
AMMXFILLTABLE_FILLDATA_BPL_1:
	dc.l 0
	ENDIF

ammx_fill_table:
	movem.l d0-d7/a0-a1,-(sp) ; stack save
	;move.w #0,AMMXFILLTABLE_CURRENT_ROW

	lea FILL_TABLE,a0

	; Reposition inside the fill table according to the starting row
	move.w AMMXFILLTABLE_CURRENT_ROW,d6
	mulu.w #4,d6
	add.w d6,a0
	; end of repositioning

ammx_fill_table_nextline:
	
	move.w AMMXFILLTABLE_CURRENT_ROW,d6
	cmp.w AMMXFILLTABLE_END_ROW,d6
	bhi.s ammx_fill_table_end

	move.w (a0),d6 ; start of fill line
	move.w #$FFFF,(a0)+
	move.w (a0),d7 ; end of fill line
	move.w #$FFFF,(a0)+

	; end when leftx OR rightX are equal to -1 (to be modified)
	;cmpi.w #$FFFF,d6
	;beq.s ammx_fill_table_end
	;cmpi.w #$FFFF,d7
	;beq.s ammx_fill_table_end
	
	
	bsr.w ammx_fill_table_single_line
	add.w #1,AMMXFILLTABLE_CURRENT_ROW
	
	bra.w ammx_fill_table_nextline
ammx_fill_table_end:
	movem.l (sp)+,d0-d7/a0-a1
	rts

ammx_fill_table_single_line:
	movem.l d0-d7/a0-a2,-(sp) ; stack save

	

	; d5 => totalcount
	; d3 / d4 => tmp

	; d6 => left X
	; d7 => right X

	;lea FILL_TABLE,a0
	;move.w (a0)+,d6 ; start of fill line
	;move.w (a0)+,d7 ; end of fill line

	move.w d7,d5 ; alternative to psubw
	sub.w d6,d5
	addq #1,d5

	; debug da cancellare
	;move.l par1,a3
	;move.w d5,(a3)+

	;psubw d7,d6,d5 ; d2 is now how many pixel we must fill

	; phaze 1 => align to nearest byte
	; address of the first point
	move.w d6,d0
	move.w AMMXFILLTABLE_CURRENT_ROW,d1
	lea PLOTREFS,a1

	add.w d1,d1
	move.w 0(a1,d1.w),d1
	move.w d0,d2
	lsr.w #3,d2
	add.w d2,d1
	;not.b d0
	lea SCREEN_0,a0
	;bset d0,(a0,d1.w) 
	
	; d1.w now has the address of the first byte let's calculate the fill for this byte
	move.w d6,d4
	andi.w #$0007,d4
	move.b #$FF,d3
	lsl.b d4,d3 
	lsr.b d4,d3

	add.l d1,a0
	;or.b d3,(a0)+
	;or.b d3,(a0,d1.w)

	; ALESSIO START MODIFICA (OR è STATO SPOSTATO SOTTO)
	;or.b d3,(a0,d1.w)

	; bitprocessed = 8-d4
	subi.b #8,d4 ; d4 must always be negative here!!!!
	ext.w d4
	add.w d4,d5 ; totalcount must be decremented by written bits (susing add because d4 is always negative)
	
	; special case -  if d5 is negative we plotted too much
	;cmpi.w #0,d5
	;bls.s ammx_fill_table_no_special_case
	bpl.s ammx_fill_table_no_special_case
    subq #1,d5
	not d5
	lsr.b d5,d3
	lsl.b d5,d3

	btst #1,STROKE_DATA
	beq.s ammx_fill_table_no_special_1
	or.b d3,256*40*1(a0) ; Plot points bpl1!!
ammx_fill_table_no_special_1
	btst #0,STROKE_DATA
	beq.s ammx_fill_table_no_special_0
	or.b d3,(a0)+ ; Plot points!!
ammx_fill_table_no_special_0:
	movem.l (sp)+,d0-d7/a0-a2
	rts

ammx_fill_table_no_special_case:
    ; end special case

	; reset bitplane data
	IFND VAMPIRE
	move.l #$00000000,AMMXFILLTABLE_FILLDATA_BPL_0
	move.l #$00000000,AMMXFILLTABLE_FILLDATA_BPL_1
	ENDIF
	IFD VAMPIRE
	load #$0000000000000000,e0
	load #$0000000000000000,e1
	ENDIF
    
	btst #1,STROKE_DATA
	beq.s ammx_fill_table_no_firstbyte_1
	or.b d3,256*40*1(a0) ; Plot points bpl1!!
	IFND VAMPIRE
	move.l #$FFFFFFFF,AMMXFILLTABLE_FILLDATA_BPL_1
	ENDIF
	IFD VAMPIRE
	load #$FFFFFFFFFFFFFFFF,e1
	ENDIF
ammx_fill_table_no_firstbyte_1:
	btst #0,STROKE_DATA
	beq.s ammx_fill_table_no_firstbyte_0
    or.b d3,(a0)+ ; Plot points!!
	IFND VAMPIRE
	move.l #$FFFFFFFF,AMMXFILLTABLE_FILLDATA_BPL_0
	ENDIF
	IFD VAMPIRE
	load #$FFFFFFFFFFFFFFFF,e0
	ENDIF
ammx_fill_table_no_firstbyte_0:
    ; ALESSIO END MODIFICA


	; bitprocessed = 8-d4 ma che ci stai a fare??? da cancellare
	;move.w d4,(a3)+
	;subi.b #8,d4 ; d4 must always be negative here!!!!
	;move.w d4,(a3)+
	;add.b d4,d5 ; totalcount must be decremented by written bits (susing add because d4 is always negative)
	;move.w d5,(a3)+

; start iteration until we are at the end
ammx_fill_table_startiter:

	; now we are byte aligned, evaluate how many bits we still have to fill
	cmpi.w #64,d5
	bcs.w ammx_fill_table_no64 ; branch if lower (it will continue if we have at least 64 bits to fill)
	; here starts the code to fill 64 bits
	IFD VAMPIRE
	move.l a0,a2
	add.l #256*40,a2
	store e1,(a2)+ ; second bitplane
	store e0,(a0)+ ; first bitplane
	ENDIF
	IFND VAMPIRE
	
	move.l a0,d0
	btst #0,d0
	beq.s ammx_fill_table_64_even
	;move.b #$FF,(a0)+
	;move.l  #$FFFFFFFF,(a0)+
    ;move.w  #$FFFF,(a0)+
    ;move.b #$FF,(a0)+
	
	move.l AMMXFILLTABLE_FILLDATA_BPL_1,d0
	move.l a0,a2
	add.l #256*40,a2
	or.b d0,(a2)+
	or.b d0,(a2)+
	or.w d0,(a2)+
    or.b d0,(a2)+

	move.l AMMXFILLTABLE_FILLDATA_BPL_0,d0
	or.b d0,(a0)+
	or.l  d0,(a0)+
    or.w  d0,(a0)+
    or.b d0,(a0)+

    subi.w #64,d5
	bra.w ammx_fill_table_check_if_other
 ammx_fill_table_64_even:
    ;move.l  #$FFFFFFFF,(a0)+
	;move.l  #$FFFFFFFF,(a0)+

	move.l AMMXFILLTABLE_FILLDATA_BPL_1,d0
	move.l a0,a2
	add.l #256*40,a2
	or.l  d0,(a2)+
	or.l  d0,(a2)+

	move.l AMMXFILLTABLE_FILLDATA_BPL_0,d0
	or.l  d0,(a0)+
	or.l  d0,(a0)+

	subi.w #64,d5
	bra.w ammx_fill_table_check_if_other

	ENDIF
	
	subi.w #64,d5
	bra.w ammx_fill_table_check_if_other
ammx_fill_table_no64:
	; todo - check less sig bit for move.l alignment, necessary on 68000
	cmpi.w #32,d5
	bcs.w ammx_fill_table_no32 ; branch if lower (it will continue if we have at least 32 bits to fill)
	move.l  #$FFFFFFFF,(a0)+
	subi.w #32,d5
	bra.w ammx_fill_table_check_if_other
ammx_fill_table_no32:
	; todo - check less sig bit for move.w alignment, necessary on 68000
	cmpi.w #16,d5
	bcs.w ammx_fill_table_no16 ; branch if lower (it will continue if we have at least 16 bits to fill)
	move.w  #$FFFF,(a0)+
	subi.w #16,d5
	bra.w ammx_fill_table_check_if_other
ammx_fill_table_no16:

	cmpi.w #8,d5
	bcs.w ammx_fill_table_no8 ; branch if lower (it will continue if we have at least 8 bits to fill)
	move.b  #$FF,(a0)+
	subi.w #8,d5
	bra.w ammx_fill_table_check_if_other
ammx_fill_table_no8:

	; we get here only and only if there is less then a byte to fill, in other words, d5<8
	; in this case we must fill the MSG bytes of the byte wit a 1
	move.b #$FF,d3
	moveq #8,d4
	sub.w d5,d4
	lsl.b d4,d3
	btst #1,STROKE_DATA
	beq.s ammx_fill_table_no_end_1
	or.b d3,256*40*1(a0)
ammx_fill_table_no_end_1:
	btst #0,STROKE_DATA
	beq.s ammx_fill_table_no_end_0
	or.b d3,(a0)
ammx_fill_table_no_end_0
	;moveq #0,d5
	movem.l (sp)+,d0-d7/a0-a2
	rts





	; if we still have bit to fill repeat the process
ammx_fill_table_check_if_other;
	cmpi.w #0,d5
	bhi.w ammx_fill_table_startiter


	movem.l (sp)+,d0-d7/a0-a2
	rts

FILL_TABLE:
        dcb.b 4*256,$FF


