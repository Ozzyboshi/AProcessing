

MATRIX_STACK_START:
	dcb.b 24*256,$00
MATRIX_STACK_END:

MATRIX_STACK_PTR: dc.l MATRIX_STACK_START

CURRENT_TRANSFORMATION_MATRIX:
    dc.w 0000,$0040,0000,0000
    dc.w 0000,0000,$0040,0000
    dc.w 0000,0000,0000,$0040

;TRANSFORMATIONS_PTR:
;    dc.l TRANSFORMATIONS_MATRIX

AMMX_DUMP_TRANSFORMATION_MATRIX_TO_RAM_OP1 MACRO
	lea OPERATOR1_TR_MATRIX_ROW1,b0
	store \1,(b0)+
	store \2,(b0)+
	store \3,(b0)+
	ENDM

AMMX_DUMP_TRANSFORMATION_MATRIX_TO_RAM_OP2 MACRO
	lea OPERATOR2_TR_MATRIX_ROW1,b0
	store \1,(b0)+
	store \2,(b0)+
	store \3,(b0)+
	ENDM

AMMX_DUMP_THIRD_OP_TO_RAM_OP1 MACRO
	lea OPERATOR3_TR_MATRIX_ROW1,b0
	store \1,(b0)+
	store \2,(b0)+
	store \3,(b0)+
ENDM

RESET_MATRIX_STACK MACRO
	; reset matrix stack
	move.l #MATRIX_STACK_START,MATRIX_STACK_PTR
	ENDM

RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6 MACRO
	RESET_MATRIX_STACK
	IFD VAMPIRE
	lea CURRENT_TRANSFORMATION_MATRIX,b0
	REG_LOADI 0000,0040,0000,0000,e0
    store e0,(b0)+
	REG_LOADI 0000,0000,0040,0000,e0
    store e0,(b0)+
	REG_LOADI 0000,0000,0000,0040,e0
    store e0,(b0)+
	ENDIF
	IFND VAMPIRE
	lea CURRENT_TRANSFORMATION_MATRIX,a0
	move.l #$00000040,(a0)+
	move.l #$00000000,(a0)+
	move.l #$00000000,(a0)+
	move.l #$00400000,(a0)+
	move.l #$00000000,(a0)+
	move.l #$00000040,(a0)+
	ENDIF
	ENDM

MULT_ROW_Q_10_6 MACRO
	pmull d0,d1,d2
	pmulh d0,d1,d3

	; recompose full 32 bit number
	vperm #$CD45EF67,d2,d3,d4
	dc.w $fe3c,$4739,$0000,$0000,$0000,$0006 ;LSR.Q  #11,d4,d7

	vperm #$8901AB23,d2,d3,d4
	dc.w $fe3c,$4639,$0000,$0000,$0000,$0006 ;LSR.Q  #11,d4,d6

	paddw d6,d7,d5
	vperm #$23232323,d5,d5,\1
	add.w d5,\1 ; final result in the lowest word of output reg
	
	ENDM


OPERATOR1_TRANSFORMATION_MATRIX:
OPERATOR1_TR_MATRIX_ROW1:
OPERATOR1_TR_MATRIX_ROW1_WORD0:
	dc.w 0
OPERATOR1_TR_MATRIX_ROW1_WORD1:
	dc.w 0
OPERATOR1_TR_MATRIX_ROW1_WORD2:
	dc.w 0
OPERATOR1_TR_MATRIX_ROW1_WORD3:
	dc.w 0

OPERATOR1_TR_MATRIX_ROW2:
OPERATOR1_TR_MATRIX_ROW2_WORD0:
	dc.w 0
OPERATOR1_TR_MATRIX_ROW2_WORD1:
	dc.w 0
OPERATOR1_TR_MATRIX_ROW2_WORD2:
	dc.w 0
OPERATOR1_TR_MATRIX_ROW2_WORD3:
	dc.w 0

OPERATOR1_TR_MATRIX_ROW3:
OPERATOR1_TR_MATRIX_ROW3_WORD0:
	dc.w 0
OPERATOR1_TR_MATRIX_ROW3_WORD1:
	dc.w 0
OPERATOR1_TR_MATRIX_ROW3_WORD2:
	dc.w 0
OPERATOR1_TR_MATRIX_ROW3_WORD3:
	dc.w 0

OPERATOR2_TRANSFORMATION_MATRIX:
OPERATOR2_TR_MATRIX_ROW1:
OPERATOR2_TR_MATRIX_ROW1_WORD0:
	dc.w 0
OPERATOR2_TR_MATRIX_ROW1_WORD1:
	dc.w 0
OPERATOR2_TR_MATRIX_ROW1_WORD2:
	dc.w 0
OPERATOR2_TR_MATRIX_ROW1_WORD3:
	dc.w 0

OPERATOR2_TR_MATRIX_ROW2:
OPERATOR2_TR_MATRIX_ROW2_WORD0:
	dc.w 0
OPERATOR2_TR_MATRIX_ROW2_WORD1:
	dc.w 0
OPERATOR2_TR_MATRIX_ROW2_WORD2:
	dc.w 0
OPERATOR2_TR_MATRIX_ROW2_WORD3:
	dc.w 0

OPERATOR2_TR_MATRIX_ROW3:
OPERATOR2_TR_MATRIX_ROW3_WORD0:
	dc.w 0
OPERATOR2_TR_MATRIX_ROW3_WORD1:
	dc.w 0
OPERATOR2_TR_MATRIX_ROW3_WORD2:
	dc.w 0
OPERATOR2_TR_MATRIX_ROW3_WORD3:
	dc.w 0

OPERATOR3_TRANSFORMATION_MATRIX:
OPERATOR3_TR_MATRIX_ROW1:
OPERATOR3_TR_MATRIX_ROW1_WORD0:
	dc.w 0
OPERATOR3_TR_MATRIX_ROW1_WORD1:
	dc.w 0
OPERATOR3_TR_MATRIX_ROW1_WORD2:
	dc.w 0
OPERATOR3_TR_MATRIX_ROW1_WORD3:
	dc.w 0

OPERATOR3_TR_MATRIX_ROW2:
OPERATOR3_TR_MATRIX_ROW2_WORD0:
	dc.w 0
OPERATOR3_TR_MATRIX_ROW2_WORD1:
	dc.w 0
OPERATOR3_TR_MATRIX_ROW2_WORD2:
	dc.w 0
OPERATOR3_TR_MATRIX_ROW2_WORD3:
	dc.w 0

OPERATOR3_TR_MATRIX_ROW3:
OPERATOR3_TR_MATRIX_ROW3_WORD0:
	dc.w 0
OPERATOR3_TR_MATRIX_ROW3_WORD1:
	dc.w 0
OPERATOR3_TR_MATRIX_ROW3_WORD2:
	dc.w 0
OPERATOR3_TR_MATRIX_ROW3_WORD3:
	dc.w 0


LOAD_CURRENT_TRANSFORMATION_MATRIX MACRO
	IFD VAMPIRE
	lea CURRENT_TRANSFORMATION_MATRIX,b0
    LOAD (b0)+,\1
    LOAD (b0)+,\2
    LOAD (b0),\3
	ENDIF
	IFND VAMPIRE
	move.l CURRENT_TRANSFORMATION_MATRIX,\1
	move.l CURRENT_TRANSFORMATION_MATRIX+4,\1+4
	move.l CURRENT_TRANSFORMATION_MATRIX+8,\1+8
	move.l CURRENT_TRANSFORMATION_MATRIX+12,\1+12
	move.l CURRENT_TRANSFORMATION_MATRIX+16,\1+16
	move.l CURRENT_TRANSFORMATION_MATRIX+20,\1+20
	ENDIF
	ENDM

UPDATE_CURRENT_TRANSFORMATION_MATRIX MACRO
	IFD VAMPIRE
	lea CURRENT_TRANSFORMATION_MATRIX,b0
    store \1,(b0)+
	store \2,(b0)+
	store \3,(b0)+
	ENDIF
	IFND VAMPIRE
	lea CURRENT_TRANSFORMATION_MATRIX,a0
	move.l \1,(a0)+
	move.l \1+4,(a0)+

	move.l \2,(a0)+
	move.l \2+4,(a0)+

	move.l \3,(a0)+
	move.l \3+4,(a0)+

	ENDIF
	ENDM

; Saves current transformation matrix into the MATRIX STACK
PUSHMATRIX MACRO
	movea.l MATRIX_STACK_PTR,a2
	IFD VAMPIRE
	lea CURRENT_TRANSFORMATION_MATRIX,b0
	load (b0)+,e0
	store e0,(a2)+
	load (b0)+,e0
	store e0,(a2)+
	load (b0)+,e0
	store e0,(a2)+
	ENDIF
	IFND VAMPIRE
	move.l CURRENT_TRANSFORMATION_MATRIX,(a2)+
	move.l CURRENT_TRANSFORMATION_MATRIX+4,(a2)+
	move.l CURRENT_TRANSFORMATION_MATRIX+8,(a2)+
	move.l CURRENT_TRANSFORMATION_MATRIX+12,(a2)+
	move.l CURRENT_TRANSFORMATION_MATRIX+16,(a2)+
	move.l CURRENT_TRANSFORMATION_MATRIX+20,(a2)+
	ENDIF
	move.l a2,MATRIX_STACK_PTR
	ENDM

; restore matrix stack transformation matrix into transformation matrix
POPMATRIX MACRO
	movea.l MATRIX_STACK_PTR,a2
	suba.l #24,a2
	move.l a2,MATRIX_STACK_PTR

	IFD VAMPIRE
	lea CURRENT_TRANSFORMATION_MATRIX,b0
	load (a2)+,e0
	store e0,(b0)+
	load (a2)+,e0
	store e0,(b0)+
	load (a2),e0
	store e0,(b0)
	ENDIF

	IFND VAMPIRE
	lea CURRENT_TRANSFORMATION_MATRIX,a0
	move.l (a2)+,(a0)+
	move.l (a2)+,(a0)+

	move.l (a2)+,(a0)+
	move.l (a2)+,(a0)+

	move.l (a2)+,(a0)+
	move.l (a2)+,(a0)+
	ENDIF
	ENDM
	

; INPUT (LOAD BEFORE USING IT)
; MATRIX 1 data must be put on e1,e2,e3
; MATRIX 2 data must be put on e4,e5,d6
ammxmatrixmul3X3_q10_6:
	movem.l d0-d7/a0-a6,-(sp) ; stack save

	IFD VAMPIRE

    REG_ZERO e21

	; start of matrix rotation - output to e7 e8 a9
	
	; START OF FIRST ROW
	vperm #$67EF67EF,e5,e6,e7; 1st row (e5 last word - e6 last word - e5 last word - e6 last word)
	vperm #$6767CDEF,e4,e7,e7 ; end of first row, e4 inserted in first 2 words
	; END OF FIRST ROW

	; START OF SECOND ROW
	vperm #$45CD45CD,e5,e6,e8; 2st row (e5 middle right word - e6 middle right word - e5 middle right word - e6 middle right word)
	vperm #$4545CDEF,e4,e8,e8 ; end of second row, e4 inserted in first 2 words
	; END OF SECOND ROW

	; START OF THIRD ROW;
	vperm #$23AB23AB,e5,e6,e9; 3dr row (e5 middle left word - e6 middle left word - e5 middle left word - e6 middle left word)
	vperm #$2323CDEF,e4,e9,e9 ; end of third row, e4 inserted in first 2 words
	; END OF THIRD ROW

	; start of matrix multiplication

	; multiply first row of the first matrix with last row of the second matrix output in e13 left middle word
	LOAD e1,d0
	LOAD e9,d1
	MULT_ROW_Q_10_6 d0
	vperm #$00EF0000,e21,d0,e13

	; multiply second row of the first matrix with last row of the second matrix output in e14 left middle word
	LOAD e2,d0
	LOAD e9,d1
	MULT_ROW_Q_10_6 d0
	vperm #$00EF0000,e21,d0,e14

	; multiply first row of the first matrix with middle row of the second matrix output in e13 right middle word
	LOAD e1,d0
	LOAD e8,d1
	MULT_ROW_Q_10_6 d0
	vperm #$0123EF67,e13,d0,e13

	; multiply third row of the first matrix with last row of the second matrix output in e15 left middle word
	LOAD e3,d0
	LOAD e9,d1
	MULT_ROW_Q_10_6 d0
	vperm #$00EF0000,e21,d0,e15

	; multiply middle row of the first matrix with middle row of the second matrix output in e14 right middle word
	LOAD e2,d0
	LOAD e8,d1
	MULT_ROW_Q_10_6 d0
	vperm #$0123EF67,e14,d0,e14

	; multiply first row of the first matrix with first row if the second matrix output in e13 right word
	LOAD e1,d0
	LOAD e7,d1
	MULT_ROW_Q_10_6 d0
	vperm #$012345EF,e13,d0,e13

	; multiply second row of the first matrix with first row of the second matrix output in e14 right word
	LOAD e2,d0
	LOAD e7,d1
	MULT_ROW_Q_10_6 d0
	vperm #$012345EF,e14,d0,e14

	; multiply third row of the first matrix with middle row of the second matrix output in e15  right middle word
	LOAD e3,d0
	LOAD e8,d1
	MULT_ROW_Q_10_6 d0
	vperm #$0123EF67,e15,d0,e15

	; multiply third row of the first matrix with first row of the second matrix output in e15 right word
	LOAD e3,d0
	LOAD e7,d1
	MULT_ROW_Q_10_6 d0
	vperm #$012345EF,e15,d0,e15

	ENDIF

	IFND VAMPIRE
	   
	move.w OPERATOR1_TR_MATRIX_ROW1_WORD1,d0
	muls.w OPERATOR2_TR_MATRIX_ROW1_WORD1,d0
	lsr.l #6,d0
	
	move.w OPERATOR1_TR_MATRIX_ROW1_WORD2,d1
	muls.w OPERATOR2_TR_MATRIX_ROW2_WORD1,d1
	lsr.l #6,d1
	
	move.w OPERATOR1_TR_MATRIX_ROW1_WORD3,d2
	muls.w OPERATOR2_TR_MATRIX_ROW3_WORD1,d2
	lsr.l #6,d2
	
	add.w d0,d1
	add.w d1,d2
	move.w d2,OPERATOR3_TR_MATRIX_ROW1_WORD1
	
	
	; start of second pass
	move.w OPERATOR1_TR_MATRIX_ROW2_WORD1,d0
	muls.w OPERATOR2_TR_MATRIX_ROW1_WORD1,d0
	lsr.l #6,d0
	
	move.w OPERATOR1_TR_MATRIX_ROW2_WORD2,d1
	muls.w OPERATOR2_TR_MATRIX_ROW2_WORD1,d1
	lsr.l #6,d1
	
	move.w OPERATOR1_TR_MATRIX_ROW2_WORD3,d2
	muls.w OPERATOR2_TR_MATRIX_ROW3_WORD1,d2
	lsr.l #6,d2
	
	add.w d0,d1
	add.w d1,d2
	move.w d2,OPERATOR3_TR_MATRIX_ROW2_WORD1
	
	
	move.w OPERATOR1_TR_MATRIX_ROW1_WORD1,d0
	muls.w OPERATOR2_TR_MATRIX_ROW1_WORD2,d0
	lsr.l #6,d0
	
	move.w OPERATOR1_TR_MATRIX_ROW1_WORD2,d1
	muls.w OPERATOR2_TR_MATRIX_ROW2_WORD2,d1
	lsr.l #6,d1
	
	move.w OPERATOR1_TR_MATRIX_ROW1_WORD3,d2
	muls.w OPERATOR2_TR_MATRIX_ROW3_WORD2,d2
	lsr.l #6,d2
	
	add.w d0,d1
	add.w d1,d2
	move.w d2,OPERATOR3_TR_MATRIX_ROW1_WORD2

    ; end of second pass

	
    ; start of third pass
    move.w OPERATOR1_TR_MATRIX_ROW3_WORD1,d0
	muls.w OPERATOR2_TR_MATRIX_ROW1_WORD1,d0
	lsr.l #6,d0
	
	move.w OPERATOR1_TR_MATRIX_ROW3_WORD2,d1
	muls.w OPERATOR2_TR_MATRIX_ROW2_WORD1,d1
	lsr.l #6,d1
	
	move.w OPERATOR1_TR_MATRIX_ROW3_WORD3,d2
	muls.w OPERATOR2_TR_MATRIX_ROW3_WORD1,d2
	lsr.l #6,d2
	
	add.w d0,d1
	add.w d1,d2
	move.w d2,OPERATOR3_TR_MATRIX_ROW3_WORD1
	
	
	
	
	move.w OPERATOR1_TR_MATRIX_ROW2_WORD1,d0
	muls.w OPERATOR2_TR_MATRIX_ROW1_WORD2,d0
	lsr.l #6,d0
	
	move.w OPERATOR1_TR_MATRIX_ROW2_WORD2,d1
	muls.w OPERATOR2_TR_MATRIX_ROW2_WORD2,d1
	lsr.l #6,d1
	
	move.w OPERATOR1_TR_MATRIX_ROW2_WORD3,d2
	muls.w OPERATOR2_TR_MATRIX_ROW3_WORD2,d2
	lsr.l #6,d2
	
	add.w d0,d1
	add.w d1,d2
	move.w d2,OPERATOR3_TR_MATRIX_ROW2_WORD2
	
	
	
	move.w OPERATOR1_TR_MATRIX_ROW1_WORD1,d0
	muls.w OPERATOR2_TR_MATRIX_ROW1_WORD3,d0
	lsr.l #6,d0
	
	move.w OPERATOR1_TR_MATRIX_ROW1_WORD2,d1
	muls.w OPERATOR2_TR_MATRIX_ROW2_WORD3,d1
	lsr.l #6,d1
	
	move.w OPERATOR1_TR_MATRIX_ROW1_WORD3,d2
	muls.w OPERATOR2_TR_MATRIX_ROW3_WORD3,d2
	lsr.l #6,d2
	
	add.w d0,d1
	add.w d1,d2
	move.w d2,OPERATOR3_TR_MATRIX_ROW1_WORD3
    
    ;end of third pass
    
    ; start of 4th pass
    move.w OPERATOR1_TR_MATRIX_ROW2_WORD1,d0
	muls.w OPERATOR2_TR_MATRIX_ROW1_WORD3,d0
	lsr.l #6,d0
	
	move.w OPERATOR1_TR_MATRIX_ROW2_WORD2,d1
	muls.w OPERATOR2_TR_MATRIX_ROW2_WORD3,d1
	lsr.l #6,d1
	
	move.w OPERATOR1_TR_MATRIX_ROW2_WORD3,d2
	muls.w OPERATOR2_TR_MATRIX_ROW3_WORD3,d2
	lsr.l #6,d2
	
	add.w d0,d1
	add.w d1,d2
	move.w d2,OPERATOR3_TR_MATRIX_ROW2_WORD3

    
    move.w OPERATOR1_TR_MATRIX_ROW3_WORD1,d0
	muls.w OPERATOR2_TR_MATRIX_ROW1_WORD2,d0
	lsr.l #6,d0
	
	move.w OPERATOR1_TR_MATRIX_ROW3_WORD2,d1
	muls.w OPERATOR2_TR_MATRIX_ROW2_WORD2,d1
	lsr.l #6,d1
	
	move.w OPERATOR1_TR_MATRIX_ROW3_WORD3,d2
	muls.w OPERATOR2_TR_MATRIX_ROW3_WORD2,d2
	lsr.l #6,d2
	
	add.w d0,d1
	add.w d1,d2
	move.w d2,OPERATOR3_TR_MATRIX_ROW3_WORD2

	
	; end of 4th pass
	
	; starto of 5th pass
	move.w OPERATOR1_TR_MATRIX_ROW3_WORD1,d0
	muls.w OPERATOR2_TR_MATRIX_ROW1_WORD3,d0
	lsr.l #6,d0
	
	move.w OPERATOR1_TR_MATRIX_ROW3_WORD2,d1
	muls.w OPERATOR2_TR_MATRIX_ROW2_WORD3,d1
	lsr.l #6,d1
	
	move.w OPERATOR1_TR_MATRIX_ROW3_WORD3,d2
	muls.w OPERATOR2_TR_MATRIX_ROW3_WORD3,d2
	lsr.l #6,d2
	
	add.w d0,d1
	add.w d1,d2
	move.w d2,OPERATOR3_TR_MATRIX_ROW3_WORD3

	ENDIF

    movem.l (sp)+,d0-d7/a0-a6
    rts



processing_first_matrix_addr:
	move.l #OPERATOR1_TRANSFORMATION_MATRIX,d0
	rts

processing_second_matrix_addr:
	move.l #OPERATOR2_TRANSFORMATION_MATRIX,d0
	rts

processing_third_matrix_addr:
	move.l #OPERATOR3_TRANSFORMATION_MATRIX,d0
	rts

processing_current_transformation_matrix_addr:
	move.l #CURRENT_TRANSFORMATION_MATRIX,d0
	rts
    