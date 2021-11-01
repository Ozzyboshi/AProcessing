; FLIP MACROS
FLIPX MACRO
  move.w                                  #%1111111111000000,d0
  move.w                                  #%0000000001000000,d1
  jsr                                     SCALE
  ENDM
FLIPY MACRO
  move.w                                  #%1111111111000000,d1
  move.w                                  #%0000000001000000,d0
  jsr                                     SCALE
  ENDM
FLIPXY MACRO
  move.w                                  #%1111111111000000,d1
  move.w                                  d1,d0
  jsr                                     SCALE
  ENDM
; Q_10_6 implementation
; Usage examples : 
; scale 0,5 on Y axis
;move.w #%0000000001000000,d0
;move.w #%0000000000100000,d1
;bsr.w SCALE
SCALE:
  movem.l                                 d0-d2/a0,-(sp)                              ; stack save
  IFD                                     VAMPIRE
  LOAD_CURRENT_TRANSFORMATION_MATRIX      e4,e5,e6
  andi.l                                  #$0000FFFF,d0
  andi.l                                  #$0000FFFF,d1
  move.l                                  #$0040FFFF,d2
  move.w                                  d1,d2
    	

	; Transformation matrix is the Multiplicand
  vperm                                   #$CC67CCCC,d0,d2,e1                      ; 0 a 0 0  - a is the horizontal scaling factor
  vperm                                   #$CCCCEFCC,d0,d2,e2                      ; 0 0 d 0  - d is the vertical scaling factor
  REG_LOADI                               0000,0000,0000,0040,e3

  ELSE
  LOAD_CURRENT_TRANSFORMATION_MATRIX      OPERATOR2_TR_MATRIX_ROW1
  moveq #0,d2
  lea OPERATOR1_TR_MATRIX_ROW1(PC),a0
  move.w                                  d2,(a0)+
  move.w                                  d0,(a0)+
  move.l                                  d2,(a0)+
  move.l                                  d2,(a0)+
  move.w                                  d1,(a0)+
  move.w                                  d2,(a0)+
  move.l                                  d2,(a0)+
  move.l                                  #$00000040,(a0)
    
  ENDIF
  bsr.w                                   ammxmatrixmul3X3_q10_6
  IFD                                     VAMPIRE
  UPDATE_CURRENT_TRANSFORMATION_MATRIX    e13,e14,e15
  ENDIF
  IFND                                    VAMPIRE
  lea                                     CURRENT_TRANSFORMATION_MATRIX(PC),a0
  move.l                                  OPERATOR3_TR_MATRIX_ROW1(PC),(a0)+
  move.l                                  4+OPERATOR3_TR_MATRIX_ROW1(PC),(a0)+

  move.l                                  OPERATOR3_TR_MATRIX_ROW2(PC),(a0)+
  move.l                                  4+OPERATOR3_TR_MATRIX_ROW2(PC),(a0)+

  move.l                                  OPERATOR3_TR_MATRIX_ROW3(PC),(a0)+
  move.l                                  4+OPERATOR3_TR_MATRIX_ROW3(PC),(a0)+
  ENDIF
  movem.l                                 (sp)+,d0-d2/a0
  rts
