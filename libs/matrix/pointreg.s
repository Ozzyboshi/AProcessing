; place x into d0
;       y into d1
; output will be into d0 d1 (register overwritten)
; point_execute_transformation - Transform a point accordint to the current matrix
; Input:
;	- d0.w : Point X (0-319)
;	- d1.w : Point Y (0-255)
;
; Output:
;- d0.w : Point X transformed
;- d1.w : Point Y transformed

; Defines: None
;
; Trashes: nothing

point_execute_transformation_reg:
  movem.l                                  d2/a0/a1/a6,-(sp)

  moveq                                    #6,d2

  asl.w                                    d2,d0
  asl.w                                    d2,d1


  ; Load point into ax registers
  swap  d0
  move.w d1,d0
  move.l d0,a0
  move.l #$00000040,a1

  ; Load transormation matrix into registers for multiplications
  lea CURRENT_TRANSFORMATION_MATRIX,a6
  LOAD_M2_REG

  bsr.w                                    matrixmul1X3_reg_q10_6_point_2d

  move.l                                   d4,d0
  swap                                     d0
  move.w                                   d4,d1

  ext.l                                    d0
  ext.l                                    d1

  moveq                                    #6,d2
  lsr.l                                    d2,d0
  lsr.l                                    d2,d1

  movem.l                                  (sp)+,d2/a0/a1/a6
  rts


matrixmul1X3_reg_q10_6_point_2d:
  movem.l d5-d7,-(sp)
    
  ; Start calculation of output position  M-output(1,1)
  M1_1_1 d5
  ; d5 = M1(1,1) x M2(1,1)
  move.l d0,d6
  swap d6
  muls   d6,d5
  asr.l #6,d5
    
  ; d6 = M1(1,2) x M2(2,1)
  move.w a0,d6
  muls d1,d6
  asr.l #6,d6
    
  add.l d6,d5
    
  ; d6 = M1(1,3) x M2(3,1)
  move.l d3,d7
  move.w #$0000,d7
  swap d7
    
  add.l d7,d5
  move.w d5,d4
  swap d4
    
  ; Start calculation of output position  M-output(1,2)
  ; d5 = M1(1,1) x M2(1,2)
  move.l a0,d5
  swap d5
  muls   d0,d5
  asr.l #6,d5
    
  ; d6 = M1(1,2) x M2(2,2)
  move.w a0,d6
  move.l d2,d7
  swap d7
  muls d7,d6
  asr.l #6,d6
    
  add.l d6,d5
    
  ; d6 = M1(1,3) x M2(3,2)
    
  moveq #$0,d7
  move.w d3,d7
    
  add.l d3,d5
  move.w d5,d4 

    
  movem.l (sp)+,d5-d7
  rts
