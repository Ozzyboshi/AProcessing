; Q_10_6 implementation
; Usage examples : 
;	move.w #60,d0
;	move.w #28,d1
;	bsr.w SCALE
SCALE:
  movem.l                                 d0-d2,-(sp)                              ; stack save
  IFD                                     VAMPIRE
  LOAD_CURRENT_TRANSFORMATION_MATRIX      e4,e5,e6
  andi.l                                  #$0000FFFF,d0
  andi.l                                  #$0000FFFF,d1
  move.l                                  #$0040FFFF,d2
  move.w                                  d1,d2
    	

	; Transformation matrix is the Multiplicand
  vperm                                   #$88678888,d0,d2,e1                      ; 0 a 0 0  - a is the horizontal scaling factor
  vperm                                   #$8888EF88,d0,d2,e2                      ; 0 0 d 0  - d is the vertical scaling factor
  REG_LOADI                               0000,0000,0000,0040,e3

  ENDIF
  IFND                                    VAMPIRE
  LOAD_CURRENT_TRANSFORMATION_MATRIX      OPERATOR2_TR_MATRIX_ROW1
  move.w                                  #$0000,OPERATOR1_TR_MATRIX_ROW1
  move.w                                  d0,OPERATOR1_TR_MATRIX_ROW1+2
  move.l                                  #$00000000,OPERATOR1_TR_MATRIX_ROW1+4
  move.l                                  #$00000000,OPERATOR1_TR_MATRIX_ROW2
  move.w                                  d1,OPERATOR1_TR_MATRIX_ROW2+4
  move.w                                  #$0000,OPERATOR1_TR_MATRIX_ROW2+6
  move.l                                  #$00000000,OPERATOR1_TR_MATRIX_ROW3
  move.l                                  #$00000040,OPERATOR1_TR_MATRIX_ROW3+4
    
  ENDIF
  bsr.w                                   ammxmatrixmul3X3_q10_6
  IFD                                     VAMPIRE
  UPDATE_CURRENT_TRANSFORMATION_MATRIX    e13,e14,e15
  ENDIF
  IFND                                    VAMPIRE
  lea                                     CURRENT_TRANSFORMATION_MATRIX,a0
  move.l                                  OPERATOR3_TR_MATRIX_ROW1,(a0)+
  move.l                                  OPERATOR3_TR_MATRIX_ROW1+4,(a0)+

  move.l                                  OPERATOR3_TR_MATRIX_ROW2,(a0)+
  move.l                                  OPERATOR3_TR_MATRIX_ROW2+4,(a0)+

  move.l                                  OPERATOR3_TR_MATRIX_ROW3,(a0)+
  move.l                                  OPERATOR3_TR_MATRIX_ROW3+4,(a0)+
  ENDIF
  movem.l                                 (sp)+,d0-d2
  rts
