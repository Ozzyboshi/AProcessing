LINE MACRO
  lea       LINEVERTEX_START_FINAL,a1
  move.w    \1,(a1)+
  move.w    \2,(a1)+
  move.w    \3,(a1)+
  move.w    \4,(a1)+
  bsr.w     ammxlinefill
  ENDM