    IFD USE_CLIPPING
ammxlinefill_clip:
	movem.l d0-d7/a2,-(sp) ; stack save
	
	; YA on d2	
	
	; START CHECK IF Xb IS ON THE RIGHT OF THE SCREEN
	move.w LINEVERTEX_END_PUSHED,d5
	cmp.w X_SCREEN_RES_LAST_X,d5
	ble.s ammxlinefill_clip_end_xb
	; Xb OUT OF BOUNDS to right, we need to recalculate Y
    ; but first check if Xa is bigger than XRES, in that case the whole line wont be on the screen
    swap d2
    cmp.w X_SCREEN_RES,d2
    bge.w ammxlinefill_clip_not_drawable
    swap d2
	; L = X_SCREEN_RES_LAST_X-Xa ---- L in d7
	move.w X_SCREEN_RES_LAST_X,d7
	sub.w LINEVERTEX_START_PUSHED,d7
	; J = DeltaX ---- J in d6
	move.w LINEVERTEX_DELTAX,d6
    ; A = DeltaY --- A in d0
    move.w LINEVERTEX_END_PUSHED_Y,d0
    sub.w LINEVERTEX_START_PUSHED_Y,d0
 
    ; y = L/J*A+YA
    muls.w d0,d7
    divs d6,d7
    
    add.w LINEVERTEX_START_PUSHED_Y,d7
    ;sub.w d2,d7 ; subtract Ya
    ;muls.w #-1,d7
    
    ; recalculate LINEVERTEX_END_PUSHED - new X is X_SCREEN_RES_LAST_X - new Y is INSIDE d7
    move.w X_SCREEN_RES_LAST_X,LINEVERTEX_END_PUSHED
    move.w d7,LINEVERTEX_END_PUSHED+2
    
    ; since X and Y have been recalculated I need to update LINEVERTEX_DELTAX and LINEVERTEX_DELTAY
    bsr.w ammxlinefill_clip_deltas
    ;move.w LINEVERTEX_END_PUSHED,LINEVERTEX_DELTAX
    ;swap d2
    ;sub.w d2,LINEVERTEX_DELTAX
    ;swap d2
    ;move.w LINEVERTEX_END_PUSHED+2,LINEVERTEX_DELTAY
    ;sub.w d2,LINEVERTEX_DELTAY
    ;bgt.s ammxlinefill_clip_end_xb
    ;move.w d2,LINEVERTEX_DELTAY
    ;sub.w d7,LINEVERTEX_DELTAY
ammxlinefill_clip_end_xb:
    ; END CHECK IF Xb IS ON THE RIGHT OF THE SCREEN
    
    ; START CHECK IF Xa IS ON THE LEFT OF THE SCREEN
    ;move.l d2,d7
    ;swap d7
    move.w LINEVERTEX_START_PUSHED_X,d7
    cmpi.w #0,d7
    bge.s ammxlinefill_clip_end_xa
    ; Xa OUT OF BOUNDS to left, we need to recalculate Y
    ; but first check if Xb is <0 , in that case the whole line wont be on the screen
    move.w LINEVERTEX_END_PUSHED,d7
    cmpi.w #0,d7
    blt.w ammxlinefill_clip_not_drawable

    ; L = 0-Xa ---- L in d7
	moveq #0,d7
	sub.w LINEVERTEX_START_PUSHED,d7
	; J = DeltaX ---- J in d6
	move.w LINEVERTEX_DELTAX,d6
	; y = L/J*A+YA
    muls.w LINEVERTEX_DELTAY,d7
    divs d6,d7
    
    add.w d2,d7 ; subtract Ya
    
    ; recalculate LINEVERTEX_START_PUSHED - new X is 0 - new Y is INSIDE d7
    move.w #0,LINEVERTEX_START_PUSHED
    move.w d7,LINEVERTEX_START_PUSHED+2
    
    ; since X and Y have been recalculated I need to update LINEVERTEX_DELTAX and LINEVERTEX_DELTAY
    bsr.w ammxlinefill_clip_deltas
    ;move.w LINEVERTEX_END_PUSHED,LINEVERTEX_DELTAX
    ;addq #1,LINEVERTEX_DELTAX
    ;move.w LINEVERTEX_END_PUSHED+2,LINEVERTEX_DELTAY
    ;sub.w d2,LINEVERTEX_DELTAY
    ;bgt.s ammxlinefill_clip_x_within
    ;move.w d2,LINEVERTEX_DELTAY
    ;sub.w d7,LINEVERTEX_DELTAY




    nop
    ; END CHECK IF Xa IS ON THE LEFT OF THE SCREEN
ammxlinefill_clip_end_xa:

    ; START CHECK IF Yb IS ON THE TOP OF THE SCREEN (a negative Y)
	move.w LINEVERTEX_END_PUSHED_Y,d5
	cmp.w #0,d5  ; if d5>0 jump (drawable without clipping)
	bge.s ammxlinefill_clip_end_yb
	; Yb OUT OF BOUNDS to TOP, we need to recalculate Y
    ; but first check if Ya is also negative, in that case the whole line wont be on the screen
    move.w LINEVERTEX_START_PUSHED_Y,d2
    cmp.w #0,d2
    ble.w ammxlinefill_clip_not_drawable ; if d2<0 jump to not drawable
    ; start of the clipping routine
    move.w LINEVERTEX_DELTAX,d7
    neg d2
    muls.w d2,d7
    move.w LINEVERTEX_END_PUSHED_Y,d6
    sub.w LINEVERTEX_START_PUSHED_Y,d6
    divs d6,d7
    add.w LINEVERTEX_START_PUSHED_X,d7
    move.w d7,LINEVERTEX_END_PUSHED_X
    move.w #0,LINEVERTEX_END_PUSHED_Y
    bsr.w ammxlinefill_clip_deltas
ammxlinefill_clip_end_yb:

    ; START CHECK IF Yb IS ON THE BOTTOM OF THE SCREEN (Y>255)
    move.w LINEVERTEX_END_PUSHED_Y,d5
    cmp.w #255,d5
    blt.s ammxlinefill_clip_end_yb2
    move.w LINEVERTEX_START_PUSHED_Y,d2
    cmp.w #255,d2
    bge.w ammxlinefill_clip_not_drawable ; if d2<0 jump to not drawable
    move.w #255,d7
    sub.w d2,d7
    move.w LINEVERTEX_END_PUSHED_X,d6
    sub.w LINEVERTEX_START_PUSHED_X,d6
    muls.w d6,d7
    move.w LINEVERTEX_END_PUSHED_Y,d6
    sub.w LINEVERTEX_START_PUSHED_Y,d6
    divs d6,d7
    add.w LINEVERTEX_START_PUSHED_X,d7
    move.w d7,LINEVERTEX_END_PUSHED_X
    move.w #255,LINEVERTEX_END_PUSHED_Y
    bsr.w ammxlinefill_clip_deltas
    
ammxlinefill_clip_end_yb2:

; START CHECK IF Ya IS ON THE TOP OF THE SCREEN (a negative Y)
	move.w LINEVERTEX_START_PUSHED_Y,d5
	cmp.w #0,d5  ; if d5>0 jump (drawable without clipping)
	bge.s ammxlinefill_clip_end_ya
	; Ya OUT OF BOUNDS to TOP, we need to recalculate Y
    ; start of the clipping routine
    move.w LINEVERTEX_DELTAX,d7
    neg d2
    muls.w d2,d7
    move.w LINEVERTEX_END_PUSHED_Y,d6
    sub.w LINEVERTEX_START_PUSHED_Y,d6
    divs d6,d7
    add.w LINEVERTEX_START_PUSHED_X,d7
    move.w d7,LINEVERTEX_START_PUSHED_X
    move.w #0,LINEVERTEX_START_PUSHED_Y
    bsr.w ammxlinefill_clip_deltas
ammxlinefill_clip_end_ya:

     ; START CHECK IF Ya IS ON THE BOTTOM OF THE SCREEN (Y>255)
    move.w LINEVERTEX_START_PUSHED_Y,d5
    cmp.w #255,d5
    blt.s ammxlinefill_clip_end_ya2
    move.w #255,d7
    sub.w d5,d7
    move.w LINEVERTEX_END_PUSHED_X,d6
    sub.w LINEVERTEX_START_PUSHED_X,d6
    muls.w d6,d7
    move.w LINEVERTEX_END_PUSHED_Y,d6
    sub.w LINEVERTEX_START_PUSHED_Y,d6
    divs d6,d7
    add.w LINEVERTEX_START_PUSHED_X,d7
    move.w d7,LINEVERTEX_START_PUSHED_X
    move.w #255,LINEVERTEX_START_PUSHED_Y
    bsr.w ammxlinefill_clip_deltas

ammxlinefill_clip_end_ya2:

ammxlinefill_clip_x_within:
	nop
ammxlinefill_clip_end:
	movem.l (sp)+,d0-d7/a2
	rts
	
ammxlinefill_clip_not_drawable:
    move.w #$FFFF,LINEVERTEX_START_PUSHED
    movem.l (sp)+,d0-d7/a2
	rts
	
ammxlinefill_clip_deltas:
    move.l d0,-(sp)
    move.w LINEVERTEX_END_PUSHED_X,d0
    sub.w LINEVERTEX_START_PUSHED_X,d0
    move.w d0,LINEVERTEX_DELTAX
    
    move.w LINEVERTEX_END_PUSHED_Y,d0
    sub.w LINEVERTEX_START_PUSHED_Y,d0
    bpl.s ammxlinefill_clip_deltas_max
    neg d0
ammxlinefill_clip_deltas_max:
    move.w d0,LINEVERTEX_DELTAY
    
    move.l (sp)+,d0
    rts
    ENDIF
