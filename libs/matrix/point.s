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

; Defines:
; - VAMPIRE
;
; Trashes: nothing

point_execute_transformation:
  movem.l                                  d2/a0,-(sp)

  IFD                                      VAMPIRE

  and.l                                    #$0000FFFF,d0
  and.l                                    #$0000FFFF,d1

  asl.w                                    #6,d0
  move.l                                   #$0040FFFF,d2
  asl.w                                    #6,d1
  move.w                                   d1,d2

  vperm                                    #$8967EFCD,d0,d2,e1
  REG_ZERO                                 e2
  REG_ZERO                                 e3

  LOAD_CURRENT_TRANSFORMATION_MATRIX       e4,e5,e6
  ENDC

  IFND                                     VAMPIRE
  lea                                      OPERATOR2_TR_MATRIX_ROW1(PC),a0
  LOAD_CURRENT_TRANSFORMATION_MATRIX_AX    a0
  moveq                                    #6,d2
  lea                                      OPERATOR1_TR_MATRIX_ROW1(PC),a0
  move.w                                   #$0000,(a0)+
  asl.w                                    d2,d0
  asl.w                                    d2,d1
  move.w                                   d0,(a0)+
  move.w                                   d1,(a0)+
  move.w                                   #$0040,(a0)
  ENDC

  bsr.w                                    ammxmatrixmul1X3_q10_6

  IFD                                      VAMPIRE
  vperm                                    #$FFFFFF23,e13,e2,d0
  vperm                                    #$FFFFFF45,e13,e2,d1
  ELSE	
  move.w                                   2+OPERATOR3_TR_MATRIX_ROW1(PC),d0
  move.w                                   4+OPERATOR3_TR_MATRIX_ROW1(PC),d1
  ENDC

  ext.l                                    d0
  ext.l                                    d1

  IFD                                      VAMPIRE
  lsr.l                                    #6,d0
  lsr.l                                    #6,d1
  ELSE
  lsr.l                                    d2,d0
  lsr.l                                    d2,d1
  ENDC

  movem.l                                  (sp)+,d2/a0
  rts

  IFD                                      USE_3D
; place x into d0
;       y into d1
;		z into d2
; output will be into d0 d1 (register overwritten)
point_execute_transformation_3d:
	;IFD VAMPIRE
  move.l                                   d3,-(sp)
	;ENDC

  IFD                                      VAMPIRE

  and.l                                    #$0000FFFF,d0
  and.l                                    #$0000FFFF,d1
  and.l                                    #$0000FFFF,d2

  asl.w                                    #6,d0
  asl.w                                    #6,d1
  asl.w                                    #6,d2

  move.w                                   d2,d3
  swap                                     d3	
  move.w                                   d1,d3

  vperm                                    #$4567EFCD,d0,d3,e1
  REG_ZERO                                 e2
  REG_ZERO                                 e3

  LOAD_CURRENT_TRANSFORMATION_MATRIX       e4,e5,e6
  ENDC

  IFND                                     VAMPIRE
  LOAD_CURRENT_TRANSFORMATION_MATRIX_PC    OPERATOR2_TR_MATRIX_ROW1
  moveq                                    #6,d3
  move.w                                   #$0000,OPERATOR1_TR_MATRIX_ROW1
  asl.w                                    d3,d0
  asl.w                                    d3,d1
  asl.w                                    d3,d2
  move.w                                   d0,OPERATOR1_TR_MATRIX_ROW1+2
  move.w                                   d1,OPERATOR1_TR_MATRIX_ROW1+4
  move.w                                   d2,OPERATOR1_TR_MATRIX_ROW1+6

  ENDC

  bsr.w                                    ammxmatrixmul1X3_q10_6

  IFD                                      VAMPIRE
  vperm                                    #$FFFFFF23,e13,e2,d0
  vperm                                    #$FFFFFF45,e13,e2,d1
  vperm                                    #$FFFFFF67,e13,e2,d2
  ENDC

  IFND                                     VAMPIRE	
  move.w                                   2+OPERATOR3_TR_MATRIX_ROW1(PC),d0
  move.w                                   4+OPERATOR3_TR_MATRIX_ROW1(PC),d1
  move.w                                   6+OPERATOR3_TR_MATRIX_ROW1(PC),d2
  ENDC

  ext.l                                    d0
  ext.l                                    d1
  ext.l                                    d2
	
  IFD                                      VAMPIRE
  lsr.l                                    #6,d0
  lsr.l                                    #6,d1
  lsr.l                                    #6,d2
  ELSE
  lsr.l                                    d3,d0
  lsr.l                                    d3,d1
  lsr.l                                    d3,d2
  ENDC

  move.l                                   (sp)+,d3
  rts

PROJECTION_CENTER_X:
  dc.w                                     160
PROJECTION_CENTER_Y:
  dc.w                                     128

point_project_3d:
	;d0 ; Xe
	;d1 ; Ye
	;d2 ; Ze
	;move.l #256,d6 ; Zu

	; start calc
  asl.l                                    #8,d0                                ; xe*zu
  asl.l                                    #8,d1                                ; ye*zu

  addi.w                                   #256,d2

  divs.w                                   d2,d0
  divs.w                                   d2,d1

  add.w                                    PROJECTION_CENTER_X(PC),d0
  add.w                                    PROJECTION_CENTER_Y(PC),d1

  rts
  ENDC
