
TRIANGLE_BLIT:
  movem.l    d0-d2/a1,-(sp)

  lea        VERTEX_LIST_2D_1,a1
  moveq      #2,d2
triangle_blit_loopstart:  
  move.w     (a1),d0                          ; x1
  move.w     2(a1),d1
  bsr.w      point_execute_transformation
  move.w     d0,(a1)+
  move.w     d1,(a1)+
  dbra       d2,triangle_blit_loopstart
  jsr        BLITTRIANGLE
  movem.l    (sp)+,d0-d2/a1
  rts
