; this function halves the lower word of d0 and put the result in the lower byte of d0
; for example , if d0 is binary 1010101010101010 the function stores in
; the lower byte of d0 the value 00000000.
; In other words, only bits with position even are retained
; Useful for downscaling an image
; trashes nothing
; output is into d0
HALF_WORD:
  movem.l          d1/d2/d5/d6/d7,-(sp)

  moveq #8-1,d7
  moveq #0,d6
  moveq #1,d5
  moveq #0,d2

half_word_loop:
  btst d6,d0
  sne d1
  ext.w d1
  and.w d5,d1
  or.w d1,d2

  lsl.w #1,d5
  addq #2,d6

  dbra d7,half_word_loop

  move.b d2,d0

  movem.l          (sp)+,d1/d2/d5/d6/d7
  rts