X_SCREEN_RES:           dc.w                        320
X_SCREEN_RES_LAST_X:    dc.w                        319

GLOBAL_OPTIONS:
                        dc.l                        $00000000
                        dc.b                        $00
FILL_DATA:              dc.b                        $01                                           ; fill colors here
DRAWING_OPTIONS:        dc.b                        $00                                           ; bit 0 = clipping enabled
STROKE_DATA:            dc.b                        $01                                           ; stroke colors here

  IFD RTG
STROKE_DATA_RTG:        dc.l                        $FFFFFFFF
  ENDC

STROKE MACRO
                        IFD RTG
                        move.l                      \1,STROKE_DATA_RTG
                        ELSE
                        IFD                         VAMPIRE 
                        PAND                        #$FFFFFFFFFFFFFF00,e22,e22                    ; last byte zeroed
                        POR                         \1,e22,e22                                    ; last byte reserved for bitplanes
                        ENDC
                        move.b                      \1,STROKE_DATA
                        ENDC
                        ENDM
GET_STROKE MACRO
                        move.b                      STROKE_DATA,\1
                        ENDM

FILL MACRO
                        move.b                      \1,FILL_DATA
                        ENDM
GET_FILL MACRO
                        move.b                       FILL_DATA,\1
                        ENDM

ENABLE_CLIPPING_VAMPIRE MACRO
                        POR                         #$0000000000000100,e22,e22
                        move.l                      #ammx_fill_table_clip,AMMX_FILL_FUNCT_ADDR
                        ENDM
DISABLE_CLIPPING_VAMPIRE MACRO
                        move.w                      #0,LINEVERTEX_CLIP_X_OFFSET
                        PAND                        #$FFFFFFFFFFFFFEFF,e22,e22
                        move.l                      #ammx_fill_table,AMMX_FILL_FUNCT_ADDR
                        ENDM

ENABLE_CLIPPING_68 MACRO
                        ori.b                       #$01,DRAWING_OPTIONS
                        move.l                      #ammx_fill_table_clip,AMMX_FILL_FUNCT_ADDR
                        ENDM
DISABLE_CLIPPING_68 MACRO
                        move.w                      #0,LINEVERTEX_CLIP_X_OFFSET
                        andi.b                      #$FE,DRAWING_OPTIONS
                        move.l                      #ammx_fill_table,AMMX_FILL_FUNCT_ADDR
                        ENDM

ENABLE_CLIPPING MACRO
                        IFD                         VAMPIRE
                        ENABLE_CLIPPING_VAMPIRE
                        ELSE
                        ENABLE_CLIPPING_68
                        ENDC
                        ENDM

DISABLE_CLIPPING MACRO
                        IFD                         VAMPIRE
                        DISABLE_CLIPPING_VAMPIRE
                        ELSE
                        DISABLE_CLIPPING_68
                        ENDC
                        ENDM

SETBITPLANE MACRO
                        IFD                         USE_DBLBUF
                        move.l                      SCREEN_PTR_\1,\2
                        ELSE
                        lea                         SCREEN_\1,\2
                        ENDC
                        ENDM

MINUWORD MACRO
                        cmp.w                       \2,\1
                        bhi.s                       .1\@
                        move.w                      \1,\2
.1\@
                        ENDM

MAXUWORD MACRO
                        cmp.w                       \2,\1
                        bcs.s                       .1\@
                        move.w                      \1,\2
.1\@
                        ENDM

; This macro does:
; if d0.w<(a2.w) then (a2.w)=d0.w
; if (d0.w>2(a2.w)) then 2(a2.w) = d0.w
; a0 usually points to FILL_TABLE and
; FILLTABLE is dcb.l 4*256,$7FFF8000 
MINXMAXALL MACRO
                        IFD                         VAMPIRE
                        pminsw                      -6(a2),\1,e0
                        pmaxsw                      -4(a2),\1,e1
                        vperm                       #$67EF67EF,e0,e1,e2
                        storec                      E2,E4,(a2)
                        ELSE
                        cmp.w                       (a2),\1
                        bge.s                       .1\@                                          ; if (a2)<=d0 branch (dont update the memory)
                        move.w                      \1,(a2)                                       ; we save only if is less     
.1\@:
                        cmp.w                       2(a2),\1
                        ble.s                       .2\@
                        move.w                      \1,2(a2)
.2\@:
                        ENDC
                        ENDM

MINMAXDX MACRO
                        IFD                         VAMPIRE
                        pmaxsw                      -4(a2),\1,e1
                        vperm                       #$67EF67EF,e0,e1,e2
                        storec                      E2,E4,(a2)
                        ELSE
                        cmp.w                       2(a2),\1
                        ble.s                       .1\@
                        move.w                      \1,2(a2)
.1\@:
                        ENDC
                        ENDM

FILLTABLE_FRAME_MIN_Y:  dc.w                        -1
FILLTABLE_FRAME_MAX_Y:  dc.w                        0

MEMCPY4 MACRO
	move.l #\3,d7
	subq   #1,d7
	lea \1,a0
	lea \2,a1
.1\@
	move.l (a0)+,(a1)+
	dbra d7,.1\@
	ENDM

BZERO4 MACRO
	move.l #\2,d7
	subq   #1,d7
	lea \1,a0
.1\@
	clr.l (a0)+
	dbra d7,.1\@
	ENDM

DEBUG MACRO
  clr.w                  $100
  move.w                 #$\1,d3
  ENDM

DEBUG2 MACRO
  clr.w                  $101
  move.w                 #$\1,d3
  ENDM

