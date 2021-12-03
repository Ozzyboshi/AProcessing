  XDEF                  _blitfillline_test1
  XDEF                  _blitfillline_test2
  XDEF                  _blitfillline_test3
  XDEF                  _blitfillline_test4
  XDEF                  _blitfillline_test5
  XDEF                  _blitfillline_test6
  XDEF                  _blitfillline_test7
  XDEF                  _blitfillline_test8
  XDEF                  _blitfillline_test9

  include               "../../../libs/rasterizers/processing_bitplanes_fast.s"
  ;include               "../../../libs/rasterizers/globaloptions.s"
  include               "../../../libs/ammxmacros.i"
  include               "../../../libs/matrix/matrix.s"
  include               "../../../libs/rasterizers/point.s"
  include               "../../../libs/trigtables.i"
  include               "../../../libs/rasterizers/processing_table_plotrefs.s"
  include               "../../../libs/rasterizers/processingclearfunctions.s"
  ;include               "../../../libs/rasterizers/clipping.s"
  include               "../../../libs/blitter/lines.s"

_blitfillline_test1:
  move.l                d2,-(sp)
  CLEARFASTBITPLANES 
         
  lea                   $dff000,a5
  jsr                   InitLine                                                   ; inizializza line-mode

  move.w                #$ffff,d0                                                  ; linea continua
  jsr                   SetPattern                                                 ; definisce pattern

  MOVE.W                #%1000001111000000,$96(a5)

  move.w                #0,d0                                                      ; x1
  move.w                #0,d1                                                      ; y1
  move.w                #0,d2                                                      ; x2
  move.w                #5,d3                                                      ; y2
;	lea	bitplane,a0
  lea                   SCREEN_0,a0

  bsr.w                 DrawlineFill

	
  bsr.w                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                (sp)+,d2
  rts

_blitfillline_test2:
  move.l                d2,-(sp)
  CLEARFASTBITPLANES 
         
  lea                   $dff000,a5
  jsr                   InitLine                                                   ; inizializza line-mode

  move.w                #$ffff,d0                                                  ; linea continua
  jsr                   SetPattern                                                 ; definisce pattern

  MOVE.W                #%1000001111000000,$96(a5)

  move.w                #0,d0                                                      ; x1
  move.w                #5,d1                                                      ; y1
  move.w                #30,d2                                                     ; x2
  move.w                #5,d3                                                      ; y2
  lea                   SCREEN_0,a0

  bsr.w                 DrawlineFill

  bsr.w                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                (sp)+,d2
  rts

_blitfillline_test3:
  move.l                d2,-(sp)
  CLEARFASTBITPLANES 
         
  lea                   $dff000,a5
  jsr                   InitLine                                                   ; inizializza line-mode

  move.w                #$ffff,d0                                                  ; linea continua
  jsr                   SetPattern                                                 ; definisce pattern

  MOVE.W                #%1000001111000000,$96(a5)

  move.w                #5,d0                                                      ; x1
  move.w                #0,d1                                                      ; y1
  move.w                #0,d2                                                      ; x2
  move.w                #5,d3                                                      ; y2
  lea                   SCREEN_0,a0

  bsr.w                 DrawlineFill


  move.w                #5,d0                                                      ; x1
  move.w                #0,d1                                                      ; y1
  move.w                #10,d2                                                     ; x2
  move.w                #5,d3                                                      ; y2
  lea                   SCREEN_0,a0

  bsr.w                 DrawlineFill


  move.w                #0,d0                                                      ; x1
  move.w                #5,d1                                                      ; y1
  move.w                #10,d2                                                     ; x2
  move.w                #5,d3                                                      ; y2
  lea                   SCREEN_0,a0
  bsr.w                 DrawlineFill

  WAITBLITTER

  move.w                #5,d0                                                      ; x1
  move.w                #0,d1                                                      ; y1
  lea                   SCREEN_0,a0
  ;PLOTPOINT

  move.w                #0,d0                                                      ; x1
  move.w                #5,d1                                                      ; y1
  ;PLOTPOINT

  move.w                #10,d0                                                     ; x1
  move.w                #5,d1                                                      ; y1
  ;PLOTPOINT

  bsr.w                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                (sp)+,d2
  rts


_blitfillline_test4:
  move.l                d2,-(sp)
  CLEARFASTBITPLANES 
         
  lea                   $dff000,a5
  jsr                   InitLine                                                   ; inizializza line-mode

  move.w                #$ffff,d0                                                  ; linea continua
  jsr                   SetPattern                                                 ; definisce pattern

  MOVE.W                #%1000001111000000,$96(a5)

  move.w                #15,d0                                                     ; x1
  move.w                #0,d1                                                      ; y1
  move.w                #0,d2                                                      ; x2
  move.w                #5,d3                                                      ; y2
  lea                   SCREEN_0,a0

  bsr.w                 DrawlineFill


  move.w                #15,d0                                                     ; x1
  move.w                #0,d1                                                      ; y1
  move.w                #30,d2                                                     ; x2
  move.w                #5,d3                                                      ; y2
  lea                   SCREEN_0,a0

  bsr.w                 DrawlineFill


  move.w                #0,d0                                                      ; x1
  move.w                #5,d1                                                      ; y1
  move.w                #30,d2                                                     ; x2
  move.w                #5,d3                                                      ; y2
  lea                   SCREEN_0,a0
  bsr.w                 DrawlineFill

  WAITBLITTER
  move.w                #15,d0                                                     ; x1
  move.w                #0,d1                                                      ; y1
  lea                   SCREEN_0,a0
  ;PLOTPOINT

  move.w                #0,d0                                                      ; x1
  move.w                #5,d1                                                      ; y1
  ;PLOTPOINT

  move.w                #30,d0                                                     ; x1
  move.w                #5,d1                                                      ; y1
  ;PLOTPOINT

  bsr.w                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                (sp)+,d2
  rts


_blitfillline_test5:
  move.l                d2,-(sp)
  CLEARFASTBITPLANES 
         
  lea                   $dff000,a5
  jsr                   InitLine                                                   ; inizializza line-mode

  move.w                #$ffff,d0                                                  ; linea continua
  jsr                   SetPattern                                                 ; definisce pattern

  MOVE.W                #%1000001111000000,$96(a5)

  move.w                #15,d0                                                     ; x1
  move.w                #0,d1                                                      ; y1
  move.w                #0,d2                                                      ; x2
  move.w                #5,d3                                                      ; y2
  lea                   SCREEN_0,a0

  bsr.w                 DrawlineFill


  move.w                #15,d0                                                     ; x1
  move.w                #0,d1                                                      ; y1
  move.w                #30,d2                                                     ; x2
  move.w                #5,d3                                                      ; y2
  lea                   SCREEN_0,a0

  bsr.w                 DrawlineFill

  move.w                #0,d0                                                      ; x1
  move.w                #5,d1                                                      ; y1
  move.w                #30,d2                                                     ; x2
  move.w                #5,d3                                                      ; y2
  lea                   SCREEN_0,a0
  bsr.w                 DrawlineFill

  move.w                #0,d0                                                      ; inclusivo
  move.w                #0,d1                                                      ; CARRYIN = 0

  ; top left point into d3 and d4
  move.w                #0,d3
  move.w                #0,d4

  ; bottom right pointo into d5 and d6
  move.w                #30,d5
  move.w                #5,d6

  ; source is SCREEN_0
  lea                   SCREEN_0,a0
  ; destination is SCREEN_1
  lea                   SCREEN_1,a1

  ;we need a5
  lea                   $dff000,a5

  jsr                   Fill_From_A_to_B

  WAITBLITTER
  move.w                #15,d0                                                     ; x1
  move.w                #0,d1                                                      ; y1
  move.l                a1,a0
  PLOTPOINT

  move.w                #0,d0                                                      ; x1
  move.w                #5,d1                                                      ; y1
  PLOTPOINT

  move.w                #30,d0                                                     ; x1
  move.w                #5,d1                                                      ; y1
  PLOTPOINT

  jsr                   Fill_From_A_to_B_Clear
  WAITBLITTER
  bsr.w                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                (sp)+,d2
  rts



_blitfillline_test6:
  move.l                d2,-(sp)
  CLEARFASTBITPLANES 
         
  lea                   $dff000,a5
  jsr                   InitLine                                                   ; inizializza line-mode

  move.w                #$ffff,d0                                                  ; linea continua
  jsr                   SetPattern                                                 ; definisce pattern

  MOVE.W                #%1000001111000000,$96(a5)

  move.w                #15,d0                                                     ; x1
  move.w                #0,d1                                                      ; y1
  move.w                #0,d2                                                      ; x2
  move.w                #15,d3                                                      ; y2
  lea                   SCREEN_0,a0

  bsr.w                 DrawlineFill


  move.w                #15,d0                                                     ; x1
  move.w                #0,d1                                                      ; y1
  move.w                #30,d2                                                     ; x2
  move.w                #15,d3                                                      ; y2
  lea                   SCREEN_0,a0

  bsr.w                 DrawlineFill

  move.w                #0,d0                                                      ; x1
  move.w                #15,d1                                                      ; y1
  move.w                #30,d2                                                     ; x2
  move.w                #15,d3                                                      ; y2
  lea                   SCREEN_0,a0
  bsr.w                 DrawlineFill

  move.w                #0,d0                                                      ; inclusivo
  move.w                #0,d1                                                      ; CARRYIN = 0

  ; top left point into d3 and d4
  move.w                #0,d3
  move.w                #0,d4

  ; bottom right pointo into d5 and d6
  move.w                #30,d5
  move.w                #15,d6

  ; source is SCREEN_0
  lea                   SCREEN_0,a0
  ; destination is SCREEN_1
  lea                   SCREEN_1,a1

  ;we need a5
  lea                   $dff000,a5

  jsr                   Fill_From_A_to_B

  WAITBLITTER
  move.w                #15,d0                                                     ; x1
  move.w                #0,d1                                                      ; y1
  move.l                a1,a0
  PLOTPOINT

  move.w                #0,d0                                                      ; x1
  move.w                #15,d1                                                      ; y1
  PLOTPOINT

  move.w                #30,d0                                                     ; x1
  move.w                #15,d1                                                      ; y1
  PLOTPOINT

  jsr                   Fill_From_A_to_B_Clear
  WAITBLITTER
  bsr.w                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                (sp)+,d2
  rts



_blitfillline_test7:
  ;movem.l        d2/a4,-(sp)
  move.l                d2,-(sp)
  CLEARFASTBITPLANES
         
  lea                   $dff000,a5
  jsr                   InitLine                                                   ; inizializza line-mode

  move.w                #$ffff,d0                                                  ; linea continua
  jsr                   SetPattern                                                 ; definisce pattern

  MOVE.W                #%1000001111000000,$96(a5)

  move.w                #0,d0                                                     ; x1
  move.w                #0,d1                                                      ; y1
  move.w                #0,d2                                                      ; x2
  move.w                #255,d3                                                      ; y2
  lea                   SCREEN_0,a0

  bsr.w                 DrawlineFill


  move.w                #0,d0                                                     ; x1
  move.w                #0,d1                                                      ; y1
  move.w                #319,d2                                                     ; x2
  move.w                #255,d3                                                      ; y2
  lea                   SCREEN_0,a0

  bsr.w                 DrawlineFill

  move.w                #0,d0                                                      ; x1
  move.w                #255,d1                                                      ; y1
  move.w                #319,d2                                                     ; x2
  move.w                #255,d3                                                      ; y2
  lea                   SCREEN_0,a0
  bsr.w                 DrawlineFill

  move.w                #0,d0                                                      ; inclusivo
  move.w                #0,d1                                                      ; CARRYIN = 0

  ; top left point into d3 and d4
  move.w                #0,d3
  move.w                #0,d4

  ; bottom right pointo into d5 and d6
  move.w                #319,d5
  move.w                #255,d6

  ; source is SCREEN_0
  lea                   SCREEN_0,a0
  ; destination is SCREEN_1
  lea                   SCREEN_1,a1

  ;we need a5
  lea                   $dff000,a5

  jsr                   Fill_From_A_to_B

  WAITBLITTER
  move.w                #0,d0                                                     ; x1
  move.w                #0,d1                                                      ; y1
  move.l                a1,a0
  PLOTPOINT

  move.w                #0,d0                                                      ; x1
  move.w                #255,d1                                                      ; y1
  PLOTPOINT

  move.w                #319,d0                                                     ; x1
  move.w                #255,d1                                                      ; y1
  PLOTPOINT

  jsr                   Fill_From_A_to_B_Clear
  WAITBLITTER
  bsr.w                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                (sp)+,d2
  ;movem.l        (sp)+,d2/a4
  rts

_blitfillline_test8:
  move.l                d2,-(sp)
  CLEARFASTBITPLANES
         
  lea                   $dff000,a5
  jsr                   InitLine                                                   ; inizializza line-mode

  move.w                #$ffff,d0                                                  ; linea continua
  jsr                   SetPattern                                                 ; definisce pattern

  MOVE.W                #%1000001111000000,$96(a5)

  move.w                #8,d0                                                     ; x1
  move.w                #1,d1                                                      ; y1
  move.w                #16,d2                                                      ; x2
  move.w                #1,d3                                                      ; y2
  lea                   SCREEN_0,a0

  bsr.w                 DrawlineFill

  move.w                #8,d0                                                     ; x1
  move.w                #1,d1                                                      ; y1
  move.w                #8,d2                                                     ; x2
  move.w                #255,d3                                                      ; y2
  lea                   SCREEN_0,a0

  bsr.w                 DrawlineFill

  move.w                #16,d0                                                      ; x1
  move.w                #1,d1                                                      ; y1
  move.w                #8,d2                                                     ; x2
  move.w                #255,d3                                                      ; y2
  lea                   SCREEN_0,a0
  bsr.w                 DrawlineFill

  move.w                #0,d0                                                      ; inclusivo
  move.w                #0,d1                                                      ; CARRYIN = 0

  ; top left point into d3 and d4
  move.w                #8,d3
  move.w                #1,d4

  ; bottom right pointo into d5 and d6
  move.w                #16,d5
  move.w                #255,d6

  ; source is SCREEN_0
  lea                   SCREEN_0,a0
  ; destination is SCREEN_1
  lea                   SCREEN_1,a1

  ;we need a5
  lea                   $dff000,a5

  jsr                   Fill_From_A_to_B

  lea                   $dff000,a5
  jsr                   InitLine                                                   ; inizializza line-mode

  move.w                #$ffff,d0                                                  ; linea continua
  jsr                   SetPattern  

  lea                   SCREEN_1,a0
   move.w                #8,d0                                                     ; x1
  move.w                #1,d1       
  move.w                #16,d2                                                    ; x1
  move.w                #1,d3
  jsr DrawlineOr

  lea                   SCREEN_1,a0
   move.w                #8,d0                                                     ; x1
  move.w                #1,d1       
  move.w                #8,d2                                                     ; x1
  move.w                #255,d3
  jsr DrawlineOr

  lea                   SCREEN_1,a0
   move.w                #16,d0                                                     ; x1
  move.w                #1,d1       
  move.w                #8,d2                                                     ; x1
  move.w                #255,d3
  jsr DrawlineOr

  jsr                   Fill_From_A_to_B_Clear
  WAITBLITTER
  bsr.w                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                (sp)+,d2
  rts



BLITTRIANGLE MACRO
  move.w VERTEX_LIST_2D_1,d0 ; x1
  move.w VERTEX_LIST_2D_1+2,d1 ; y1
  move.w VERTEX_LIST_2D_2,d2                                                      ; x2
  move.w VERTEX_LIST_2D_2+2,d3                                                      ; y2
  
 ; START COMPARISON

  ; d6 will hold the mins (format YYXX)
    ; d7 will hold the maxs (format YYXX)
    
    ; assume first point is min and max
    
    ; y
    move.w d1,d6
    move.w d1,d7
    
    ; x
    swap d6
    swap d7
    move.w d0,d6
    move.w d0,d7
    
    ; update xmin
    cmp.w d2,d6
    bls.s .xgreaterequaltthan
    move.w d2,d6
    bra.s .blittrigxdone
.xgreaterequaltthan:
    ; update xmax
    bcc.s .blittrigxdone
    move.w d2,d7
.blittrigxdone:
    ; start comparing y
    swap d6
    swap d7
     ; update ymin
    cmp.w d3,d6
    bls.s .ygreaterequaltthan
    move.w d3,d6
    bra.s .blittrigxdone2
.ygreaterequaltthan:
    ; update xmax
    bcc.s .blittrigxdone2
    move.w d3,d7
.blittrigxdone2
    swap d6
    swap d7
  ; END COMPARISON
  lea                   \1,a0
  bsr.w                 DrawlineFill ; first line
  
  ; start of second line
  move.w                VERTEX_LIST_2D_1,d0                                                     ; x1
  move.w                VERTEX_LIST_2D_1+2,d1                                                      ; y1
  move.w                VERTEX_LIST_2D_3,d2                                                     ; x2
  move.w                VERTEX_LIST_2D_3+2,d3                                                      ; y2
  
; START COMPARISON
; update xmin
    cmp.w d2,d6
    bls.s .xgreaterequaltthan2
    move.w d2,d6
    bra.s .xdone
.xgreaterequaltthan2:
    ; update xmax
    bcc.s .xdone
    move.w d2,d7
.xdone:
    ; start comparing y
    swap d6
    swap d7
     ; update ymin
    cmp.w d3,d6
    bls.s .ygreaterequaltthan2
    move.w d3,d6
    bra.s .xdone2
.ygreaterequaltthan2:
    ; update xmax
    bcc.s .xdone
    move.w d3,d7
.xdone2
    swap d6
    swap d7
; END COMPARISON
  
  lea                   \1,a0
  bsr.w                 DrawlineFill ; second line

  ; start of third line

  move.w                VERTEX_LIST_2D_2,d0                                                      ; x1
  move.w                VERTEX_LIST_2D_2+2,d1                                                      ; y1
  move.w                VERTEX_LIST_2D_3,d2                                                     ; x2
  move.w                VERTEX_LIST_2D_3+2,d3                                                      ; y2
  lea                   \1,a0
  bsr.w                 DrawlineFill ; third line

  move.w                #0,d0                                                      ; inclusivo
  move.w                #0,d1                                                      ; CARRYIN = 0

  ; top left point into d3 and d4
  move.w                d6,d3
  move.l                d6,d4
  swap d4

    ; bottom right pointo into d5 and d6
  move.w                d7,d5
  move.l                d7,d6
  swap d6

  ; source is SCREEN_0
  lea                   \1,a0
  ; destination is SCREEN_1
  lea                   \2,a1

  ;we need a5
  lea                   $dff000,a5

  ;move.w d3,SCREEN_0
  ;move.w d4,2+SCREEN_0
  ;move.w d5,4+SCREEN_0
  ;move.w d6,6+SCREEN_0

  jsr                   Fill_From_A_to_B

  lea                   $dff000,a5
  jsr                   InitLine                                                   ; inizializza line-mode

  move.w                #$ffff,d0                                                  ; linea continua
  jsr                   SetPattern  

  lea                   \2,a0
   move.w                VERTEX_LIST_2D_1,d0                                                     ; x1
  move.w                VERTEX_LIST_2D_1+2,d1       
  move.w                VERTEX_LIST_2D_2,d2                                                    ; x1
  move.w                VERTEX_LIST_2D_2+2,d3
  jsr DrawlineOr

  lea                   \2,a0
   move.w                VERTEX_LIST_2D_1,d0                                                     ; x1
  move.w                VERTEX_LIST_2D_1+2,d1       
  move.w                VERTEX_LIST_2D_3,d2                                                     ; x1
  move.w                VERTEX_LIST_2D_3+2,d3
  jsr DrawlineOr

  lea                   \2,a0
  move.w                VERTEX_LIST_2D_2,d0                                                     ; x1
  move.w                VERTEX_LIST_2D_2+2,d1       
  move.w                VERTEX_LIST_2D_3,d2                                                     ; x1
  move.w                VERTEX_LIST_2D_3+2,d3
  jsr DrawlineOr

  jsr                   Fill_From_A_to_B_Clear

  ENDM
_blitfillline_test9:
  move.l                d2,-(sp)
  CLEARFASTBITPLANES

  VERTEX2D_INIT 1,#8,#1
  VERTEX2D_INIT 2,#16,#1
  VERTEX2D_INIT 3,#8,#255
         
  lea                   $dff000,a5
  jsr                   InitLine                                                   ; inizializza line-mode

  move.w                #$ffff,d0                                                  ; linea continua
  jsr                   SetPattern                                                 ; definisce pattern

  MOVE.W                #%1000001111000000,$96(a5)

  BLITTRIANGLE SCREEN_0,SCREEN_1

  WAITBLITTER
  bsr.w                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                (sp)+,d2
  ;movem.l        (sp)+,d2/a4
  rts
