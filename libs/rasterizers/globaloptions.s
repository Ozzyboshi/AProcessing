X_SCREEN_RES:         dc.w      320
X_SCREEN_RES_LAST_X:  dc.w      319

GLOBAL_OPTIONS:
                      dc.l      $00000000
                      dc.w      $0000
DRAWING_OPTIONS:      dc.b      $00                           ; bit 0 = clipping enabled
STROKE_DATA:          dc.b      $01                           ; colors here

AMMX_FILL_FUNCT_ADDR    dc.l ammx_fill_table
STROKE MACRO
                      IFD       VAMPIRE 
                      PAND      #$FFFFFFFFFFFFFF00,e22,e22    ; last byte zeroed
                      POR       \1,e22,e22                    ; last byte reserved for bitplanes
                      ENDIF
                      move.b    \1,STROKE_DATA
                      ENDM

                      IFD       USE_CLIPPING
ENABLE_CLIPPING MACRO
                      IFD       VAMPIRE
                      POR       #$0000000000000100,e22,e22
                      ENDIF
                      IFND      VAMPIRE
                      ori.b     #$01,DRAWING_OPTIONS
                      ENDIF
                      move.l  #ammx_fill_table_clip,AMMX_FILL_FUNCT_ADDR
                      ENDM
DISABLE_CLIPPING MACRO
                      move.w #0,LINEVERTEX_CLIP_X_OFFSET
                      IFD       VAMPIRE
                      PAND      #$FFFFFFFFFFFFFEFF,e22,e22
                      ENDIF
                      IFND      VAMPIRE
                      andi.b    #$FE,DRAWING_OPTIONS
                      ENDIF
                      move.l  #ammx_fill_table,AMMX_FILL_FUNCT_ADDR
                      ENDM
                      ENDIF

MINUWORD MACRO
                      cmp.w     \2,\1
                      bhi.s     .1\@
                      move.w    \1,\2
.1\@
                      ENDM

MAXUWORD MACRO
                      cmp.w     \2,\1
                      bcs.s     .1\@
                      move.w    \1,\2
.1\@
                      ENDM
