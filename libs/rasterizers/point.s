POINT_TRANSFORM_AND_STORE_IN_FILLTABLE MACRO
    lea LINEVERTEX_START_FINAL+\3,a1

    move.w \1,d0
    move.w \2,d1

    bsr.w point_execute_transformation

    move.w d0,(a1)+
    move.w d1,(a1)+

    ENDM

	IFD USE_3D
POINT_TRANSFORM_AND_STORE_IN_FILLTABLE_3D MACRO
    lea LINEVERTEX_START_FINAL+\4,a1

    move.w \1,d0
    move.w \2,d1
	move.w \3,d2

    bsr.w point_execute_transformation_3d
	bsr.w point_project_3d

    move.w d0,(a1)+
    move.w d1,(a1)+

    ENDM
	ENDC

POINT_Q_10_6 MACRO

	and.l #$0000FFFF,d0
	;and.l #$0000FFFF,d1

	IFD VAMPIRE

	move.w \1,d0
	move.l #$0040FFFF,d1
	move.w \2,d1

	vperm #$8967EFCD,d0,d1,e1
	REG_ZERO e2
	REG_ZERO e3

	LOAD_CURRENT_TRANSFORMATION_MATRIX e4,e5,e6
	ENDC

	IFND VAMPIRE
	LOAD_CURRENT_TRANSFORMATION_MATRIX OPERATOR2_TR_MATRIX_ROW1
	move.w #$0000,OPERATOR1_TR_MATRIX_ROW1
	move.w \1,OPERATOR1_TR_MATRIX_ROW1+2
	move.w \2,OPERATOR1_TR_MATRIX_ROW1+4
	move.w #$0040,OPERATOR1_TR_MATRIX_ROW1+6
	
	ENDC

	bsr.w ammxmatrixmul1X3_q10_6

	IFD VAMPIRE
	vperm #$FFFFFF23,e13,e2,d0
	vperm #$FFFFFF45,e13,e2,d1
	ENDC

	IFND VAMPIRE	
	move.w OPERATOR3_TR_MATRIX_ROW1+2,d0
	move.w OPERATOR3_TR_MATRIX_ROW1+4,d1
	ENDC

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

	IFD RTG
	IFD RTG_640_300_3
	

; POINT - Plots a point (CPU)
; Input:
;	- d0.w : Point X (0-319)
;	- d1.w : Point Y (0-255)
;
; Output:
;   Nothing
;
; Defines:
; - USE_CLIPPING
; - USE_DBLBUF
;
; Trashes:
; - d0
; - d1
; - d7
; - a0
; - a1
POINT:
	bsr.w               point_execute_transformation

	SETBITPLANE         0,a0 				; a0 now points to my chunky screen
	IFD VAMPIRE
	lea 				(a0,d0.w),a0
	lea 				(a0,d0.w*2),a0
	ELSE
	muls 				#RTG_PIXEL_SIZE,d0
	adda.l 				d0,a0
	ENDC
	mulu 				#WIDTH*RTG_PIXEL_SIZE,d1 			; d1 now holds byte offset for current y position
	adda.l 				d1,a0
;.pointcycle
	lea					STROKE_DATA_RTG+1,a1
	IFD VAMPIRE		
	move.b 				(a1)+,(a0)+   ; set pixel color high part
	move.w              (a1),(a0)    ; low part
	ELSE
	move.b 				(a1)+,(a0)+
	move.b 				(a1)+,(a0)+
	move.b 				(a1)+,(a0)+
	ENDC
	rts
	ENDC
	ELSE
; POINT - Plots a point (CPU)
; Input:
;	- d0.w : Point X (0-319)
;	- d1.w : Point Y (0-255)
;
; Output:
;   Nothing
;
; Defines:
; - USE_CLIPPING
; - USE_DBLBUF
;
; Trashes:
; - d0
; - d1
; - a0
; - a1
POINT:

  bsr.w                                    point_execute_transformation

	; start plot routine
  lea                                      PLOTREFS,a1
  add.w                                    d1,d1
  move.w                                   0(a1,d1.w),d1
  move.w                                   d0,d4
  lsr.w                                    #3,d4
  add.w                                    d4,d1
  not.b                                    d0
  btst.b                                   #0,STROKE_DATA
  beq.s                                    point_no_bpl_0
  SETBITPLANE                              0,a0
  bset                                     d0,(a0,d1.w)
point_no_bpl_0:
  btst.b                                   #1,STROKE_DATA
  beq.s                                    point_no_bpl_1
  SETBITPLANE                              1,a0
  bset                                     d0,(a0,d1.w)
point_no_bpl_1:
  rts
  ENDC


PLOTPOINT MACRO
	lea PLOTREFS,a1
	add.w d1,d1
	move.w 0(a1,d1.w),d1
	move.w d0,d4
	lsr.w #3,d4
	add.w d4,d1
	not.b d0
	;lea \1,a0 a0 is reg input
	bset d0,(a0,d1.w)
	ENDM