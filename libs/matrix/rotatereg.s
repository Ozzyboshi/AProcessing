ROTATE_REG:
	movem.l                                 d0-d2/a0-a2/a4-a6,-(sp)                              ; stack save

    lea      ROT_Z_MATRIX_Q5_11,a5
    lsl.w    #3,d0
	move.l   0(a5,d0.w),a0

    ;moveq    #0,d1
	move.w   4(a5,d0.w),d1
    move.l   d1,a1

    ;moveq    #0,d1
    move.w   6(a5,d0.w),d1
    swap     d1
    move.l   d1,a2

    ;moveq    #0,d1
    ;move.l   d1,a3

    move.l   #$00000800,a4

    lea CURRENT_TRANSFORMATION_MATRIX,a6
    LOAD_M2_REG

	bsr.w    matrixmul3X3_reg_q5_11_rot
    movem.l                                 (sp)+,d0-d2/a0-a2/a4-a6
	rts

matrixmul3X3_reg_q5_11_rot:
    movem.l d0-d7/a0-a6,-(sp)
    
    ; Start calculation of output position  M-output(1,1)
    M1_1_1 d5
    ; d5 = M1(1,1) x M2(1,1)
    ;move.l a0,d5
    move.l d0,d6
    ;swap d5
    swap d6
    muls   d6,d5
    moveq #11,d7
	asr.l d7,d5
    
    ; d6 = M1(1,2) x M2(2,1)
    move.w a0,d6
    muls d1,d6
    moveq #11,d7
	asr.l d7,d6
    
    add.l d6,d5
    
    ; d6 = M1(1,3) x M2(3,1)
    ;move.l a1,d6
    ;swap d6
    ;move.l d3,d7
    ;swap d7
    ;muls d7,d6
    ;moveq #11,d7
	;asr.l d7,d6
    
    ;add.l d6,d5
    move.w d5,2(a6)
    
    ; Start calculation of output position  M-output(1,2)
    ; d5 = M1(1,1) x M2(1,2)
    move.l a0,d5
    swap d5
    muls   d0,d5
    moveq #11,d7
	asr.l d7,d5

    
    ; d6 = M1(1,2) x M2(2,2)
    move.w a0,d6
    move.l d2,d7
    swap d7
    muls d7,d6
    moveq #11,d7
	asr.l d7,d6

    
    add.l d6,d5

    
    ; d6 = M1(1,3) x M2(3,2)
    ;move.l a1,d6
    ;swap d6
    ;muls d3,d6
    ;moveq #11,d7
	;asr.l d7,d6
    
    ;add.l d6,d5
    move.w d5,4(a6)
    

; Start calculation of output position  M-output(1,3)
    ; d5 = M1(1,1) x M2(1,3)
    move.l a0,d5
    move.l d1,d6
    swap d5
    swap d6
    muls   d6,d5
    moveq #11,d7
	asr.l d7,d5
    
    ; d6 = M1(1,2) x M2(2,3)
    move.w a0,d6
    muls d2,d6
    moveq #11,d7
	asr.l d7,d6
    
    add.l d6,d5
    
    ; d6 = M1(1,3) x M2(3,3)
    ;move.l a1,d6
    ;swap d6
    ;muls d4,d6
    ;moveq #11,d7
	;asr.l d7,d6
    
    ;add.l d6,d5
    move.w d5,6(a6)
    
 ; Start calculation of output position  M-output(2,1)
    ; d6 = M1(2,1) x M2(1,1)
    move.w a1,d6
    move.l d0,d5
    swap d5
    muls d6,d5
    moveq #11,d7
	asr.l d7,d5
    
    ; d6 = M1(2,2) x M2(2,1)
    M1_2_2 d6
    muls d1,d6
    moveq #11,d7
	asr.l d7,d6
    add.l d6,d5
    
    ; d6 = M1(2,3) x M2(3,1)
    ;M1_2_3 d6
    ;M2_3_1 d7
    ;muls  d7,d6
    ;moveq #11,d7
	;asr.l d7,d6
    ;add.l d6,d5
    move.w d5,10(a6)
    
; Start calculation of output position  M-output(2,2)
    ; d5 = M1(2,1) x M2(1,2)
    M1_2_1 d5
    muls d0,d5
    moveq #11,d7
	asr.l d7,d5
    
    ; d6 = M1(2,2) x M2(2,2)
    M1_2_2 d6
    M2_2_2 d7
    muls d7,d6
    M2_NORMALIZE_AND_ADD_11
    
    ; d6 = M1(2,3) x M2(3,2)
    ;M1_2_3 d6
    ;muls d3,d6
    ;M2_NORMALIZE_AND_ADD_11
    move.w d5,12(a6)
    
; Start calculation of output position  M-output(2,3)
    ; d5 = M1(2,1) x M2(1,3)
    M1_2_1 d5
    M2_1_3 d7
    muls d7,d5
    moveq #11,d7
	asr.l d7,d5

    ; d6 = M1(2,2) x M2(2,3)
    M1_2_2 d6
    muls d2,d6
    M2_NORMALIZE_AND_ADD_11
    
    ; d6 = M1(2,3) x M2(3,3)
     ;M1_2_3 d6
     ;muls d4,d6
     ;M2_NORMALIZE_AND_ADD_11
     move.w d5,14(a6)
    
; Start calculation of output position  M-output(3,1)
    ; d5 = M1(3,1) x M2(1,1)
    ;M1_3_1 d5
    ;M2_1_1 d7
    ;muls d7,d5
    ;asr.l #6,d5
    moveq #0,d5
    
    ; d6 = M1(3,2) x M2(2,1)
    ;M1_3_2 d6
    ;muls d1,d6
    ;M2_NORMALIZE_AND_ADD_11

    ; d6 = M1(3,3) x M2(3,1)
    M1_3_3 d6
    M2_3_1 d7
    muls d7,d6
    M2_NORMALIZE_AND_ADD_11

    move.w d5,18(a6)
    
; Start calculation of output position  M-output(3,2)
    ; d5 = M1(3,1) x M2(1,2)
    ;M1_3_1 d5
    ;muls d0,d5
    ;moveq #11,d7
	;asr.l d7,d5
    moveq #0,d5
    
    ; d6 = M1(3,2) x M2(2,2)
    ;M1_3_2 d6
    ;M2_2_2 d7
    ;muls d7,d6
    ;M2_NORMALIZE_AND_ADD_11
    
    ; d6 = M1(3,3) x M2(3,2)
    M1_3_3 d6
    muls d3,d6
    M2_NORMALIZE_AND_ADD_11
    move.w d5,20(a6)
    
; Start calculation of output position  M-output(3,3)
    ; d5 = M1(3,1) x M2(1,3)
    ;M1_3_1 d5
    ;M2_1_3 d7
    ;muls d7,d5
    ;moveq #11,d7
	;asr.l d7,d5
    moveq #0,d5
    
    ; d6 = M1(3,2) x M2(2,3)
    ;M1_3_2 d6
    ;muls d2,d6
    ;M2_NORMALIZE_AND_ADD_11
    
    ; d6 = M1(3,3) x M2(3,3)
    M1_3_3 d6
    muls d4,d6
    M2_NORMALIZE_AND_ADD_11
    move.w d5,22(a6)
    
    movem.l (sp)+,d0-d7/a0-a6
    rts
