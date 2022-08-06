  XDEF                                          _matrix_multest1
  XDEF                                          _matrix_multest2
  XDEF                                          _matrix_multest3
  XDEF                                          _matrix_multest4
  XDEF                                          _matrix_multest5
  XDEF                                          _matrix_multest6
  XDEF                                          _matrix_multest7
  XDEF                                          _matrix_multest8
  XDEF                                          _matrix_multest9
  XDEF                                          _matrix_multest10
  XDEF                                          _matrix_multest11
  XDEF                                          _matrix_multest12
  XDEF                                          _matrix_multest13
  XDEF                                          _matrix_multest14
  XDEF                                          _matrix_multest15
  XDEF                                          _matrix_multest16
  XDEF                                          _matrix_multest17
  XDEF                                          _matrix_multest18
  XDEF                                          _matrix_multest19
  XDEF                                          _matrix_multest20
  XDEF                                          _matrix_multest21
  XDEF                                          _matrix_multest22
  XDEF                                          _matrix_multest23
  XDEF                                          _matrix_multest24
  XDEF                                          _matrix_multest25
  XDEF                                          _matrix_multest26

  SECTION                                       PROCESSING,CODE_F

  include                                       "../../../libs/ammxmacros.i"
  include                                       "../../../libs/matrix/matrixcommon.s"
  include                                       "../../../libs/matrix/matrix.s"
  include                                       "../../../libs/matrix/matrixreg.s"
  include                                       "../../../libs/matrix/scale.s"
  include                                       "../../../libs/matrix/scalereg.s"
  include                                       "../../../libs/matrix/shear.s"
  include                                       "../../../libs/matrix/shearreg.s"
  include                                       "../../../libs/matrix/rotatereg.s"
  include                                       "../../../libs/trigtables.i"

_matrix_multest1:
  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6
  IFD                                           VAMPIRE
  LOAD_CURRENT_TRANSFORMATION_MATRIX            e1,e2,e3

  REG_LOADI                                     0000,0040,0040,0040,e4
  REG_LOADI                                     0000,0040,0040,0040,e5
  REG_LOADI                                     0000,0040,0040,0040,e6
  ENDIF
  IFND                                          VAMPIRE
  LOAD_CURRENT_TRANSFORMATION_MATRIX            OPERATOR1_TR_MATRIX_ROW1
  move.l                                        #$00000040,OPERATOR2_TR_MATRIX_ROW1
  move.l                                        #$00400040,OPERATOR2_TR_MATRIX_ROW1+4
  move.l                                        #$00000040,OPERATOR2_TR_MATRIX_ROW2
  move.l                                        #$00400040,OPERATOR2_TR_MATRIX_ROW2+4
  move.l                                        #$00000040,OPERATOR2_TR_MATRIX_ROW3
  move.l                                        #$00400040,OPERATOR2_TR_MATRIX_ROW3+4
  ENDIF

  bsr.w                                         ammxmatrixmul3X3_q10_6

  IFD                                           VAMPIRE
  AMMX_DUMP_REGS_TO_THIRD_OP                    e13,e14,e15
  ENDIF

  processing_third_matrix_addr

  rts

_matrix_multest2:
  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6
  IFD                                           VAMPIRE
	
  REG_LOADI                                     0000,0060,00A0,00E0,e1
  REG_LOADI                                     0000,0110,0150,0190,e2
  REG_LOADI                                     0000,01C7,0207,0247,e3

  REG_LOADI                                     0000,02E0,0320,0360,e4
  REG_LOADI                                     0000,0390,03D0,0410,e5
  REG_LOADI                                     0000,0447,0487,04C7,e6

	

  ENDIF
  IFND                                          VAMPIRE
	
	; 1.5 2.5 3,5 / 4.25 5.25 6.25 / 7.111 8.111 9.111
  move.l                                        #$00000060,OPERATOR1_TR_MATRIX_ROW1
  move.l                                        #$00A000E0,OPERATOR1_TR_MATRIX_ROW1+4
  move.l                                        #$00000110,OPERATOR1_TR_MATRIX_ROW2
  move.l                                        #$01500190,OPERATOR1_TR_MATRIX_ROW2+4
  move.l                                        #$000001C7,OPERATOR1_TR_MATRIX_ROW3
  move.l                                        #$02070247,OPERATOR1_TR_MATRIX_ROW3+4

    ; 11.5 12.5 13,5 / 14.25 15.25 16.25 / 17.111 18.111 19.111
  move.l                                        #$000002E0,OPERATOR2_TR_MATRIX_ROW1
  move.l                                        #$03200360,OPERATOR2_TR_MATRIX_ROW1+4
  move.l                                        #$00000390,OPERATOR2_TR_MATRIX_ROW2
  move.l                                        #$03D00410,OPERATOR2_TR_MATRIX_ROW2+4
  move.l                                        #$00000447,OPERATOR2_TR_MATRIX_ROW3
  move.l                                        #$048704C7,OPERATOR2_TR_MATRIX_ROW3+4


  ENDIF

  bsr.w                                         ammxmatrixmul3X3_q10_6

  IFD                                           VAMPIRE
  AMMX_DUMP_REGS_TO_THIRD_OP                    e13,e14,e15
  ENDIF

  processing_third_matrix_addr

  rts

_matrix_multest3:
  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6
  IFD                                           VAMPIRE
	
  REG_LOADI                                     0000,FFC0,00A0,00E0,e1
  REG_LOADI                                     0000,0110,0150,0190,e2
  REG_LOADI                                     0000,01C7,0207,0247,e3

  REG_LOADI                                     0000,02E0,0320,0360,e4
  REG_LOADI                                     0000,0390,03D0,0410,e5
  REG_LOADI                                     0000,0447,0487,04C7,e6

  ENDIF
  IFND                                          VAMPIRE
	
	; -1 2.5 3,5 / 4.25 5.25 6.25 / 7.111 8.111 9.111
  move.l                                        #$0000FFC0,OPERATOR1_TR_MATRIX_ROW1
  move.l                                        #$00A000E0,OPERATOR1_TR_MATRIX_ROW1+4
  move.l                                        #$00000110,OPERATOR1_TR_MATRIX_ROW2
  move.l                                        #$01500190,OPERATOR1_TR_MATRIX_ROW2+4
  move.l                                        #$000001C7,OPERATOR1_TR_MATRIX_ROW3
  move.l                                        #$02070247,OPERATOR1_TR_MATRIX_ROW3+4

    ; 11.5 12.5 13,5 / 14.25 15.25 16.25 / 17.111 18.111 19.111
  move.l                                        #$000002E0,OPERATOR2_TR_MATRIX_ROW1
  move.l                                        #$03200360,OPERATOR2_TR_MATRIX_ROW1+4
  move.l                                        #$00000390,OPERATOR2_TR_MATRIX_ROW2
  move.l                                        #$03D00410,OPERATOR2_TR_MATRIX_ROW2+4
  move.l                                        #$00000447,OPERATOR2_TR_MATRIX_ROW3
  move.l                                        #$048704C7,OPERATOR2_TR_MATRIX_ROW3+4


  ENDIF

  bsr.w                                         ammxmatrixmul3X3_q10_6

  IFD                                           VAMPIRE
  AMMX_DUMP_REGS_TO_THIRD_OP                    e13,e14,e15
  ENDIF

  processing_third_matrix_addr

  rts


_matrix_multest4:
  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6
  IFD                                           VAMPIRE
	
  REG_LOADI                                     0000,FFC0,00A0,00E0,e1

  REG_LOADI                                     0000,02E0,0320,0360,e4
  REG_LOADI                                     0000,0390,03D0,0410,e5
  REG_LOADI                                     0000,0447,0487,04C7,e6

  ENDIF
  IFND                                          VAMPIRE
	
	; -1 2.5 3,5
  move.l                                        #$0000FFC0,OPERATOR1_TR_MATRIX_ROW1
  move.l                                        #$00A000E0,OPERATOR1_TR_MATRIX_ROW1+4

    ; 11.5 12.5 13,5 / 14.25 15.25 16.25 / 17.111 18.111 19.111
  move.l                                        #$000002E0,OPERATOR2_TR_MATRIX_ROW1
  move.l                                        #$03200360,OPERATOR2_TR_MATRIX_ROW1+4
  move.l                                        #$00000390,OPERATOR2_TR_MATRIX_ROW2
  move.l                                        #$03D00410,OPERATOR2_TR_MATRIX_ROW2+4
  move.l                                        #$00000447,OPERATOR2_TR_MATRIX_ROW3
  move.l                                        #$048704C7,OPERATOR2_TR_MATRIX_ROW3+4


  ENDIF

  bsr.w                                         ammxmatrixmul1X3_q10_6

  IFD                                           VAMPIRE
  AMMX_DUMP_REGS_TO_THIRD_OP                    e13,e14,e15
  ENDIF

  processing_third_matrix_addr

  rts

_matrix_multest5:
  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6
  IFD                                           VAMPIRE
	
  REG_LOADI                                     0000,FC5D,0000,0000,e1

  REG_LOADI                                     0000,02E0,0320,0360,e4
  REG_LOADI                                     0000,0390,03D0,0410,e5
  REG_LOADI                                     0000,0447,0487,04C7,e6

  ENDIF
  IFND                                          VAMPIRE
	
	; -14.55 2.5 3,5
  move.l                                        #$0000FC5D,OPERATOR1_TR_MATRIX_ROW1
  move.l                                        #$00000000,OPERATOR1_TR_MATRIX_ROW1+4

    ; 11.5 12.5 13,5 / 14.25 15.25 16.25 / 17.111 18.111 19.111
  move.l                                        #$000002E0,OPERATOR2_TR_MATRIX_ROW1
  move.l                                        #$03200360,OPERATOR2_TR_MATRIX_ROW1+4
  move.l                                        #$00000390,OPERATOR2_TR_MATRIX_ROW2
  move.l                                        #$03D00410,OPERATOR2_TR_MATRIX_ROW2+4
  move.l                                        #$00000447,OPERATOR2_TR_MATRIX_ROW3
  move.l                                        #$048704C7,OPERATOR2_TR_MATRIX_ROW3+4


  ENDIF

  bsr.w                                         ammxmatrixmul1X3_q10_6

  IFD                                           VAMPIRE
  AMMX_DUMP_REGS_TO_THIRD_OP                    e13,e14,e15
  ENDIF

  processing_third_matrix_addr

  rts

_matrix_multest6:
  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6
  TRANSLATE_INV_Q_10_6                          #160*64,#128*64
  processing_current_transformation_matrix_addr
  rts

_matrix_multest7:
  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

  move.w                                        #60,d0
  move.w                                        #28,d1
  bsr.w                                         TRANSLATE

	;TRANSLATE_INV_Q_10_6 d0,d1
	;TRANSLATE_INV_Q_10_6 #100*64,#100*64
  move.w                                        #100,d0
  move.w                                        #100,d1
  bsr.w                                         TRANSLATE

  processing_current_transformation_matrix_addr
  rts

_matrix_multest8:

  IFD                                           VAMPIRE
	
  REG_LOADI                                     0000,0040,0000,0000,e1
  REG_LOADI                                     0000,0000,0040,0000,e2
  REG_LOADI                                     0000,0000,0000,0040,e3

  REG_LOADI                                     0000,0800,0000,0000,e4
  REG_LOADI                                     0000,0000,0800,0000,e5
  REG_LOADI                                     0000,0000,0000,0800,e6

  ENDIF
  IFND                                          VAMPIRE
	
	; 1.5 2.5 3,5 / 4.25 5.25 6.25 / 7.111 8.111 9.111
  move.l                                        #$00000040,OPERATOR1_TR_MATRIX_ROW1
  move.l                                        #$00000000,OPERATOR1_TR_MATRIX_ROW1+4
  move.l                                        #$00000000,OPERATOR1_TR_MATRIX_ROW2
  move.l                                        #$00400000,OPERATOR1_TR_MATRIX_ROW2+4
  move.l                                        #$00000000,OPERATOR1_TR_MATRIX_ROW3
  move.l                                        #$00000040,OPERATOR1_TR_MATRIX_ROW3+4
	
    ; 11.5 12.5 13,5 / 14.25 15.25 16.25 / 17.111 18.111 19.111
  move.l                                        #$00000800,OPERATOR2_TR_MATRIX_ROW1
  move.l                                        #$00000000,OPERATOR2_TR_MATRIX_ROW1+4
  move.l                                        #$00000000,OPERATOR2_TR_MATRIX_ROW2
  move.l                                        #$08000000,OPERATOR2_TR_MATRIX_ROW2+4
  move.l                                        #$00000000,OPERATOR2_TR_MATRIX_ROW3
  move.l                                        #$00000800,OPERATOR2_TR_MATRIX_ROW3+4


  ENDIF

  bsr.w                                         ammxmatrixmul3X3_q5_11

  IFD                                           VAMPIRE
  AMMX_DUMP_REGS_TO_THIRD_OP                    e13,e14,e15
  ENDIF

  processing_third_matrix_addr

  rts

; rotate 45 deg
_matrix_multest9:
  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

  ROTATE_INV_Q_5_11                             #45

  processing_current_transformation_matrix_addr
  rts

; rotate 90 deg and translate point 0,10 to center 
_matrix_multest10:
  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

	
	
	

  move.w                                        #160,d0
  move.w                                        #128,d1
  bsr.w                                         TRANSLATE

  ROTATE_INV_Q_5_11                             #90

	
  IFD                                           VAMPIRE
	; Current transformation matrix is the Multiplier (second factor)
  LOAD_CURRENT_TRANSFORMATION_MATRIX            e4,e5,e6
  REG_LOADI                                     0000,0280,0000,0040,e1

  ENDIF

  IFND                                          VAMPIRE
  LOAD_CURRENT_TRANSFORMATION_MATRIX            OPERATOR2_TR_MATRIX_ROW1

  move.l                                        #$00000280,OPERATOR1_TR_MATRIX_ROW1
  move.l                                        #$00000040,OPERATOR1_TR_MATRIX_ROW1+4
  ENDIF

  bsr.w                                         ammxmatrixmul1X3_q10_6


  IFD                                           VAMPIRE
  AMMX_DUMP_REGS_TO_THIRD_OP                    e13,e14,e15
  ENDIF

  processing_third_matrix_addr
  rts

; scale 0,5 X and Y point 10,0
_matrix_multest11:
  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

  move.w                                        #%0000000000100000,d0
  move.w                                        #%0000000000100000,d1
  bsr.w                                         SCALE
	
  IFD                                           VAMPIRE
	; Current transformation matrix is the Multiplier (second factor)
  LOAD_CURRENT_TRANSFORMATION_MATRIX            e4,e5,e6
  REG_LOADI                                     0000,0280,0000,0040,e1

  ENDIF

  IFND                                          VAMPIRE
  LOAD_CURRENT_TRANSFORMATION_MATRIX            OPERATOR2_TR_MATRIX_ROW1

  move.l                                        #$00000280,OPERATOR1_TR_MATRIX_ROW1
  move.l                                        #$00000040,OPERATOR1_TR_MATRIX_ROW1+4
  ENDIF

  bsr.w                                         ammxmatrixmul1X3_q10_6


  IFD                                           VAMPIRE
  AMMX_DUMP_REGS_TO_THIRD_OP                    e13,e14,e15
  ENDIF

  processing_third_matrix_addr
  rts


; scale  2X and 3Y point 10,5
_matrix_multest12:
  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

  move.w                                        #%0000000010000000,d0
  move.w                                        #%0000000011000000,d1
  bsr.w                                         SCALE
	
  IFD                                           VAMPIRE
	; Current transformation matrix is the Multiplier (second factor)
  LOAD_CURRENT_TRANSFORMATION_MATRIX            e4,e5,e6
  REG_LOADI                                     0000,0280,0140,0040,e1

  ENDIF

  IFND                                          VAMPIRE
  LOAD_CURRENT_TRANSFORMATION_MATRIX            OPERATOR2_TR_MATRIX_ROW1

  move.l                                        #$00000280,OPERATOR1_TR_MATRIX_ROW1
  move.l                                        #$01400040,OPERATOR1_TR_MATRIX_ROW1+4
  ENDIF

  bsr.w                                         ammxmatrixmul1X3_q10_6


  IFD                                           VAMPIRE
  AMMX_DUMP_REGS_TO_THIRD_OP                    e13,e14,e15
  ENDIF

  processing_third_matrix_addr
  rts

; shear 3x and 4y , point 10,5
_matrix_multest13:
  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

  move.w                                        #%0000000011000000,d0
  move.w                                        #%0000000100000000,d1
  bsr.w                                         SHEAR
	
  IFD                                           VAMPIRE

	; Current transformation matrix is the Multiplier (second factor)
  LOAD_CURRENT_TRANSFORMATION_MATRIX            e4,e5,e6
  REG_LOADI                                     0000,0280,0140,0040,e1

  ENDIF

  IFND                                          VAMPIRE
  LOAD_CURRENT_TRANSFORMATION_MATRIX            OPERATOR2_TR_MATRIX_ROW1

  move.l                                        #$00000280,OPERATOR1_TR_MATRIX_ROW1
  move.l                                        #$01400040,OPERATOR1_TR_MATRIX_ROW1+4
  ENDIF

  bsr.w                                         ammxmatrixmul1X3_q10_6


  IFD                                           VAMPIRE
  AMMX_DUMP_REGS_TO_THIRD_OP                    e13,e14,e15
  ENDIF

  processing_third_matrix_addr
	; result must be 25 45 1
  rts

_matrix_multest14:
  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

  move.w                                        #0,d0
  move.w                                        #0,d1
  bsr.w                                         TRANSLATE

  ROTATE #45
	
  IFD                                           VAMPIRE

	; Current transformation matrix is the Multiplier (second factor)
  LOAD_CURRENT_TRANSFORMATION_MATRIX            e4,e5,e6
  REG_LOADI                                     0000,FEC0,FEC0,0040,e1

  ENDIF

  IFND                                          VAMPIRE
  LOAD_CURRENT_TRANSFORMATION_MATRIX            OPERATOR2_TR_MATRIX_ROW1

  move.l                                        #$0000FEC0,OPERATOR1_TR_MATRIX_ROW1
  move.l                                        #$FEC00040,OPERATOR1_TR_MATRIX_ROW1+4
  ENDIF

  bsr.w                                         ammxmatrixmul1X3_q10_6


  IFD                                           VAMPIRE
  AMMX_DUMP_REGS_TO_THIRD_OP                    e13,e14,e15
  ENDIF

  processing_third_matrix_addr
	 ;result -450,5 
  ; after normalization -7,0
  rts

_matrix_multest15:
  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

  ROTATE #45
	
  IFD                                           VAMPIRE

	; Current transformation matrix is the Multiplier (second factor)
  LOAD_CURRENT_TRANSFORMATION_MATRIX            e4,e5,e6
  REG_LOADI                                     0000,0140,FEC0,0040,e1

  ENDIF

  IFND                                          VAMPIRE
  LOAD_CURRENT_TRANSFORMATION_MATRIX            OPERATOR2_TR_MATRIX_ROW1

  move.l                                        #$00000140,OPERATOR1_TR_MATRIX_ROW1
  move.l                                        #$FEC00040,OPERATOR1_TR_MATRIX_ROW1+4
  ENDIF

  bsr.w                                         ammxmatrixmul1X3_q10_6


  IFD                                           VAMPIRE
  AMMX_DUMP_REGS_TO_THIRD_OP                    e13,e14,e15
  ENDIF

  processing_third_matrix_addr

  ;result 0,-450 
  ; after normalization 0,7
	
  rts

_matrix_multest16:
  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

  moveq #45,d0
  jsr ROTATE_INV_Q_5_11_F
	
  IFD                                           VAMPIRE

	; Current transformation matrix is the Multiplier (second factor)
  LOAD_CURRENT_TRANSFORMATION_MATRIX            e4,e5,e6
  REG_LOADI                                     0000,0140,FEC0,0040,e1

  ENDIF

  IFND                                          VAMPIRE
  LOAD_CURRENT_TRANSFORMATION_MATRIX            OPERATOR2_TR_MATRIX_ROW1

  move.l                                        #$00000140,OPERATOR1_TR_MATRIX_ROW1
  move.l                                        #$FEC00040,OPERATOR1_TR_MATRIX_ROW1+4
  ENDIF

  bsr.w                                         ammxmatrixmul1X3_q10_6


  IFD                                           VAMPIRE
  AMMX_DUMP_REGS_TO_THIRD_OP                    e13,e14,e15
  ENDIF

  processing_third_matrix_addr

  ;result 0,-450 
  ; after normalization 0,7
	
  rts

_matrix_multest17:
  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

  move.w                                        #160,d0
  move.w                                        #128,d1
  bsr.w                                         TRANSLATE

  moveq #90,d0
  jsr ROTATE_INV_Q_5_11_F

	
  IFD                                           VAMPIRE
	; Current transformation matrix is the Multiplier (second factor)
  LOAD_CURRENT_TRANSFORMATION_MATRIX            e4,e5,e6
  REG_LOADI                                     0000,0280,0000,0040,e1

  ENDIF

  IFND                                          VAMPIRE
  LOAD_CURRENT_TRANSFORMATION_MATRIX            OPERATOR2_TR_MATRIX_ROW1

  move.l                                        #$00000280,OPERATOR1_TR_MATRIX_ROW1
  move.l                                        #$00000040,OPERATOR1_TR_MATRIX_ROW1+4
  ENDIF

  bsr.w                                         ammxmatrixmul1X3_q10_6


  IFD                                           VAMPIRE
  AMMX_DUMP_REGS_TO_THIRD_OP                    e13,e14,e15
  ENDIF

  processing_third_matrix_addr
  rts

_matrix_multest18:
  move.l d2,-(sp)
  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

  lea CURRENT_TRANSFORMATION_MATRIX,a6
  LOAD_M1_REG
  move.l                                        #$00400040,d0
  move.l                                        #$00400040,d1
  move.l                                        #$00400040,d2
  move.l                                        #$00400040,d3
  move.w                                        #$0040,d4

  lea CURRENT_TRANSFORMATION_MATRIX,a6
  bsr.w                                         matrixmul3X3_reg_q10_6


  move.l #CURRENT_TRANSFORMATION_MATRIX,d0
  move.l (sp)+,d2
  rts

_matrix_multest19:
  move.l d2,-(sp)

  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

  	; 1.5 2.5 3,5 / 4.25 5.25 6.25 / 7.111 8.111 9.111
  move.l                                        #$006000A0,a0
  move.l                                        #$00E00110,a1
  move.l                                        #$01500190,a2
  move.l                                        #$01C70207,a3
  move.l                                        #$00000247,a4

    ; 11.5 12.5 13,5 / 14.25 15.25 16.25 / 17.111 18.111 19.111
  move.l                                        #$02E00320,d0
  move.l                                        #$03600390,d1
  move.l                                        #$03D00410,d2
  move.l                                        #$04470487,d3
  move.l                                        #$000004C7,d4
  
  lea CURRENT_TRANSFORMATION_MATRIX,a6
  bsr.w                                         matrixmul3X3_reg_q10_6


  move.l #CURRENT_TRANSFORMATION_MATRIX,d0
  move.l (sp)+,d2
  rts

_matrix_multest20:
  move.l d2,-(sp)

  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

  ; -1 2.5 3,5 / 4.25 5.25 6.25 / 7.111 8.111 9.111
  move.l                                        #$FFC000A0,a0
  move.l                                        #$00E00110,a1
  move.l                                        #$01500190,a2
  move.l                                        #$01C70207,a3
  move.l                                        #$00000247,a4

    ; 11.5 12.5 13,5 / 14.25 15.25 16.25 / 17.111 18.111 19.111
  move.l                                        #$02E00320,d0
  move.l                                        #$03600390,d1
  move.l                                        #$03D00410,d2
  move.l                                        #$04470487,d3
  move.l                                        #$000004C7,d4

  
  lea CURRENT_TRANSFORMATION_MATRIX,a6
  bsr.w                                         matrixmul3X3_reg_q10_6


  move.l #CURRENT_TRANSFORMATION_MATRIX,d0
  move.l (sp)+,d2
  rts

_matrix_multest21:
  move.l d2,-(sp)

  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

  ; -1 2.5 3,5 / 4.25 5.25 6.25 / 7.111 8.111 9.111
  move.l                                        #$FFC000A0,a0
  move.l                                        #$00E00110,a1
  move.l                                        #$01500190,a2
  move.l                                        #$01C70207,a3
  move.l                                        #$00000247,a4
  

  ; 11.5 12.5 13,5 / 14.25 15.25 16.25 / 17.111 18.111 19.111
  move.l                                        #$000002E0,OPERATOR2_TR_MATRIX_ROW1
  move.l                                        #$03200360,OPERATOR2_TR_MATRIX_ROW1+4
  move.l                                        #$00000390,OPERATOR2_TR_MATRIX_ROW2
  move.l                                        #$03D00410,OPERATOR2_TR_MATRIX_ROW2+4
  move.l                                        #$00000447,OPERATOR2_TR_MATRIX_ROW3
  move.l                                        #$048704C7,OPERATOR2_TR_MATRIX_ROW3+4

  lea OPERATOR2_TR_MATRIX_ROW1,a6
  LOAD_M2_REG
  
  lea CURRENT_TRANSFORMATION_MATRIX,a6
  bsr.w                                         matrixmul3X3_reg_q10_6


  move.l #CURRENT_TRANSFORMATION_MATRIX,d0
  move.l (sp)+,d2
  rts

; shear 3x and 4y , point 10,5 with reg
_matrix_multest22:
  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

  move.w                                        #%0000000011000000,d0
  move.w                                        #%0000000100000000,d1
  bsr.w                                         SHEAR_REG
	
  IFD                                           VAMPIRE

	; Current transformation matrix is the Multiplier (second factor)
  LOAD_CURRENT_TRANSFORMATION_MATRIX            e4,e5,e6
  REG_LOADI                                     0000,0280,0140,0040,e1

  ENDIF

  IFND                                          VAMPIRE
  LOAD_CURRENT_TRANSFORMATION_MATRIX            OPERATOR2_TR_MATRIX_ROW1

  move.l                                        #$00000280,OPERATOR1_TR_MATRIX_ROW1
  move.l                                        #$01400040,OPERATOR1_TR_MATRIX_ROW1+4
  ENDIF

  bsr.w                                         ammxmatrixmul1X3_q10_6


  IFD                                           VAMPIRE
  AMMX_DUMP_REGS_TO_THIRD_OP                    e13,e14,e15
  ENDIF

  processing_third_matrix_addr
	; result must be 25 45 1
  rts

_matrix_multest23:
  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

  moveq #45,d0
  jsr ROTATE_REG

  IFD                                           VAMPIRE

	; Current transformation matrix is the Multiplier (second factor)
  LOAD_CURRENT_TRANSFORMATION_MATRIX            e4,e5,e6
  REG_LOADI                                     0000,0140,FEC0,0040,e1

  ENDIF

  IFND                                          VAMPIRE
  LOAD_CURRENT_TRANSFORMATION_MATRIX            OPERATOR2_TR_MATRIX_ROW1

  move.l                                        #$00000140,OPERATOR1_TR_MATRIX_ROW1
  move.l                                        #$FEC00040,OPERATOR1_TR_MATRIX_ROW1+4
  ENDIF

  bsr.w                                         ammxmatrixmul1X3_q10_6


  IFD                                           VAMPIRE
  AMMX_DUMP_REGS_TO_THIRD_OP                    e13,e14,e15
  ENDIF

  processing_third_matrix_addr

  ;result 0,-450 
  ; after normalization 0,7
	
  rts

_matrix_multest24:
  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

  move.w                                        #160,d0
  move.w                                        #128,d1
  bsr.w                                         TRANSLATE

  moveq #90,d0
  jsr ROTATE_REG

	
  IFD                                           VAMPIRE
	; Current transformation matrix is the Multiplier (second factor)
  LOAD_CURRENT_TRANSFORMATION_MATRIX            e4,e5,e6
  REG_LOADI                                     0000,0280,0000,0040,e1

  ENDIF

  IFND                                          VAMPIRE
  LOAD_CURRENT_TRANSFORMATION_MATRIX            OPERATOR2_TR_MATRIX_ROW1

  move.l                                        #$00000280,OPERATOR1_TR_MATRIX_ROW1
  move.l                                        #$00000040,OPERATOR1_TR_MATRIX_ROW1+4
  ENDIF

  bsr.w                                         ammxmatrixmul1X3_q10_6


  IFD                                           VAMPIRE
  AMMX_DUMP_REGS_TO_THIRD_OP                    e13,e14,e15
  ENDIF

  processing_third_matrix_addr
  rts

; scale 0,5 X and Y point 10,0
_matrix_multest25:
  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

  move.w                                        #%0000000000100000,d0
  move.w                                        #%0000000000100000,d1
  bsr.w                                         SCALE_REG
	
  IFD                                           VAMPIRE
	; Current transformation matrix is the Multiplier (second factor)
  LOAD_CURRENT_TRANSFORMATION_MATRIX            e4,e5,e6
  REG_LOADI                                     0000,0280,0000,0040,e1

  ENDIF

  IFND                                          VAMPIRE
  LOAD_CURRENT_TRANSFORMATION_MATRIX            OPERATOR2_TR_MATRIX_ROW1

  move.l                                        #$00000280,OPERATOR1_TR_MATRIX_ROW1
  move.l                                        #$00000040,OPERATOR1_TR_MATRIX_ROW1+4
  ENDIF

  bsr.w                                         ammxmatrixmul1X3_q10_6


  IFD                                           VAMPIRE
  AMMX_DUMP_REGS_TO_THIRD_OP                    e13,e14,e15
  ENDIF

  processing_third_matrix_addr
  rts

; scale  2X and 3Y point 10,5
_matrix_multest26:
  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

  move.w                                        #%0000000010000000,d0
  move.w                                        #%0000000011000000,d1
  bsr.w                                         SCALE_REG
	
  IFD                                           VAMPIRE
	; Current transformation matrix is the Multiplier (second factor)
  LOAD_CURRENT_TRANSFORMATION_MATRIX            e4,e5,e6
  REG_LOADI                                     0000,0280,0140,0040,e1

  ENDIF

  IFND                                          VAMPIRE
  LOAD_CURRENT_TRANSFORMATION_MATRIX            OPERATOR2_TR_MATRIX_ROW1

  move.l                                        #$00000280,OPERATOR1_TR_MATRIX_ROW1
  move.l                                        #$01400040,OPERATOR1_TR_MATRIX_ROW1+4
  ENDIF

  bsr.w                                         ammxmatrixmul1X3_q10_6


  IFD                                           VAMPIRE
  AMMX_DUMP_REGS_TO_THIRD_OP                    e13,e14,e15
  ENDIF

  processing_third_matrix_addr
  rts



