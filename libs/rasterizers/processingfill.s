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
	or.l d0,(a2)+
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

	IFD VAMPIRE
	move.l a0,a2
	add.l #256*40,a2
	vperm #$00000000,e1,e1,d0
	move.l d0,(a2)+ ; second bitplane
	vperm #$00000000,e0,e0,d0
	move.l d0,(a0)+ ; first bitplane
	subi.w #32,d5
	bra.w ammx_fill_table_check_if_other
	ENDIF
	
	IFND VAMPIRE
	
	move.l a0,d0
	btst #0,d0
	beq.s ammx_fill_table_32_even
	
	move.l AMMXFILLTABLE_FILLDATA_BPL_1,d0
	move.l a0,a2
	add.l #256*40,a2
	or.b d0,(a2)+
	or.w d0,(a2)+
    or.b d0,(a2)+

	move.l AMMXFILLTABLE_FILLDATA_BPL_0,d0
	or.b d0,(a0)+
    or.w  d0,(a0)+
    or.b d0,(a0)+

    subi.w #32,d5
	bra.w ammx_fill_table_check_if_other
 ammx_fill_table_32_even:
	move.l AMMXFILLTABLE_FILLDATA_BPL_1,d0
	move.l a0,a2
	add.l #256*40,a2
	or.l  d0,(a2)+

	move.l AMMXFILLTABLE_FILLDATA_BPL_0,d0
	or.l  d0,(a0)+

	subi.w #32,d5
	bra.w ammx_fill_table_check_if_other

	ENDIF
	
ammx_fill_table_no32:
	; todo - check less sig bit for move.w alignment, necessary on 68000
	cmpi.w #16,d5
	bcs.w ammx_fill_table_no16 ; branch if lower (it will continue if we have at least 16 bits to fill)
	
	IFD VAMPIRE
	move.l a0,a2
	add.l #256*40,a2
	vperm #$00000000,e1,e1,d0
	move.w d0,(a2)+ ; second bitplane
	vperm #$00000000,e0,e0,d0
	move.w d0,(a0)+ ; first bitplane
	subi.w #16,d5
	bra.w ammx_fill_table_check_if_other
	ENDIF
	
	;move.w  #$FFFF,(a0)+
	;subi.w #16,d5
	IFND VAMPIRE
	
	move.l a0,d0
	btst #0,d0
	beq.s ammx_fill_table_16_even
	
	move.l AMMXFILLTABLE_FILLDATA_BPL_1,d0
	move.l a0,a2
	add.l #256*40,a2
	or.b d0,(a2)+
    or.b d0,(a2)+

	move.l AMMXFILLTABLE_FILLDATA_BPL_0,d0
	or.b d0,(a0)+
    or.b d0,(a0)+

    subi.w #16,d5
	bra.w ammx_fill_table_check_if_other
 ammx_fill_table_16_even:
	move.l AMMXFILLTABLE_FILLDATA_BPL_1,d0
	move.l a0,a2
	add.l #256*40,a2
	or.w  d0,(a2)+

	move.l AMMXFILLTABLE_FILLDATA_BPL_0,d0
	or.w  d0,(a0)+

	subi.w #16,d5
	bra.w ammx_fill_table_check_if_other

	ENDIF
	
	;bra.w ammx_fill_table_check_if_other
ammx_fill_table_no16:

	cmpi.w #8,d5
	bcs.w ammx_fill_table_no8 ; branch if lower (it will continue if we have at least 8 bits to fill)
	;move.b  #$FF,(a0)+
	IFD VAMPIRE
	move.l a0,a2
	add.l #256*40,a2
	vperm #$00000000,e1,e1,d0
	move.b d0,(a2)+ ; second bitplane
	vperm #$00000000,e0,e0,d0
	move.b d0,(a0)+ ; first bitplane
	ENDIF

	IFND VAMPIRE
	move.l AMMXFILLTABLE_FILLDATA_BPL_1,d0
	move.l a0,a2
	add.l #256*40,a2
	or.b  d0,(a2)+

	move.l AMMXFILLTABLE_FILLDATA_BPL_0,d0
	or.b  d0,(a0)+
	ENDIF

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


LINEVERTEX_START_PUSHED:
	dc.w 0 ; X1
	dc.w 0 ; Y1
LINEVERTEX_END_PUSHED:
	dc.w 0 ; X2
	dc.w 0 ; Y2

LINEVERTEX_START_FINAL:
	dc.w 2 ; X1
	dc.w 1 ; Y1
LINEVERTEX_END_FINAL:
	dc.w 1 ; X2
	dc.w 8 ; Y2

; Line drawing with boundaries storing - entry function to select the correct drawing routine according to m
ammxlinefill:
	movem.l d0-d6/a0-a6,-(sp) ; stack save
	;move.l par1,a1
	lea LINEVERTEX_START_PUSHED,a2
	
	; - pick lowest first x
	move.l LINEVERTEX_START_FINAL,d2
	cmp.l LINEVERTEX_END_FINAL,d2
	blt.s ammxlinefill_lowestless ;  check if first x is lower if this is the case jump to endammxlinefill
	move.l LINEVERTEX_START_FINAL,d3
	move.l LINEVERTEX_END_FINAL,d2
	bra.s endammxlinefillphase1
ammxlinefill_lowestless:
	move.l LINEVERTEX_END_FINAL,d3
endammxlinefillphase1 : ; end of first check

	; - pick lowest first x end
	move.l d2,(a2)+
	move.l d3,(a2)+

	; - check if both coords are between screen limits start
	; - check if both coords are between screen limits end

	; select one of the 4 drawing routines start
	IFD VAMPIRE
	PSUBW d2,d3,d4 ; d4 will contain deltas
	PSUBW d3,d2,d5
	pmaxsw  d5,d4,d4
	
	vperm #$45454545,d4,d4,d5 ; move xdelta in the less sig word
	ENDIF

	; select one of the 4 drawing routines end
	
	cmp.w d5,d4
	blt.s ammxlinefill_dylessthan
	
	cmp.w d2,d3
	bls.s ammxlinefill_gotolessminus1
	nop
	;bsr.w ammxlinefill_linemgreater1		; vertical line
	bra.s ammxlinefill_endammxlinefillphase2

ammxlinefill_gotolessminus1:
	;bsr.w ammxlinefill_linemlessminus1
	bra.s ammxlinefill_endammxlinefillphase2


ammxlinefill_dylessthan:
	
	cmp.w d2,d3
	bls.s ammxlinefill_goto0tominus1
	;bsr.w ammxlinefill_linem0to1
	nop
	bra.s ammxlinefill_endammxlinefillphase2
ammxlinefill_goto0tominus1:
	;bsr.w ammxlinefill_linem0tominus1
	nop
ammxlinefill_endammxlinefillphase2:
	movem.l (sp)+,d0-d6/a0-a6

	rts

FILL_TABLE:
        dcb.b 4*256,$FF


