; CMP8BYTESEX(S/L)
; 1 - element 1 to compare (can be immediate)
; 2 - element 2 to compare (must be data register)
; 3 - scratch register
; 4 - label to jump IF equal
; 5 - label to jump IF NOT equal
CMP8BYTESEXS MACRO
  pcmpeqb \1,\2,\3
  not.l \3
  bne.s \5
  lsrq #32,\3,\3
  not.l \3
  bne.s \5
  bra.s \4
  ENDM

CMP8BYTESEXSW MACRO
  pcmpeqb \1,\2,\3
  not.l \3
  bne.w \5
  lsrq #32,\3,\3
  not.l \3
  bne.w \5
  bra.w \4
  ENDM