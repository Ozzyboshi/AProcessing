; RGBTO0R0B0G - Re-maps a 12 bit RGB color  to 24 bit color.
; High nibble will be zeroed for example $123 becomes $010203
; Useful to do math operations on colors
; Input:
; - param1.l : Color to convert(data register format $0RGB)
; - param3.l : Junk register (will be trashed)
; - param4.l : Junk register (will be trashed)

; Output:
; - param2.l : data register that will be used to return new the output color in format $000R0G0B, must be different from the other imputs

; Defines: nothing
;
; Trashes: 
; - param3.l
; - param4.l
RGBTO0R0B0G MACRO
  ; R
  move.l \1,\2
  andi.l #$F00,\2
  lsl.l #8,\2

  ; G
  move.l \1,\3
  andi.l #$F0,\3
  lsl.l #4,\3

  ; B
  move.l \1,\4
  andi.l #$F,\4

  or.l \3,\2
  or.l \4,\2

  ENDM