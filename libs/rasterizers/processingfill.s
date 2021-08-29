; Routines to fill areas inside polygons
; FILL_TABLE must contain correct values
LINEVERTEX_CLIP_X_OFFSET:
    dc.w 0

AMMX_FILL_TABLE_FIRST_DRAW:
	dc.w 1

AMMXFILLTABLE_CURRENT_ROW:
	dc.w 0

AMMXFILLTABLE_END_ROW:
	dc.w -1

AMMXFILLTABLE_CURRENT_ROW_LINE:
	dc.w 0

AMMXFILLTABLE_END_ROW_LINE:
	dc.w 0

;****************************************************************************
; Questa routine copia un rettangolo di schermo da una posizione fissa
; ad un indirizzo specificato come parametro. Il rettangolo di schermo che
; viene copiato racchiude interamente le 2 linee.
; Durante la copia viene effettuato anche il riempmento. Il tipo di riempimento
; e` specificato tramite i parametri.
; I parametri sono:
; A0 - indirizzo rettangolo da fillare
; D0 - se vale 0 allora effettua fill inclusivo, altrimenti fa fill esclusivo
; D1 - se vale 0 allora effettua FILL_CARRYIN=0, altrimenti FILL_CARRYIN=1
;****************************************************************************

Fill:
	lea	$dff000,a5		; CUSTOM REGISTER in a5
	btst	#6,$dff002 ; dmaconr
WBlit1:
	btst	#6,$dff002 ; dmaconr - attendi che il blitter abbia finito
	bne.s	WBlit1
	rts

	move.w	#$09f0,$40(a5)		; BLTCON0 copia normale

	tst.w	d0			; testa D0 per decidere il tipo di fill
	bne.s	fill_esclusivo
	move.w	#$000a,d2		; valore di BLTCON1: settati i bit del
					; fill inclusivo e del modo discendente
	bra.s	test_fill_carry

fill_esclusivo:
	move.w	#$0012,d2		; valore di BLTCON1: settati i bit del
					; fill esclusivo e del modo discendente

test_fill_carry:
	tst.w	d1			; testa D1 per vedere se deve settare
					; il bit FILL_CARRYIN

	beq.s	fatto_bltcon1		; se D1=0 salta..
	bset	#2,d2			; altrimenti setta il bit 2 di D2
	fatto_bltcon1:
	move.w	d2,$42(a5)		; BLTCON1

	move.w	#0,$64(a5)		; BLTAMOD larghezza 20 words (40-40=0)
	move.w	#0,$66(a5)		; BLTDMOD (40-40=0)

	move.l	a0,$50(a5)		; BLTAPT - indirizzo al rettangolo
					; il rettangolo sorgente racchiude
					; interamente il poligono
					; puntiamo l'ultima word del rettangolo
					; per via del modo discendente

	move.l	a0,$54(a5)		; BLTDPT - indirizzo rettangolo
	move.w	#(64*255)+20,$58(a5)	; BLTSIZE (via al blitter !)
					; larghezza 20 words
	rts				; altezza 100 righe (1 plane)


ammx_fill_table_blit:
	movem.l d1/d2/d5-d7/a0-a3,-(sp) ; stack save
	move.w #1,AMMX_FILL_TABLE_FIRST_DRAW
	move.w AMMXFILLTABLE_END_ROW,d5

	lea FILL_TABLE,a0

	; Reposition inside the fill table according to the starting row
	move.w AMMXFILLTABLE_CURRENT_ROW,d6
	move.w d6,d1
	lsl.w #2,d6
	add.w d6,a0
	; end of repositioning
	
	; start of position inside the bitplane
	lea PLOTREFS,a1    

	IFD USE_DBLBUF
	move.l SCREEN_PTR_0,a2
	move.l SCREEN_PTR_1,a3
	ELSE
	lea SCREEN_0,a2
	lea SCREEN_1,a3
	ENDIF
    
	move.w d1,d6
	add.w d6,d6
	move.w (a1,d6.w),d6
	add.w d6,a2
	add.w d6,a3
	; end of position iinside the bitplane, now a2 and a3 points to the Y position

	MINUWORD d1,FILLTABLE_FRAME_MIN_Y
	MAXUWORD d5,FILLTABLE_FRAME_MAX_Y

ammx_fill_table_nextline_blit_3:
	cmp.w d5,d1
	bhi.s ammx_fill_table_blit_end

	move.w (a0),d6 ; start of fill line
	move.w 2(a0),d7 ; end of fill line

	cmp.w d6,d7
	beq.s  ammx_fill_table_next_blit_3
	
		; start plot routine for left
	move.w d6,d2
	lsr.w #3,d2
	not.b d6
	bset d6,(a2,d2.w)
	bset d6,(a3,d2.w)


    move.w d7,d2
    lsr.w #3,d2
    not.b d7
    bset d7,(a2,d2.w)
    bset d7,(a3,d2.w)

	
	;bsr.w ammx_fill_table_single_line

    add.w #40,a2
    add.w #40,a3
ammx_fill_table_next_blit_3:
    move.l #$7FFF8000,(a0)+
	addq #1,d1
	
	bra.s ammx_fill_table_nextline_blit_3
ammx_fill_table_blit_end:
	move.w #-1,AMMXFILLTABLE_END_ROW
	lea SCREEN_0,a0
	moveq #0,d0
	moveq #0,d1
	;bsr.w Fill; enable in production since vamos cant emulate blitter
	movem.l (sp)+,d1/d2/d5-d7/a0-a3
	rts

ammx_fill_table_noreset:
	movem.l d0/d2-d7/a0/a3/a4/a5,-(sp) ; stack save

	move.w #1,AMMX_FILL_TABLE_FIRST_DRAW
	move.w AMMXFILLTABLE_END_ROW(PC),d5

	lea FILL_TABLE(PC),a0

	; Reposition inside the fill table according to the starting row
	move.w AMMXFILLTABLE_CURRENT_ROW(PC),d6
	move.w d6,d1
	lsl.w #2,d6
	add.w d6,a0
	; end of repositioning

	MINUWORD d1,FILLTABLE_FRAME_MIN_Y
	MAXUWORD d5,FILLTABLE_FRAME_MAX_Y

	cmp.w d5,d1
	bhi.s ammx_fill_table_end_noreset
	sub.w d1,d5

	lea PLOTREFS(PC),a4
	add.w d1,d1
	move.w 0(a4,d1.w),d1

	IFD USE_DBLBUF
	move.l SCREEN_PTR_0,a5
	ELSE
	lea SCREEN_0,a5
	ENDIF

ammx_fill_table_nextline_noreset:

	move.w (a0)+,d6 ; start of fill line
	move.w (a0)+,d7 ; end of fill line

	bsr.w ammx_fill_table_single_line
	add.w #40,d1
	
	dbra d5,ammx_fill_table_nextline_noreset
ammx_fill_table_end_noreset:
	movem.l (sp)+,d0/d2-d7/a0/a3/a4/a5
	rts

ammx_fill_table:
	movem.l d0/d2-d7/a0/a3/a4/a5,-(sp) ; stack save

	move.w #1,AMMX_FILL_TABLE_FIRST_DRAW
	move.w AMMXFILLTABLE_END_ROW(PC),d5

	lea FILL_TABLE(PC),a0

	; Reposition inside the fill table according to the starting row
	move.w AMMXFILLTABLE_CURRENT_ROW(PC),d6
	move.w d6,d1
	lsl.w #2,d6
	add.w d6,a0
	; end of repositioning

	MINUWORD d1,FILLTABLE_FRAME_MIN_Y
	MAXUWORD d5,FILLTABLE_FRAME_MAX_Y

	cmp.w d5,d1
	bhi.s ammx_fill_table_end
	sub.w d1,d5

	lea PLOTREFS(PC),a4
	add.w d1,d1
	move.w 0(a4,d1.w),d1

	IFD USE_DBLBUF
	move.l SCREEN_PTR_0,a5
	ELSE
	lea SCREEN_0,a5
	ENDIF

ammx_fill_table_nextline:

	move.w (a0),d6 ; start of fill line
	move.w 2(a0),d7 ; end of fill line
	move.l #$7FFF8000,(a0)+
	
	bsr.w ammx_fill_table_single_line
	add.w #40,d1
	
	dbra d5,ammx_fill_table_nextline
ammx_fill_table_end:
	move.w #-1,AMMXFILLTABLE_END_ROW
	movem.l (sp)+,d0/d2-d7/a0/a3/a4/a5
	rts

	IFD USE_CLIPPING
ammx_fill_table_clip:
	movem.l d0-d7/a0/a3/a4/a5,-(sp) ; stack save
	move.w #1,AMMX_FILL_TABLE_FIRST_DRAW

	lea FILL_TABLE(PC),a0

	; Reposition inside the fill table according to the starting row
	move.w AMMXFILLTABLE_CURRENT_ROW,d6
	move.w AMMXFILLTABLE_END_ROW,d5
	move.w d6,d1
	lsl.w #2,d6
	add.w d6,a0
	; end of repositioning

	cmp.w d5,d1
	bgt.s ammx_fill_table_end_clip
	sub.w d1,d5

	lea PLOTREFS,a4
	add.w d1,d1
	move.w 0(a4,d1.w),d1

	IFD USE_DBLBUF
	move.l SCREEN_PTR_0,a5
	ELSE
	lea SCREEN_0,a5
	ENDIF

ammx_fill_table_nextline_clip:

	move.w (a0),d6 ; start of fill line
	move.w #$7FFF,(a0)+
	move.l #$013F0000,d7
	move.w (a0),d7 ; end of fill line
	move.w #$8000,(a0)+
	
	; clip start
	; if left is negative left is zero
	IFD VAMPIRE
	pmaxsw #0,d6,d6
	ELSE
	btst #15,d6
	seq d0
	ext.w d0
	and.w d0,d6
	ENDC
	
	; if right > screen resolution then right = screen resolution
	IFD VAMPIRE
	pminsw #319,d7,d7
	ELSE
	cmpi.w #319,d7
	sgt d0
	move.w #16,d4
	and.w d0,d4
	lsr.l d4,d7
	ENDC
	; clip end
	
	bsr.w ammx_fill_table_single_line
	add.w #40,d1
	
	dbra d5,ammx_fill_table_nextline_clip
ammx_fill_table_end_clip:
	move.w #-1,AMMXFILLTABLE_END_ROW
	movem.l (sp)+,d0-d7/a0/a3/a4/a5
	rts

	ENDIF

; ammx_fill_table_single_line - Fills a single line according to the fill table into screens
; Input:
;	- d6.w : left X (0-319)
;	- d7.w : right X (0-319)
;	- d1.w : line number multiplied by 40 (line)
;	- a4 : addr of plotrefs
;   - a5 : addr of screen
;
; Defines:
; - USE_CLIPPING
; - USE_DBLBUF
;
; Trashes:
;   - d0
;   - d2
;	- d3
;	- d4
;	- d6
;	- d7
; 	- a3
ammx_fill_table_single_line:
	move.l d5,-(sp) ; stack save

	; d5 => totalcount
	; d3 / d4 => tmp

	; d6 => left X
	; d7 => right X

	move.w d7,d5 ; alternative to psubw
	sub.w d6,d5
	IFD USE_CLIPPING
	bmi.w ammx_fill_table_no_end_0 ; if Xright<0 we are sure that no pixel must be drawn so jump to whatever exit
	ENDIF
	addq #1,d5

	; align to nearest byte
	; address of the first point
	;lea PLOTREFS,a3

	;add.w d1,d1
	;move.w 0(a4,d1.w),d1
	move.w d6,d2
	lsr.w #3,d2
	add.w d1,d2
	
	; d2.w now has the address of the first byte let's calculate the fill for this byte
	;move.w d6,d4 ; d6 can be trashed at this point
	andi.w #$0007,d6
	scc d3 ; I need to set d3 to FF, since andy ALWAYS clears C and V i use SCC who is faster than move.b
	lsr.b d6,d3

	;IFD USE_DBLBUF
	;move.l SCREEN_PTR_0,a3
	;ELSE
	;lea SCREEN_0,a3
	;ENDIF
	move.l a5,a3
	add.w d2,a3

	; bitprocessed = 8-d6
	subq #8,d6 ; d6 must always be negative here!!!!
	add.w d6,d5 ; totalcount must be decremented by written bits (using add because d4 is always negative)
	
	; special case -  if d5 is negative we plotted too much
	bpl.s ammx_fill_table_no_special_case
    ;subq #1,d5
	;not d5
	neg.w d5
	lsr.b d5,d3
	lsl.b d5,d3

	move.b STROKE_DATA,d0
	btst #1,d0
	beq.s ammx_fill_table_no_special_1
	or.b d3,256*40*1(a3) ; Plot points bpl1!!
ammx_fill_table_no_special_1
	btst #0,d0
	beq.s ammx_fill_table_no_special_0
	or.b d3,(a3)+ ; Plot points!!
ammx_fill_table_no_special_0:
	move.l (sp)+,d5
	rts

ammx_fill_table_no_special_case:
    ; end special case

	; reset bitplane data
	IFND VAMPIRE
	moveq #0,d6
	moveq #0,d7
	ENDIF
	IFD VAMPIRE
	REG_ZERO e0
	REG_ZERO e1
	ENDIF
    
	move.b STROKE_DATA,d0
	btst #1,d0
	beq.s ammx_fill_table_no_firstbyte_1
	or.b d3,256*40*1(a3) ; Plot points bpl1!!
	IFND VAMPIRE
	not.l d6
	ENDIF
	IFD VAMPIRE
	load #$FFFFFFFFFFFFFFFF,e1
	ENDIF
ammx_fill_table_no_firstbyte_1:
	btst #0,d0
	beq.s ammx_fill_table_no_firstbyte_0
    or.b d3,(a3) ; Plot points!!
	IFND VAMPIRE
	not.l d7
	ENDIF
	IFD VAMPIRE
	load #$FFFFFFFFFFFFFFFF,e0
	ENDIF
ammx_fill_table_no_firstbyte_0:
	addq #1,a3

	; start addr odd or even? store result on d4
	IFND VAMPIRE
	move.l a3,d4
	btst #0,d4
	beq.s ammx_fill_table_startiter
	cmpi.w #8,d5
	bcs.w ammx_fill_table_no8 ; branch if lower (it will continue if we have at least 8 bits to fill)
	or.b  d6,256*40(a3)
	or.b  d7,(a3)+
	subq #8,d5
	ENDIF

; start iteration until we are at the end
ammx_fill_table_startiter:

	; now we are byte aligned, evaluate how many bits we still have to fill
	cmpi.w #64,d5
	bcs.w ammx_fill_table_no64 ; branch if lower (it will continue if we have at least 64 bits to fill)

	; here starts the code to fill 64 bits
	IFD VAMPIRE
	POR 256*40(a3),e1,e6
	STORE e6,256*40(a3)
	POR (a3),e0,e6
	STORE e6,(a3)+
	subi.w #64,d5
	bne.s ammx_fill_table_startiter
	move.l (sp)+,d5
	rts
	ENDIF
	IFND VAMPIRE
	
	or.l  d6,256*40(a3)
	or.l  d6,4+256*40(a3)

	or.l  d7,(a3)+
	or.l  d7,(a3)+

	subi.w #64,d5
	bne.s ammx_fill_table_startiter
	move.l (sp)+,d5
	rts
	ENDIF
	
ammx_fill_table_no64:
	cmpi.w #32,d5
	bcs.w ammx_fill_table_no32 ; branch if lower (it will continue if we have at least 32 bits to fill)

	IFD VAMPIRE
	vperm #$00000000,e1,e1,d0
	or.l d0,256*40(a3)  ; second bitplane
	vperm #$00000000,e0,e0,d0
	or.l d0,(a3)+ ; first bitplane
	subi.w #32,d5
	bne.w ammx_fill_table_startiter
	move.l (sp)+,d5
	rts
	ENDIF
	
	IFND VAMPIRE
	
	or.l  d6,256*40(a3)
	or.l  d7,(a3)+

	subi.w #32,d5
	beq.s ammx_fill_table_no_end_0

	ENDIF
	
ammx_fill_table_no32:
	cmpi.w #16,d5
	bcs.w ammx_fill_table_no16 ; branch if lower (it will continue if we have at least 16 bits to fill)
	
	IFD VAMPIRE
	vperm #$00000000,e1,e1,d0
	or.w d0,256*40(a3) ; second bitplane
	vperm #$00000000,e0,e0,d0
	or.w d0,(a3)+ ; first bitplane
	subi.w #16,d5
	bne.w ammx_fill_table_no16
	move.l (sp)+,d5
	rts
	ENDIF
	
	IFND VAMPIRE
	or.w  d6,256*40(a3)
	or.w  d7,(a3)+

	subi.w #16,d5
	beq.s ammx_fill_table_no_end_0
	ENDIF
	
ammx_fill_table_no16:

	cmpi.w #8,d5
	bcs.w ammx_fill_table_no8 ; branch if lower (it will continue if we have at least 8 bits to fill)
	IFD VAMPIRE
	vperm #$00000000,e1,e1,d0
	or.b d0,256*40(a3) ; second bitplane
	vperm #$00000000,e0,e0,d0
	or.b d0,(a3)+ ; first bitplane
	ENDIF

	IFND VAMPIRE
	or.b  d6,256*40(a3)
	or.b  d7,(a3)+
	ENDIF

	subq #8,d5
	beq.s ammx_fill_table_no_end_0

ammx_fill_table_no8:

	; we get here only and only if there is less then a byte to fill, in other words, d5<8
	; in this case we must fill the MSG bytes of the byte wit a 1
	moveq #8,d4
	sub.w d5,d4
	IFD VAMPIRE
	vperm #$00000000,e1,e1,d6
	vperm #$00000000,e0,e0,d7
	ENDC
	lsl.b d4,d6
	lsl.b d4,d7

	or.b d6,256*40*1(a3)
	or.b d7,(a3)
ammx_fill_table_no_end_0
	move.l (sp)+,d5
	rts

LINEVERTEX_START_PUSHED:
LINEVERTEX_START_PUSHED_X:
	dc.w 0 ; X1
LINEVERTEX_START_PUSHED_Y:
	dc.w 0 ; Y1
LINEVERTEX_END_PUSHED:
LINEVERTEX_END_PUSHED_X:
	dc.w 0 ; X2
LINEVERTEX_END_PUSHED_Y:
	dc.w 0 ; Y2

LINEVERTEX_START_FINAL:
	dc.w 2 ; X1
	dc.w 1 ; Y1
LINEVERTEX_END_FINAL:
	dc.w 1 ; X2
	dc.w 8 ; Y2
LINEVERTEX_DELTAX:
    dc.w 0
LINEVERTEX_DELTAY:
    dc.w 0

; Line drawing with boundaries storing - entry function to select the correct drawing routine according to m
ammxlinefill:
	movem.l d0-d7/a0-a6,-(sp) ; stack save
	
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
endammxlinefillphase1:  ; end of first check

	; - pick lowest first x end
	move.l d2,(a2)+
	move.l d3,(a2)+

	; select one of the 4 drawing routines start
	; take the delta (abs value of the difference) between lowest 2 words from d2 and d3 and put them in d4
	
	; IFND VAMPIRE
    move.l d3,d5
    move.w d3,d7 ; save the Y relative of the right point into d7
    swap d5      ; now I have the X of the right point into d5 lower part ready for subtraction
    
    move.l d2,d6 ; save d2 to d6
    move.w d2,d4 ; save the Y relative of the left point into d4
    swap d6 ; now i have the X of the left point into d6
	sub.w d6,d5 ; now d5 will contain deltaX , here d5 must always be positive, if not something is wrong!!!

    ; now d5 contains the x delta
	; now let's calculate the Y delta, we have Y right point into d7 and the other Y in d4
    sub.w d7,d4
    bpl.s endammxlinefillphase1_max
    neg d4
endammxlinefillphase1_max:
    ;save deltas
    move.w d5,LINEVERTEX_DELTAX
    move.w d4,LINEVERTEX_DELTAY


    ; ENDIF
	
	;IFD VAMPIRE
	;PSUBW d2,d3,d4 ; d4 will contain deltas
	;PSUBW d3,d2,d5
	;pmaxsw  d5,d4,d4
	
	;vperm #$45454545,d4,d4,d5 ; move xdelta in the less sig word
	;ENDIF

	; - check if both coords are between screen limits start
	IFD USE_CLIPPING
	IFD VAMPIRE
	vperm #$EEEEEEEE,e22,e22,d0
	btst  #0,d0
	beq.s ammxlinefill_clip_done
	ENDIF
	IFND VAMPIRE
	btst  #0,DRAWING_OPTIONS
	beq.s ammxlinefill_clip_done
	ENDIF
	bsr.w ammxlinefill_clip

	cmpi.w #$FFFF,d0
    bne.s ammxlinefill_clip_ok
    movem.l (sp)+,d0-d7/a0-a6
	rts
ammxlinefill_clip_ok:

	; d0 will contain the min(X) and d1 the max(X)
    move.w LINEVERTEX_START_PUSHED_X,d0
	move.w LINEVERTEX_END_PUSHED_X,d1
	cmp.w d0,d1
	bge.s ammxlinefill_noswap_x
	exg d1,d0
ammxlinefill_noswap_x:

	; if x<0 we shift to right to normalize
    move.w #0,LINEVERTEX_CLIP_X_OFFSET
    cmpi.w #0,d0
    bge.s ammxlinefill_no_clip_offset
    neg d0
    move.w d0,LINEVERTEX_CLIP_X_OFFSET
    add.w d0,LINEVERTEX_START_PUSHED_X
    add.w d0,LINEVERTEX_END_PUSHED_X
ammxlinefill_no_clip_offset:
    move.l LINEVERTEX_START_PUSHED,d2
	move.l LINEVERTEX_END_PUSHED,d3
    move.w LINEVERTEX_END_PUSHED_X,d5 ; recalculate deltax
	sub.w LINEVERTEX_START_PUSHED_X,d5
    move.w LINEVERTEX_END_PUSHED_Y,d4 ; recalculate deltay
    sub.w  LINEVERTEX_START_PUSHED_Y,d4
    bpl.s  ammxlinefill_no_clip_offset_1
    neg d4
ammxlinefill_no_clip_offset_1:
	
ammxlinefill_clip_done:
	ENDIF

	; save Y MIN and MAX
	move.w LINEVERTEX_START_PUSHED_Y,d0
	move.w LINEVERTEX_END_PUSHED_Y,d1
	IFD VAMPIRE
	pminuw d0,d1,e0
	pmaxuw d0,d1,e1
	vperm #$000067EF,e0,e1,d0
	move.l d0,AMMXFILLTABLE_CURRENT_ROW_LINE
	ENDIF
	IFND VAMPIRE
	cmp.w d0,d1
	bge.s ammxlinefill_noswap_y
	exg d0,d1
ammxlinefill_noswap_y:
	move.w d0,AMMXFILLTABLE_CURRENT_ROW_LINE
    move.w d1,AMMXFILLTABLE_END_ROW_LINE
	ENDIF
	
	; recalculate deltay
	cmpi.w #0,AMMX_FILL_TABLE_FIRST_DRAW
    beq.s ammxfill_firstdraw_update
    move.w      AMMXFILLTABLE_CURRENT_ROW_LINE,AMMXFILLTABLE_CURRENT_ROW
    move.w      AMMXFILLTABLE_END_ROW_LINE,AMMXFILLTABLE_END_ROW
	move.w      #0,AMMX_FILL_TABLE_FIRST_DRAW
    bra.w ammxfill_endfirstdraw
ammxfill_firstdraw_update:
    move.w      AMMXFILLTABLE_CURRENT_ROW_LINE,d0
    MINUWORD    d0,AMMXFILLTABLE_CURRENT_ROW
    move.w      AMMXFILLTABLE_END_ROW_LINE,d0
    MAXUWORD    d0,AMMXFILLTABLE_END_ROW
ammxfill_endfirstdraw:
	
	cmp.w d5,d4
	blt.s ammxlinefill_dylessthan
	
	cmp.w d2,d3
	bls.s ammxlinefill_gotolessminus1
	bsr.w ammxlinefill_linemgreater1		; vertical line
	bra.s ammxlinefill_endammxlinefillphase2

ammxlinefill_gotolessminus1:
	bsr.w ammxlinefill_linemlessminus1
	bra.s ammxlinefill_endammxlinefillphase2


ammxlinefill_dylessthan:
	
	cmp.w d2,d3
	bls.s ammxlinefill_goto0tominus1
	bsr.w ammxlinefill_linem0to1
	bra.s ammxlinefill_endammxlinefillphase2
ammxlinefill_goto0tominus1:
	bsr.w ammxlinefill_linem0tominus1
ammxlinefill_endammxlinefillphase2:

	movem.l (sp)+,d0-d7/a0-a6

	rts

; d0 ==> x
; d1 ==> y
; d2 ===> x1 y1
; d3 ===> x2 y2
; d4 ===> decision
; e6 ===> I1

ammxlinefill_linem0to1:
	
	movem.l d0-d7/a2,-(sp) ; stack save

	move.l LINEVERTEX_START_PUSHED,d2
	move.l LINEVERTEX_END_PUSHED,d3

	;Calculate dx = x2-x1
    ;Calculate dy = y2-y1
    ;IFD VAMPIRE
	;PSUBW d2,d3,E5 ; e5 will contain deltas
	;ENDIF
	;IFND VAMPIRE
	;write sub routine here

	IFD VAMPIRE
	load #$0000000000000004,e4 ; never change e4, we will need later

	vperm #$CDCDCDCD,d2,d2,d0 ; here we have the xstart value
	vperm #$CDCDCDCD,d3,d3,d6 ; here we have the xstop value into d6
	ENDIF

	IFND VAMPIRE
	move.l d2,d0
	swap d0 ; here we have the xstart value
	move.l d3,d6
	swap d6 ; here we have the xstop value into d6
	ENDIF

	move.w d2,d1 ; here we have ystart into d1
	
	move.w LINEVERTEX_DELTAY,d4
	
	; calculate Ii into d5
	move.w d4,d5
	add.w d5,d5 ; I1 is now into d5
	
	move.w d4,d7 ; save for later I2 calculation
    add.w d4,d4
    sub.w LINEVERTEX_DELTAX,d4 ; d4 = determinant

    ; start of I2 calc
    sub.w   LINEVERTEX_DELTAX,d7 ; now we have deltaY-Deltax
    add.w d7,d7 ; now we have 2(deltaY-deltaX)
    
	lea FILL_TABLE,a2
	
	move.w d1,d3
	lsl.w #2,d3
	add.w d3,a2
	
	; Save d0 X point into FILL_TABLE start
	IFD USE_CLIPPING
	sub.w LINEVERTEX_CLIP_X_OFFSET,d0 ; ONLY IF CLIPPING
	ENDIF
	IFD VAMPIRE
	pminsw  -6(a2),d0,e0
	pmaxsw  -4(a2),d0,e1
	vperm #$67EF67EF,e0,e1,e2
	storec E2,E4,(a2)
	ENDIF
	IFND VAMPIRE
	cmp.w (a2),d0
	bge.s ammxlinefill_linem0to1_1            ; if (a2)<=d0 branch (dont update the memory)
    move.w d0,(a2)      ; we save only if is less     
ammxlinefill_linem0to1_1:
    cmp.w 2(a2),d0
    ble.s ammxlinefill_linem0to1_2
    move.w d0,2(a2)
ammxlinefill_linem0to1_2:
    ; Save d0 X point into FILL_TABLE end
	ENDIF
	IFD USE_CLIPPING
	add.w LINEVERTEX_CLIP_X_OFFSET,d0 ; ONLY IF CLIPPING
	ENDIF

ammxlinefill_LINESTARTITER_F:

	; interate for each x until x<=xend
	cmp.w d0,d6
	ble.s ammxlinefill_ENDLINE_F ; if x>=xend exit

	cmp.w #0,d4 ; check if d<0
	blt.s ammxlinefill_POINT_D_LESS_0_F ; branch if id<0

	; we are here if d>=0
	;IFD VAMPIRE
	;paddw e9,d4,d4 ; d = i2+ d
	;IFND
	add.w d7,d4 ; d = i2+d
    addq #1,d1 ; y = y+1

	IFD USE_CLIPPING
	; CLIPPING FEATURE if Y > 255 (or a negative number) exit
    cmpi.w #255,d1
    bhi.s ammxlinefill_ENDLINE_F
	ENDIF

	addq #1,d0
	
	addq #4,a2

	
	; Save d0 X point into FILL_TABLE start
	IFD USE_CLIPPING
	sub.w LINEVERTEX_CLIP_X_OFFSET,d0 ; ONLY IF CLIPPING
	ENDIF
	IFD VAMPIRE
	pminsw  -6(a2),d0,e0
	pmaxsw  -4(a2),d0,e1
	vperm #$67EF67EF,e0,e1,e2
	storec E2,E4,(a2)
	ENDIF
	IFND VAMPIRE
    cmp.w (a2),d0
	bge.s ammxlinefill_linem0to1_3            ; if (a2)<=d0 branch (dont update the memory)
    move.w d0,(a2)      ; we save only if is less     
ammxlinefill_linem0to1_3:
    cmp.w 2(a2),d0
    ble.s ammxlinefill_linem0to1_4
    move.w d0,2(a2)
ammxlinefill_linem0to1_4:
	ENDIF
	IFD USE_CLIPPING
	add.w LINEVERTEX_CLIP_X_OFFSET,d0 ; ONLY IF CLIPPING
	ENDIF
    ; Save d0 X point into FILL_TABLE end
    
	bra.s ammxlinefill_LINESTARTITER_F

ammxlinefill_POINT_D_LESS_0_F:
	; we are here if d<0
	;IFD VAMPIRE
	;paddw e6,d4,d4 ; d = i1+ d 
	add.w d5,d4 ; d = i1 +d
	addq #1,d0
	
	; Save d0 X point into FILL_TABLE start
	IFD USE_CLIPPING
	sub.w LINEVERTEX_CLIP_X_OFFSET,d0 ; ONLY IF CLIPPING
	ENDIF
	IFD VAMPIRE
	;pminuw  -6(a2),d0,e0
	pmaxsw  -4(a2),d0,e1
	vperm #$67EF67EF,e0,e1,e2
	storec E2,E4,(a2)
	ENDIF

	IFND VAMPIRE
    cmp.w 2(a2),d0
    ble.s ammxlinefill_linem0to1_6
    move.w d0,2(a2)
ammxlinefill_linem0to1_6:
    ; Save d0 X point into FILL_TABLE end
	ENDIF
	IFD USE_CLIPPING
	add.w LINEVERTEX_CLIP_X_OFFSET,d0 ; ONLY IF CLIPPING
	ENDIF
	bra.s ammxlinefill_LINESTARTITER_F

ammxlinefill_ENDLINE_F:
	movem.l (sp)+,d0-d7/a2
	
	rts

; start of vertical routines
ammxlinefill_linemgreater1:
	
	movem.l d0-d7/a2,-(sp) ; stack save
	
	move.l LINEVERTEX_START_PUSHED,d2
	move.l LINEVERTEX_END_PUSHED,d3

	swap d2
	swap d3

	move.l d2,d0
	swap d0 ; here we have the xstart value
	move.l d3,d6
	swap d6 ; here we have the xstop value into d6
	
	move.w d2,d1 ; here we have ystart into d1
	
	
	move.w LINEVERTEX_DELTAX,d4
	
	; calculate Ii into d5
	move.w d4,d5
	add.w d5,d5 ; I1 is now into d5
	
	move.w d4,d7 ; save for later I2 calculation
    add.w d4,d4
    sub.w LINEVERTEX_DELTAY,d4 ; d4 = determinant

    ; start of I2 calc
    sub.w   LINEVERTEX_DELTAY,d7 ; now we have deltaY-Deltax
    add.w d7,d7 ; now we have 2(deltaY-deltaX)
    
    ; save left point
	lea FILL_TABLE,a2
	
	move.w d0,d3
	lsl.w #2,d3
	add.w d3,a2
	
	; Save d0 X point into FILL_TABLE start
	IFD USE_CLIPPING
	sub.w LINEVERTEX_CLIP_X_OFFSET,d1 ; ONLY IF CLIPPING
	ENDIF
	IFD VAMPIRE
	load #$0000000000000004,e4 ; never change e4, we will need later
	pminsw  -6(a2),d1,e0
	pmaxsw  -4(a2),d1,e1
	vperm #$67EF67EF,e0,e1,e2
	storec e2,E4,(a2)
	ENDIF
	IFND VAMPIRE
	cmp.w (a2),d1
	bge.s ammxlinefill_linemgreater1_1            ; if (a2)<=d0 branch (dont update the memory)
    move.w d1,(a2)      ; we save only if is less     
ammxlinefill_linemgreater1_1:
    cmp.w 2(a2),d1
    ble.s ammxlinefill_linemgreater1_2
    move.w d1,2(a2)
ammxlinefill_linemgreater1_2:
	ENDIF
	IFD USE_CLIPPING
	add.w LINEVERTEX_CLIP_X_OFFSET,d1 ; ONLY IF CLIPPING
	ENDIF
    ; Save d0 X point into FILL_TABLE end
	
ammxlinefill_LINESTARTITER_F3:

    addq #4,a2

	; interate for each x until x<=xend
	cmp.w d0,d6
	ble.s ammxlinefill_ENDLINE_F3 ; if x>=xend exit

	cmp.w #0,d4 ; check if d<0
	blt.s ammxlinefill_POINT_D_LESS_0_F3 ; branch if id<0

	; we are here if d>=0
	add.w d7,d4 ; d = i2+d
    addq #1,d1 ; x = x+1

	IFD USE_CLIPPING
	sub.w LINEVERTEX_CLIP_X_OFFSET,d1 ; ONLY IF CLIPPING
	ENDIF
	IFD VAMPIRE
	pminsw  -6(a2),d1,e0
	pmaxsw  -4(a2),d1,e1
	vperm #$67EF67EF,e0,e1,e2
	storec e2,E4,(a2)
	ENDIF

	IFND VAMPIRE
    cmp.w (a2),d1
	bge.s ammxlinefill_linemgreater1_3            ; if (a2)<=d0 branch (dont update the memory)
    move.w d1,(a2)      ; we save only if is less     
ammxlinefill_linemgreater1_3:
    cmp.w 2(a2),d1
    ble.s ammxlinefill_linemgreater1_4
    move.w d1,2(a2)
ammxlinefill_linemgreater1_4:
	ENDIF
	IFD USE_CLIPPING
	add.w LINEVERTEX_CLIP_X_OFFSET,d1 ; ONLY IF CLIPPING
	ENDIF

    bra.s ammxlinefill_POINT_D_END_F3

ammxlinefill_POINT_D_LESS_0_F3:
	; we are here if d<0
	
	add.w d5,d4 ; d = i1 +d

ammxlinefill_POINT_D_END_F3:
	addq #1,d0

	IFD USE_CLIPPING
	sub.w LINEVERTEX_CLIP_X_OFFSET,d1 ; ONLY IF CLIPPING
	ENDIF
	IFD VAMPIRE
	pminsw  -6(a2),d1,e0
	pmaxsw  -4(a2),d1,e1
	vperm #$67EF67EF,e0,e1,e2
	storec e2,E4,(a2)
	ENDIF

	IFND VAMPIRE
	cmp.w (a2),d1
	bge.s ammxlinefill_linemgreater1_5            ; if (a2)<=d0 branch (dont update the memory)
    move.w d1,(a2)      ; we save only if is less     
ammxlinefill_linemgreater1_5:
    cmp.w 2(a2),d1
    ble.s ammxlinefill_linemgreater1_6
    move.w d1,2(a2)
ammxlinefill_linemgreater1_6:
	ENDIF
	IFD USE_CLIPPING
	add.w LINEVERTEX_CLIP_X_OFFSET,d1 ; ONLY IF CLIPPING
	ENDIF
	    
	bra.s ammxlinefill_LINESTARTITER_F3

ammxlinefill_ENDLINE_F3:
	movem.l (sp)+,d0-d7/a2
	rts

ammxlinefill_linemlessminus1:
	movem.l d0-d7/a2,-(sp) ; stack save
	
	move.l LINEVERTEX_START_PUSHED,d2
	move.l LINEVERTEX_END_PUSHED,d3

	move.w d2,d4
	move.w d3,d2
	move.w d4,d3

	swap d2
	swap d3
	
	move.l d2,d0
	swap d0 ; here we have the xstart value
	move.l d3,d6
	swap d6 ; here we have the xstop value into d6
	
	move.w d2,d1 ; here we have ystart into d1
	
	
	move.w LINEVERTEX_DELTAX,d4
	
	; calculate Ii into d5
	move.w d4,d5
	add.w d5,d5 ; I1 is now into d5
	
	move.w d4,d7 ; save for later I2 calculation
    add.w d4,d4
    sub.w LINEVERTEX_DELTAY,d4 ; d4 = determinant

    ; start of I2 calc
    sub.w   LINEVERTEX_DELTAY,d7 ; now we have deltaY-Deltax
    add.w d7,d7 ; now we have 2(deltaY-deltaX)
    
    ; save left point
	lea FILL_TABLE,a2
	
	move.w d3,d1
	
	move.w d0,d3
	lsl.w #2,d3
	add.w d3,a2
	
	; Save d0 X point into FILL_TABLE start
	IFD USE_CLIPPING
	sub.w LINEVERTEX_CLIP_X_OFFSET,d1 ; ONLY IF CLIPPING
	ENDIF
	IFD VAMPIRE
	pminsw  -6(a2),d1,e0
	pmaxsw  -4(a2),d1,e1
	vperm #$67EF67EF,e0,e1,e2
	load #$0000000000000004,e4 ; never change e4, we will need later
	storec E2,E4,(a2)
	ENDIF
	IFND VAMPIRE
	cmp.w (a2),d1
	bge.s ammxlinefill_linemminus1_1            ; if (a2)<=d0 branch (dont update the memory)
    move.w d1,(a2)      ; we save only if is less     
ammxlinefill_linemminus1_1:
    cmp.w 2(a2),d1
    ble.s ammxlinefill_linemminus1_2
    move.w d1,2(a2)
ammxlinefill_linemminus1_2:
	ENDIF
	IFD USE_CLIPPING
	add.w LINEVERTEX_CLIP_X_OFFSET,d1 ; ONLY IF CLIPPING
	ENDIF

ammxlinefill_LINESTARTITER_F4:

    addq #4,a2

	; interate for each x until x<=xend
	cmp.w d0,d6
	ble.s ENDLINE_F4 ; if x>=xend exit

	cmp.w #0,d4 ; check if d<0
	blt.s POINT_D_LESS_0_F4 ; branch if id<0

	; we are here if d>=0
	;paddw e9,d4,d4 ; d = i2+ d
	add.w d7,d4 ; d = i2+d
	subq #1,d1 ; x = x-1

	bra.s ammxlinefill_POINT_D_END_F4

POINT_D_LESS_0_F4:
	; we are here if d<0
	;paddw e6,d4,d4 ; d = i1+ d 
	add.w d5,d4 ; d = i1 +d
	

ammxlinefill_POINT_D_END_F4:
	addq #1,d0 ; process next y

	IFD USE_CLIPPING
	sub.w LINEVERTEX_CLIP_X_OFFSET,d1 ; ONLY IF CLIPPING
	ENDIF
	IFD VAMPIRE
	pminsw  -6(a2),d1,e0
	pmaxsw  -4(a2),d1,e1
	vperm #$67EF67EF,e0,e1,e2
	storec E2,E4,(a2)
	ENDIF

	IFND VAMPIRE
	cmp.w (a2),d1
	bge.s ammxlinefill_linemminus1_5            ; if (a2)<=d0 branch (dont update the memory)
    move.w d1,(a2)      ; we save only if is less     
ammxlinefill_linemminus1_5:
    cmp.w 2(a2),d1
    ble.s ammxlinefill_linemminus1_6
    move.w d1,2(a2)
ammxlinefill_linemminus1_6:
	ENDIF
	IFD USE_CLIPPING
	add.w LINEVERTEX_CLIP_X_OFFSET,d1 ; ONLY IF CLIPPING
	ENDIF

	
	bra.s ammxlinefill_LINESTARTITER_F4

ENDLINE_F4:
	movem.l (sp)+,d0-d7/a2
	rts

; d0 ==> x
; d1 ==> y
; d2 ===> x1 y1
; d3 ===> x2 y2
; d4 ===> decision
; e6 ===> I1

ammxlinefill_linem0tominus1:

	movem.l d0-d7/a2,-(sp) ; stack save

	move.l LINEVERTEX_START_PUSHED,d2
	move.l LINEVERTEX_END_PUSHED,d3

	IFD VAMPIRE
	load #$0000000000000004,e4 ; never change e4, we will need later

	vperm #$CDCDCDCD,d2,d2,d0 ; here we have the xstart value
	vperm #$CDCDCDCD,d3,d3,d6 ; here we have the xstop value into d6
	ENDIF

	IFND VAMPIRE
	move.l d2,d0
	swap d0 ; here we have the xstart value
	move.l d3,d6
	swap d6 ; here we have the xstop value into d6
	ENDIF

	move.w d2,d1 ; here we have ystart into d1
	
	move.w LINEVERTEX_DELTAY,d4
	
	; calculate Ii into d5
	move.w d4,d5
	add.w d5,d5 ; I1 is now into d5
	
	move.w d4,d7 ; save for later I2 calculation
    add.w d4,d4
    sub.w LINEVERTEX_DELTAX,d4 ; d4 = determinant

    ; start of I2 calc
    sub.w   LINEVERTEX_DELTAX,d7 ; now we have deltaY-Deltax
    add.w d7,d7 ; now we have 2(deltaY-deltaX)
    
	lea FILL_TABLE,a2
	
	move.w d1,d3
	lsl.w #2,d3
	add.w d3,a2
	; print pixel routine
	
	IFD USE_CLIPPING
	sub.w LINEVERTEX_CLIP_X_OFFSET,d0 ; ONLY IF CLIPPING
	ENDIF
	IFD VAMPIRE
	pminsw  -6(a2),d0,e0
	pmaxsw  -4(a2),d0,e1
	vperm #$67EF67EF,e0,e1,e2
	storec E2,E4,(a2)
	ENDIF
	IFND VAMPIRE
	cmp.w (a2),d0
	bge.s ammxlinefill_linem0tominus1_1            ; if (a2)<=d0 branch (dont update the memory)
    move.w d0,(a2)      ; we save only if is less     
ammxlinefill_linem0tominus1_1:
    cmp.w 2(a2),d0
    ble.s ammxlinefill_linem0tominus1_2
    move.w d0,2(a2)
ammxlinefill_linem0tominus1_2:
	ENDIF
	IFD USE_CLIPPING
	add.w LINEVERTEX_CLIP_X_OFFSET,d0 ; ONLY IF CLIPPING
	ENDIF

   	;bsr.w plotpoint ; PLOT POINT!!

ammxlinefill_LINESTARTITER_F2:

    

	; interate for each x until x<=xend
	cmp.w d0,d6
	ble.s ammxlinefill_ENDLINE_F2 ; if x>=xend exit

	cmp.w #0,d4 ; check if d<0
	blt.s ammxlinefill_POINT_D_LESS_0_F2 ; branch if id<0

	; we are here if d>=0
	add.w d7,d4 ; d = i2+d
    subq #1,d1 ; y = y-1
    
    addq #1,d0
	
    subq #4,a2

	IFD USE_CLIPPING
	sub.w LINEVERTEX_CLIP_X_OFFSET,d0 ; ONLY IF CLIPPING
	ENDIF
	IFD VAMPIRE
	pminsw  -6(a2),d0,e0
	pmaxsw  -4(a2),d0,e1
	vperm #$67EF67EF,e0,e1,e2
	storec E2,E4,(a2)
	ENDIF
	IFND VAMPIRE
	cmp.w (a2),d0
	bge.s ammxlinefill_linem0tominus1_3            ; if (a2)<=d0 branch (dont update the memory)
    move.w d0,(a2)      ; we save only if is less     
ammxlinefill_linem0tominus1_3:
    cmp.w 2(a2),d0
    ble.s ammxlinefill_linem0tominus1_4
    move.w d0,2(a2)
ammxlinefill_linem0tominus1_4:
	ENDIF
	IFD USE_CLIPPING
	add.w LINEVERTEX_CLIP_X_OFFSET,d0 ; ONLY IF CLIPPING
	ENDIF
	
	bra.s ammxlinefill_LINESTARTITER_F2

ammxlinefill_POINT_D_LESS_0_F2:
	; we are here if d<0
    add.w d5,d4 ; d = i1 +d 
	
	addq #1,d0

	IFD USE_CLIPPING
	sub.w LINEVERTEX_CLIP_X_OFFSET,d0 ; ONLY IF CLIPPING
	ENDIF
	IFD VAMPIRE
	;pminuw  -6(a2),d0,e0
	pmaxsw  -4(a2),d0,e1
	vperm #$67EF67EF,e0,e1,e2
	storec E2,E4,(a2)
	ENDIF
	IFND VAMPIRE
    cmp.w 2(a2),d0
    ble.s ammxlinefill_linem0tominus1_6
    move.w d0,2(a2)
ammxlinefill_linem0tominus1_6:
	ENDIF
	IFD USE_CLIPPING
	add.w LINEVERTEX_CLIP_X_OFFSET,d0 ; ONLY IF CLIPPING
	ENDIF
	
	bra.s ammxlinefill_LINESTARTITER_F2

ammxlinefill_ENDLINE_F2:
	movem.l (sp)+,d0-d7/a2
	rts

FILL_TABLE:
        ;dcb.b 4*256,$FF
		dcb.l 4*256,$7FFF8000

processing_fill_table_addr:
	move.l #FILL_TABLE,d0
	rts


