; Q_10_6 implementation
; Usage examples : 
; scale 0,5 on Y axis
;move.w #%0000000001000000,d0
;move.w #%0000000000100000,d1
;bsr.w SHEAR_REG
SHEAR_REG:
  movem.l                                 d0-d2/a0-a4,-(sp)                              ; stack save
  moveq #0,d2
  move.w d1,d2
  swap d2
  ori.w #$0040,d2
  swap d2
  move.l d2,a0
  andi.l #$0000FFFF,d0
  move.l d0,a1
  move.l #$00400000,a2
  move.l #0,a3
  move.l #$00000040,a4

  lea CURRENT_TRANSFORMATION_MATRIX,a6
  LOAD_M2_REG

  bsr.w                                   matrixmul3X3_reg_q10_6

  
  movem.l                                 (sp)+,d0-d2/a0-a4
  rts
