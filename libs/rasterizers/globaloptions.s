X_SCREEN_RES:           dc.w                        320
X_SCREEN_RES_LAST_X:    dc.w                        319

GLOBAL_OPTIONS:
                        dc.l                        $00000000
                        dc.w                        $0000
DRAWING_OPTIONS:        dc.b                        $00                                           ; bit 0 = clipping enabled
STROKE_DATA:            dc.b                        $01                                           ; colors here

AMMX_FILL_FUNCT_ADDR    dc.l                        ammx_fill_table
STROKE MACRO
                        IFD                         VAMPIRE 
                        PAND                        #$FFFFFFFFFFFFFF00,e22,e22                    ; last byte zeroed
                        POR                         \1,e22,e22                                    ; last byte reserved for bitplanes
                        ENDC
                        move.b                      \1,STROKE_DATA
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
FILLTABLE_FRAME_MIN_Y:  dc.w                        -1
FILLTABLE_FRAME_MAX_Y:  dc.w                        0
