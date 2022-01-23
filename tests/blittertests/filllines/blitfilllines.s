  XDEF                  _blitfillline_test1
  XDEF                  _blitfillline_test2
  XDEF                  _blitfillline_test3
  XDEF                  _blitfillline_test4
  XDEF                  _blitfillline_test5
  XDEF                  _blitfillline_test6
  XDEF                  _blitfillline_test7
  XDEF                  _blitfillline_test8
  XDEF                  _blitfillline_test9
  XDEF                  _blitfillline_test10
  XDEF                  _blitfillline_test11
  XDEF                  _blitfillline_test12
  XDEF                  _blitfillline_test13
  XDEF                  _blitfillline_test14
  XDEF                  _blitfillline_test15
  XDEF                  _blitfillline_test16
  XDEF                  _blitfillline_test17
  XDEF                  _blitfillline_test18
  XDEF                  _blitfillline_test19
  XDEF                  _blitfillline_test20
  XDEF                  _blitfillline_test21
  XDEF                  _blitfillline_test22
  XDEF                  _blitfillline_test23
  XDEF                  _blitfillline_test24
  XDEF                  _blitfillline_test25
  XDEF                  _blitfillline_test26
  XDEF                  _blitfillline_test27

  include               "../../../libs/rasterizers/processing_bitplanes_fast.s"
  include               "../../../libs/rasterizers/globaloptions.s"
  include               "../../../libs/ammxmacros.i"
  include               "../../../libs/matrix/matrix.s"
  include               "../../../libs/rasterizers/point.s"
  include               "../../../libs/trigtables.i"
  include               "../../../libs/rasterizers/processing_table_plotrefs.s"
  include               "../../../libs/rasterizers/processingclearfunctions.s"
  ;include               "../../../libs/rasterizers/clipping.s"
  include               "../../../libs/blitter/offbitplanemem.i"
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

	
  jsr                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
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

  jsr                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
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

  jsr                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
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

  jsr                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
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
  jsr                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
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
  jsr                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
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
  jsr                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
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
  jsr                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                (sp)+,d2
  rts

_blitfillline_test9:
  move.l                d2,-(sp)
  CLEARFASTBITPLANES

  VERTEX2D_INIT 1,#8,#1
  VERTEX2D_INIT 2,#16,#1
  VERTEX2D_INIT 3,#8,#255
         
  MOVE.W                #%1000001111000000,$dff096

  STROKE #2
  FILL #2
  lea OFFBITPLANEMEM,a4
  jsr BLITTRIANGLE

  WAITBLITTER
  jsr                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                (sp)+,d2
  rts


_blitfillline_test10:
  move.l                d2,-(sp)
  CLEARFASTBITPLANES

  VERTEX2D_INIT 1,#8,#255
  VERTEX2D_INIT 2,#16,#1
  VERTEX2D_INIT 3,#8,#1
         
  MOVE.W                #%1000001111000000,$dff096

  STROKE #2
  FILL #2
  lea OFFBITPLANEMEM,a4
  jsr BLITTRIANGLE

  WAITBLITTER
  jsr                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                (sp)+,d2
  rts


_blitfillline_test11:
  move.l                d2,-(sp)
  CLEARFASTBITPLANES

  VERTEX2D_INIT 1,#16,#1
  VERTEX2D_INIT 2,#8,#255
  VERTEX2D_INIT 3,#8,#1
         
  MOVE.W                #%1000001111000000,$dff096

  STROKE #2
  FILL #2
  lea OFFBITPLANEMEM,a4
  jsr BLITTRIANGLE

  WAITBLITTER
  jsr                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                (sp)+,d2
  rts

_blitfillline_test12:
  move.l                d2,-(sp)
  CLEARFASTBITPLANES

  VERTEX2D_INIT 1,#0,#0
  VERTEX2D_INIT 2,#160,#255
  VERTEX2D_INIT 3,#319,#0
         
  MOVE.W                #%1000001111000000,$dff096

  STROKE #2
  FILL #2
  lea OFFBITPLANEMEM,a4
  jsr BLITTRIANGLE

  WAITBLITTER
  jsr                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                (sp)+,d2
  rts

_blitfillline_test13:
  move.l                d2,-(sp)
  CLEARFASTBITPLANES

  VERTEX2D_INIT 1,#160,#128-10
  VERTEX2D_INIT 2,#160,#128+10
  VERTEX2D_INIT 3,#160,#128
         
  MOVE.W                #%1000001111000000,$dff096

  STROKE #2
  FILL #2
  lea OFFBITPLANEMEM,a4
  jsr BLITTRIANGLE

  WAITBLITTER
  jsr                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                (sp)+,d2
  rts

_blitfillline_test14:
  move.l                d2,-(sp)
  CLEARFASTBITPLANES

  VERTEX2D_INIT 1,#160,#128-10
  VERTEX2D_INIT 2,#160,#128+10
  VERTEX2D_INIT 3,#160,#128
         
  MOVE.W                #%1000001111000000,$dff096

  STROKE #1
  FILL #1
  lea OFFBITPLANEMEM,a4
  jsr BLITTRIANGLE

  WAITBLITTER
  jsr                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                (sp)+,d2
  rts

_blitfillline_test15:
  move.l                d2,-(sp)
  CLEARFASTBITPLANES

  VERTEX2D_INIT 1,#160,#128-10
  VERTEX2D_INIT 2,#160,#128+10
  VERTEX2D_INIT 3,#160,#128
         
  MOVE.W                #%1000001111000000,$dff096

  STROKE #3
  FILL #3
  lea OFFBITPLANEMEM,a4
  jsr BLITTRIANGLE

  WAITBLITTER
  jsr                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                (sp)+,d2
  rts

_blitfillline_test16:
  move.l                d2,-(sp)
  CLEARFASTBITPLANES

  VERTEX2D_INIT 1,#160-10,#128
  VERTEX2D_INIT 2,#160+10,#128
  VERTEX2D_INIT 3,#160,#128
         
  MOVE.W                #%1000001111000000,$dff096

  STROKE #3
  FILL #3
  lea OFFBITPLANEMEM,a4
  jsr BLITTRIANGLE

  WAITBLITTER
  jsr                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                (sp)+,d2
  rts

_blitfillline_test17:
  move.l                d2,-(sp)
  CLEARFASTBITPLANES

  VERTEX2D_INIT 1,#160,#0
  VERTEX2D_INIT 2,#0,#255
  VERTEX2D_INIT 3,#319,#255
         
  MOVE.W                #%1000001111000000,$dff096

  STROKE #1
  FILL #1
  lea OFFBITPLANEMEM,a4
  jsr BLITTRIANGLE

  VERTEX2D_INIT 1,#160,#255
  VERTEX2D_INIT 2,#0,#0
  VERTEX2D_INIT 3,#319,#0
         

  STROKE #2
  FILL #2
  lea OFFBITPLANEMEM,a4
  jsr BLITTRIANGLE

  WAITBLITTER
  jsr                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                (sp)+,d2
  rts

_blitfillline_test18:
  move.l                d2,-(sp)
  CLEARFASTBITPLANES
         
  MOVE.W                #%1000001111000000,$dff096

  VERTEX2D_INIT 1,#0,#126
  VERTEX2D_INIT 2,#319,#128
  VERTEX2D_INIT 3,#0,#130

  STROKE #1
  FILL #1
  lea OFFBITPLANEMEM,a4
  jsr BLITTRIANGLE

  WAITBLITTER
  jsr                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                (sp)+,d2
  rts

_blitfillline_test19:
  move.l                d2,-(sp)
  CLEARFASTBITPLANES
         
  MOVE.W                #%1000001111000000,$dff096

  VERTEX2D_INIT 1,#319,#126
  VERTEX2D_INIT 2,#0,#128
  VERTEX2D_INIT 3,#319,#130

  STROKE #1
  FILL #1
  lea OFFBITPLANEMEM,a4
  jsr BLITTRIANGLE

  WAITBLITTER
  jsr                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                (sp)+,d2
  rts

  _blitfillline_test20:
  move.l                d2,-(sp)
  CLEARFASTBITPLANES
         
  MOVE.W                #%1000001111000000,$dff096

  VERTEX2D_INIT 1,#150,#126
  VERTEX2D_INIT 2,#160,#128
  VERTEX2D_INIT 3,#150,#130

  STROKE #3
  FILL #3
  lea OFFBITPLANEMEM,a4
  jsr BLITTRIANGLE

  WAITBLITTER
  jsr                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                (sp)+,d2
  rts

_blitfillline_test21:
  move.l                d2,-(sp)
  CLEARFASTBITPLANES
         
  MOVE.W                #%1000001111000000,$dff096

  VERTEX2D_INIT 1,#150,#126
  VERTEX2D_INIT 2,#160,#128
  VERTEX2D_INIT 3,#150,#130

  STROKE #1
  FILL #1
  lea OFFBITPLANEMEM,a4
  jsr BLITTRIANGLE

  VERTEX2D_INIT 1,#150,#200
  VERTEX2D_INIT 2,#160,#100
  VERTEX2D_INIT 3,#170,#199

  STROKE #2
  FILL #2
  lea OFFBITPLANEMEM,a4
  jsr BLITTRIANGLE

  WAITBLITTER
  jsr                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                (sp)+,d2
  rts

_blitfillline_test22:
  move.l                d2,-(sp)
  CLEARFASTBITPLANES
         
  MOVE.W                #%1000001111000000,$dff096

  VERTEX2D_INIT 1,#104,#224
  VERTEX2D_INIT 2,#200,#128
  VERTEX2D_INIT 3,#15,#13

  STROKE #1
  FILL #1
  lea OFFBITPLANEMEM,a4
  jsr BLITTRIANGLE

  VERTEX2D_INIT 1,#224,#104
  VERTEX2D_INIT 2,#128,#200
  VERTEX2D_INIT 3,#13,#15

  STROKE #2
  FILL #2
  lea OFFBITPLANEMEM,a4
  jsr BLITTRIANGLE

  WAITBLITTER
  jsr                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                (sp)+,d2
  rts

_blitfillline_test23:
  move.l                d2,-(sp)
  CLEARFASTBITPLANES
         
  MOVE.W                #%1000001111000000,$dff096

  VERTEX2D_INIT 1,#224,#104
  VERTEX2D_INIT 2,#128,#200
  VERTEX2D_INIT 3,#160,#4

  STROKE #1
  FILL #1
  lea OFFBITPLANEMEM,a4
  jsr BLITTRIANGLE

  WAITBLITTER
  jsr                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                (sp)+,d2
  rts

_blitfillline_test24:
  move.l                d2,-(sp)
  CLEARFASTBITPLANES
         
  MOVE.W                #%1000001111000000,$dff096

  VERTEX2D_INIT 1,#160,#4
  VERTEX2D_INIT 2,#128,#200
  VERTEX2D_INIT 3,#224,#104

  STROKE #1
  FILL #1
  lea OFFBITPLANEMEM,a4
  jsr BLITTRIANGLE

  WAITBLITTER
  jsr                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                (sp)+,d2
  rts

_blitfillline_test25:
  move.l                d2,-(sp)
  CLEARFASTBITPLANES
         
  MOVE.W                #%1000001111000000,$dff096

  VERTEX2D_INIT 1,#160,#4
  VERTEX2D_INIT 2,#128,#200
  VERTEX2D_INIT 3,#224,#104

  STROKE #2
  FILL #1
  lea OFFBITPLANEMEM,a4
  jsr BLITTRIANGLE

  WAITBLITTER
  jsr                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                (sp)+,d2
  rts

_blitfillline_test26:
  move.l                d2,-(sp)
  CLEARFASTBITPLANES
         
  MOVE.W                #%1000001111000000,$dff096

  VERTEX2D_INIT 1,#160,#4
  VERTEX2D_INIT 2,#128,#200
  VERTEX2D_INIT 3,#224,#104

  STROKE #1
  FILL #2
  lea OFFBITPLANEMEM,a4
  jsr BLITTRIANGLE

  WAITBLITTER
  jsr                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                (sp)+,d2
  rts

_blitfillline_test27:
  move.l                d2,-(sp)
  CLEARFASTBITPLANES
         
  MOVE.W                #%1000001111000000,$dff096

  VERTEX2D_INIT 1,#160,#4
  VERTEX2D_INIT 2,#128,#200
  VERTEX2D_INIT 3,#224,#104

  STROKE #1
  FILL #3
  lea OFFBITPLANEMEM,a4
  jsr BLITTRIANGLE

  WAITBLITTER
  jsr                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                (sp)+,d2
  rts