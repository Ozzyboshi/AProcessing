POINT_Q_10_6 MACRO

	IFD VAMPIRE

	move.w \1,d0
	move.l #$0040FFFF,d1
	move.w \2,d1

	vperm #$8967EFCD,d0,d1,e1
	REG_ZERO e2
	REG_ZERO e3

	LOAD_CURRENT_TRANSFORMATION_MATRIX e4,e5,e6
	ENDIF

	IFND VAMPIRE
	LOAD_CURRENT_TRANSFORMATION_MATRIX OPERATOR2_TR_MATRIX_ROW1
	move.w #$0000,OPERATOR1_TR_MATRIX_ROW1
	move.w \1,OPERATOR1_TR_MATRIX_ROW1+2
	move.w \2,OPERATOR1_TR_MATRIX_ROW1+4
	move.w #$0040,OPERATOR1_TR_MATRIX_ROW1+6
	
	ENDIF

	bsr.w ammxmatrixmul1X3_q10_6

	IFD VAMPIRE
	vperm #$FFFFFF23,e13,e2,d0
	vperm #$FFFFFF45,e13,e2,d1
	ENDIF

	IFND VAMPIRE	
	move.w OPERATOR3_TR_MATRIX_ROW1+2,d0
	move.w OPERATOR3_TR_MATRIX_ROW1+4,d1
	ENDIF

	lsr.l #6,d0
	lsr.l #6,d1

	; start plot routine
	lea PLOTREFS,a1
	add.w d1,d1
	move.w 0(a1,d1.w),d1
	move.w d0,d4
	lsr.w #3,d4
	add.w d4,d1
	not.b d0
	lea SCREEN_0,a0
	bset d0,(a0,d1.w)
	
	ENDM

POINT MACRO
	move.w \1,d0
	move.w \2,d1

	bsr.w point_execute_transformation

	; start plot routine
	lea PLOTREFS,a1
	add.w d1,d1
	move.w 0(a1,d1.w),d1
	move.w d0,d4
	lsr.w #3,d4
	add.w d4,d1
	not.b d0
	lea SCREEN_0,a0
	bset d0,(a0,d1.w)

	ENDM

point_execute_transformation:
	;movem.l d0-d1,-(sp)
	IFD VAMPIRE

	asl.w #6,d0
	move.l #$0040FFFF,d1
	asl.w #6,d1

	vperm #$8967EFCD,d0,d1,e1
	REG_ZERO e2
	REG_ZERO e3

	LOAD_CURRENT_TRANSFORMATION_MATRIX e4,e5,e6
	ENDIF

	IFND VAMPIRE
	LOAD_CURRENT_TRANSFORMATION_MATRIX OPERATOR2_TR_MATRIX_ROW1
	move.w #$0000,OPERATOR1_TR_MATRIX_ROW1
	asl.w #6,d0
	asl.w #6,d1
	move.w d0,OPERATOR1_TR_MATRIX_ROW1+2
	move.w d1,OPERATOR1_TR_MATRIX_ROW1+4
	move.w #$0040,OPERATOR1_TR_MATRIX_ROW1+6

	ENDIF

	bsr.w ammxmatrixmul1X3_q10_6

	IFD VAMPIRE
	vperm #$FFFFFF23,e13,e2,d0
	vperm #$FFFFFF45,e13,e2,d1
	ENDIF

	IFND VAMPIRE	
	move.w OPERATOR3_TR_MATRIX_ROW1+2,d0
	move.w OPERATOR3_TR_MATRIX_ROW1+4,d1
	ENDIF

	lsr.l #6,d0
	lsr.l #6,d1

	;movem.l (sp)+,d0-d1
	rts