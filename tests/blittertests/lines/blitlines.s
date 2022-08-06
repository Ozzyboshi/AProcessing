  XDEF                  _blitline_test1
  XDEF                  _blitline_test2
  XDEF                  _blitline_test3
  XDEF                  _blitline_test4
  XDEF                  _blitline_test5

  include               "../../../libs/rasterizers/processing_bitplanes_fast.s"
  include               "../../../libs/rasterizers/globaloptions.s"
  include               "../../../libs/ammxmacros.i"
  include               "../../../libs/rasterizers/processingfill.s"
  include               "../../../libs/matrix/matrixcommon.s"
  include               "../../../libs/matrix/matrix.s"
  include               "../../../libs/trigtables.i"
  include               "../../../libs/rasterizers/processing_table_plotrefs.s"
  include               "../../../libs/rasterizers/processingclearfunctions.s"
  include               "../../../libs/rasterizers/clipping.s"
  include               "../../../libs/blitter/lines.s"
  include               "../../../libs/blitter/offbitplanemem.i"

_blitline_test1:
  move.l                d2,-(sp)
  CLEARFASTBITPLANES 
         
  lea                   $dff000,a5

  jsr                   InitLine                                                   ; inizializza line-mode

  move.w                #$ffff,d0                                                  ; linea continua
  SETPATTERN                                                ; definisce pattern

  move.w                #0,d0                                                      ; x1
  move.w                #0,d1                                                      ; y1
  move.w                #10,d2                                                     ; x2
  move.w                #0,d3                                                      ; y2
  lea                   SCREEN_0,a0
  MOVE.W                #%1000001111000000,$96(a5)
  jsr                   Drawline
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                (sp)+,d2
  rts

_blitline_test2:
  move.l                d2,-(sp)
  CLEARFASTBITPLANES

  lea                   $dff000,a6
  jsr                   DL_Init

  lea                   SCREEN_0,a0


  move.w                #0,d0                                                      ; x1
  move.w                #0,d1                                                      ; y1
  move.w                #9,d2                                                      ; x2
  move.w                #0,d3       
  move.w                #40,d4
  
  ;	A0 = PlanePtr, A6 = $DFF002, D0/D1 = X0/Y0, D2/D3 = X1/Y1
  ;	D4 = PlaneWidth > Kills: D0-D4/A0-A1 (+D5 in Fill Mode)       
  lea                   $dff002,a6
  jsr                   DrawLine2
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0

  move.l                (sp)+,d2
  rts

_blitline_test3:
  move.l                d2,-(sp)
  CLEARFASTBITPLANES 
         
  lea                   $dff000,a5

  jsr                   InitLine                                                   ; inizializza line-mode

  move.w                #$ffff,d0                                                  ; linea continua
  SETPATTERN                                                 ; definisce pattern

  move.w                #0,d0                                                      ; x1
  move.w                #0,d1                                                      ; y1
  move.w                #0,d2                                                     ; x2
  move.w                #10,d3                                                      ; y2
  lea                   SCREEN_0,a0
  MOVE.W                #%1000001111000000,$96(a5)
  jsr                   Drawline
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                (sp)+,d2
  rts

_blitline_test4:
  move.l                d2,-(sp)
  CLEARFASTBITPLANES

  lea                   $dff000,a6
  jsr                   DL_Init

  lea                   SCREEN_0,a0


  move.w                #0,d0                                                      ; x1
  move.w                #0,d1                                                      ; y1
  move.w                #0,d2                                                      ; x2
  move.w                #10,d3       
  move.w                #40,d4
  ;	A0 = PlanePtr, A6 = $DFF002, D0/D1 = X0/Y0, D2/D3 = X1/Y1
  ;	D4 = PlaneWidth > Kills: D0-D4/A0-A1 (+D5 in Fill Mode)
         
  lea                   $dff002,a6
  jsr                   DrawLine2
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0

  move.l                (sp)+,d2
  rts

_blitline_test5:
  move.l                d2,-(sp)
  CLEARFASTBITPLANES 
         
  move.w                #11,d0                                                      ; x1
  move.w                #0,d1                                                      ; y1
  move.w                #0,d2                                                     ; x2
  move.w                #0,d3                                                      ; y2
  lea                   SCREEN_0,a0
  MOVE.W                #%1000001111000000,$96(a5)
  jsr                   DrawLine3
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                (sp)+,d2
  rts