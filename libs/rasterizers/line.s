LINE_NODRAW MACRO
  lea       LINEVERTEX_START_FINAL,a1
  move.w    \1,(a1)+
  move.w    \2,(a1)+
  move.w    \3,(a1)+
  move.w    \4,(a1)+
  bsr.w     ammxlinefill
  ENDM

LINE MACRO
  lea       LINEVERTEX_START_FINAL,a1
  move.w    \1,(a1)+
  move.w    \2,(a1)+
  move.w    \3,(a1)+
  move.w    \4,(a1)+
  bsr.w     ammxlinefill
  move.l     AMMX_FILL_FUNCT_ADDR,a1
  jsr        (a1)
  ENDM

LINEDRAW MACRO
  movem.l   d0-d1/a1,-(sp)
  lea       LINEVERTEX_START_FINAL,a1
  move.w    \1,d0
  move.w    \2,d1

  bsr.w     point_execute_transformation

  move.w    d0,(a1)+
  move.w    d1,(a1)+

  move.w    \3,d0
  move.w    \4,d1

  bsr.w     point_execute_transformation

  move.w    d0,(a1)+
  move.w    d1,(a1)+

  bsr.w     ammxlinefill
  move.l    AMMX_FILL_FUNCT_ADDR,a1
  jsr       (a1)

  movem.l   (sp)+,d0-d1/a1

  ENDM