; Q_10_6 implementation
; Usage examples :
; scale 0,5 on Y axis
;move.w #%0000000001000000,d0
;move.w #%0000000000100000,d1
;bsr.w SCALE
SCALE_REG:
  movem.l                                 d0-d2/d5-d7/a0-a4/a6,-(sp)                              ; stack save

  moveq #0,d2
  move.l d2,a1
  move.l d2,a3

  move.w d0,d2
  swap d2
  move.l d2,a0


  moveq #0,d2
  move.w d1,d2
  swap d2
  move.l d2,a2

  move.l #$00000040,a4

  lea                                     CURRENT_TRANSFORMATION_MATRIX,a6
  LOAD_M2_REG

  ; Start calculation of output position  M-output(1,1)
  M1_1_1 d5
  ; d5 = M1(1,1) x M2(1,1)
  move.l d0,d6
  swap d6
  muls   d6,d5
  asr.l #6,d5
  move.w d5,2(a6)

  ; Start calculation of output position  M-output(1,2)
  ; d5 = M1(1,1) x M2(1,2)
  move.l a0,d5
  swap d5
  muls   d0,d5
  asr.l #6,d5
  move.w d5,4(a6)

; Start calculation of output position  M-output(1,3)
  ; d5 = M1(1,1) x M2(1,3)
  move.l a0,d5
  move.l d1,d6
  swap d5
  swap d6
  muls   d6,d5
  asr.l #6,d5
  move.w d5,6(a6)

 ; Start calculation of output position  M-output(2,1)

  ; d5 = M1(2,2) x M2(2,1)
  M1_2_2 d5
  muls d1,d5
  asr.l #6,d5
  move.w d5,10(a6)

; Start calculation of output position  M-output(2,2)
  ; d5 = M1(2,2) x M2(2,2)
  M1_2_2 d5
  M2_2_2 d7
  muls d7,d5
  asr.l #6,d5
  move.w d5,12(a6)

; Start calculation of output position  M-output(2,3)
  ; d5 = M1(2,2) x M2(2,3)
  M1_2_2 d5
  muls d2,d5
  asr.l #6,d5

; Start calculation of output position  M-output(3,1)
  ; d5 = M1(3,3) x M2(3,1)
  M2_3_1 d7
  move.w d7,18(a6)

; Start calculation of output position  M-output(3,2)
  ; d5 = M1(3,3) x M2(3,2)
  move.w d3,20(a6)

; Start calculation of output position  M-output(3,3)
  ; d5 = M1(3,3) x M2(3,3)
  move.w d4,22(a6)
  movem.l (sp)+,d0-d2/d5-d7/a0-a4/a6
  rts