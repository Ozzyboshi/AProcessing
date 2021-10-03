; ammx_fill_table_single_line - Fills a single line according to the fill table into screens
; Input:
;	- LINEVERTEX_END_PUSHED_Y.w
;	...
; Output:
;   d0 = $FFFF if the figure is not drawable
;   d0 = 0 in all other cases
;   The new LINEVERTEX_START_PUSHED_X
;   The new LINEVERTEX_START_PUSHED_Y
;
; Defines:
; - USE_CLIPPING
;
; Trashes:
;   Nothing

  IFD        USE_CLIPPING
ammxlinefill_clip:
  movem.l    d2/d5-d7/a2,-(sp)                   ; stack save
  moveq      #0,d0
    
    ; START CHECK IF Yb IS ON THE TOP OF THE SCREEN (a negative Y)
  move.w     LINEVERTEX_END_PUSHED_Y(PC),d5
  tst.w      d5                                  ; if d5>0 jump (drawable without clipping)
  bge.s      ammxlinefill_clip_end_yb
	; Yb OUT OF BOUNDS to TOP, we need to recalculate Y
    ; but first check if Ya is also negative, in that case the whole line wont be on the screen
  move.w     LINEVERTEX_START_PUSHED_Y(PC),d2
  tst.w      d2
  ble.w      ammxlinefill_clip_not_drawable      ; if d2<0 jump to not drawable
    ; start of the clipping routine
  move.w     LINEVERTEX_DELTAX(PC),d7
  neg        d2
  muls.w     d2,d7
  move.w     d5,d6
  neg        d2
  sub.w      d2,d6
  divs       d6,d7
  add.w      LINEVERTEX_START_PUSHED_X(PC),d7
  bpl.s      ammxlinefill_clip_yb_noneg
  addq       #1,d7
ammxlinefill_clip_yb_noneg:
  move.w     d7,LINEVERTEX_END_PUSHED_X
  move.w     #0,LINEVERTEX_END_PUSHED_Y
  bsr.w      ammxlinefill_clip_deltas
ammxlinefill_clip_end_yb:

    ; START CHECK IF Yb IS ON THE BOTTOM OF THE SCREEN (Y>255)
  move.w     LINEVERTEX_END_PUSHED_Y(PC),d5
  cmpi.w     #255,d5
  blt.s      ammxlinefill_clip_end_yb2
  move.w     LINEVERTEX_START_PUSHED_Y,d2
  cmpi.w     #255,d2
  bge.w      ammxlinefill_clip_not_drawable      ; if d2<0 jump to not drawable
  move.w     #255,d7
  sub.w      d2,d7
  move.w     LINEVERTEX_END_PUSHED_X,d6
  sub.w      LINEVERTEX_START_PUSHED_X,d6
  muls.w     d6,d7
  move.w     LINEVERTEX_END_PUSHED_Y,d6
  sub.w      LINEVERTEX_START_PUSHED_Y,d6
  divs       d6,d7
  add.w      LINEVERTEX_START_PUSHED_X,d7
  move.w     d7,LINEVERTEX_END_PUSHED_X
  move.w     #255,LINEVERTEX_END_PUSHED_Y
  bsr.w      ammxlinefill_clip_deltas
    
ammxlinefill_clip_end_yb2:

; START CHECK IF Ya IS ON THE TOP OF THE SCREEN (a negative Y)
  move.w     LINEVERTEX_START_PUSHED_Y(PC),d5
  tst.w      d5                                  ; if d5>0 jump (drawable without clipping)
  bge.s      ammxlinefill_clip_end_ya
	; Ya OUT OF BOUNDS to TOP, we need to recalculate Y
    ; start of the clipping routine
  move.w     LINEVERTEX_DELTAX(PC),d7
  neg        d2
  muls.w     d2,d7
  move.w     LINEVERTEX_END_PUSHED_Y(PC),d6
  sub.w      LINEVERTEX_START_PUSHED_Y(PC),d6
  divs       d6,d7
  add.w      LINEVERTEX_START_PUSHED_X(PC),d7
  move.w     d7,LINEVERTEX_START_PUSHED_X
  move.w     #0,LINEVERTEX_START_PUSHED_Y
  bsr.w      ammxlinefill_clip_deltas
ammxlinefill_clip_end_ya:

     ; START CHECK IF Ya IS ON THE BOTTOM OF THE SCREEN (Y>255)
  move.w     LINEVERTEX_START_PUSHED_Y(PC),d5
  cmpi.w     #255,d5
  blt.s      ammxlinefill_clip_end
  move.w     #255,d7
  sub.w      d5,d7
  move.w     LINEVERTEX_END_PUSHED_X(PC),d6
  sub.w      LINEVERTEX_START_PUSHED_X(PC),d6
  muls.w     d6,d7
  move.w     LINEVERTEX_END_PUSHED_Y(PC),d6
  sub.w      LINEVERTEX_START_PUSHED_Y(PC),d6
  divs       d6,d7
  add.w      LINEVERTEX_START_PUSHED_X(PC),d7
  move.w     d7,LINEVERTEX_START_PUSHED_X
  move.w     #255,LINEVERTEX_START_PUSHED_Y
  bsr.w      ammxlinefill_clip_deltas

ammxlinefill_clip_end:
  movem.l    (sp)+,d2/d5-d7/a2
  rts
	
ammxlinefill_clip_not_drawable:
  move.w     #$FFFF,d0
  movem.l    (sp)+,d2/d5-d7/a2
  rts
	
ammxlinefill_clip_deltas:
  move.l     d0,-(sp)
  move.w     LINEVERTEX_END_PUSHED_X(PC),d0
  sub.w      LINEVERTEX_START_PUSHED_X(PC),d0
  move.w     d0,LINEVERTEX_DELTAX
    
  move.w     LINEVERTEX_END_PUSHED_Y(PC),d0
  sub.w      LINEVERTEX_START_PUSHED_Y(PC),d0
  bpl.s      ammxlinefill_clip_deltas_max
  neg        d0
ammxlinefill_clip_deltas_max:
  move.w     d0,LINEVERTEX_DELTAY
    
  move.l     (sp)+,d0
  rts
  ENDC
