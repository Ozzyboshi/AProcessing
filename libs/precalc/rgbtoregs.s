; RGBTOREGS - Re-maps a 12 bit RGB color  to 3 different register.
; Input:
; - param1.l : Color to convert(data register format $0RGB)


; Output:
; - param2.l : output register 1
; - param3.l : output register 2
; - param4.l : output register 3
; Defines: nothing
;
; Trashes: Nothing

RGBTOREGS MACRO
  ; R
  move.w \1,\2
  lsr.w #8,\2

  ; G
  move.l \1,\3
  andi.l #$F0,\3
  lsr.w #4,\3

  ; B
  move.l \1,\4
  andi.l #$F,\4

  ENDM