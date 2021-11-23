  XDEF                  _blitfillline_test1
  XDEF                  _blitfillline_test2
  XDEF                  _blitfillline_test3
  XDEF                  _blitfillline_test4
  XDEF                  _blitfillline_test5
  XDEF                  _blitfillline_test6


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


