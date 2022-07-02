ROTATE_REG:
	movem.l                                 d0-d2/a0-a6,-(sp)                              ; stack save

    lea      ROT_Z_MATRIX_Q5_11,a5
    lsl.w    #3,d0
	move.l   0(a5,d0.w),a0

    moveq    #0,d1
	move.w   4(a5,d0.w),d1
    move.l   d1,a1

    moveq    #0,d1
    move.w   6(a5,d0.w),d1
    swap     d1
    move.l   d1,a2

    moveq    #0,d1
    move.l   d1,a3

    move.l   #$00000800,a4

    lea CURRENT_TRANSFORMATION_MATRIX,a6
    LOAD_M2_REG

    bsr.w                                   matrixmul3X3_reg_q5_11

	bsr.w    matrixmul3X3_reg_q5_11
    movem.l                                 (sp)+,d0-d2/a0-a6
	rts
