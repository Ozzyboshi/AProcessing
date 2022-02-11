
  XDEF                  _fillscanline_test1
  XDEF                  _fillscanline_test2
  XDEF                  _fillscanline_test3
  XDEF                  _fillscanline_test4
  XDEF                  _fillscanline_test5
  XDEF                  _fillscanline_test6
  XDEF                  _fillscanline_test7
  XDEF                  _fillscanline_test8
  XDEF                  _fillscanline_test9
  XDEF                  _fillscanline_test10
  XDEF                  _fillscanline_test11
  XDEF                  _fillscanline_test12
  XDEF                  _fillscanline_test13
  XDEF                  _fillscanline_test14
  XDEF                  _fillscanline_test15
  XDEF                  _fillscanline_test16

  SECTION               PROCESSING,CODE_F

  include               "../../../libs/ammxmacros.i"
  include               "../../../libs/rasterizers/globaloptions.s"
  include               "../../../libs/rasterizers/processing_bitplanes_fast.s"
  include               "../../../libs/rasterizers/processing_table_plotrefs.s"
  include               "../../../libs/rasterizers/processingfill.s"
  include               "../../../libs/rasterizers/clipping.s"

  include               "../../../libs/rasterizers/processingclearfunctions.s"

_fillscanline_test1:
  CLEARFASTBITPLANES                                                               ; Clear fast bitplanes

  move.w                #0,AMMXFILLTABLE_CURRENT_ROW
  move.w                #0,AMMXFILLTABLE_END_ROW                                   ; I want to fill up to first row (first row is elaborated)

  lea                   FILL_TABLE,a1

	; Fill from pixel number 15 up to 102
  move.w                #15,(a1)+
  move.w                #102,(a1)+
  bsr.w                 ammx_fill_table
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  rts

_fillscanline_test2:
  CLEARFASTBITPLANES                                                               ; Clear fast bitplanes

	; Fill from pixel number 1 up to 2
  lea                   FILL_TABLE,a1
  move.w                #0,AMMXFILLTABLE_CURRENT_ROW                               ; I want to fill row 0 (first row)
  move.w                #0,AMMXFILLTABLE_END_ROW                                   ; I want to fill up to first row (first row is elaborated)

  move.w                #1,(a1)+
  move.w                #2,(a1)+
  bsr.w                 ammx_fill_table
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  rts

_fillscanline_test3:
  CLEARFASTBITPLANES                                                               ; Clear fast bitplanes

  move.w                #1,AMMXFILLTABLE_CURRENT_ROW                               ; I want to fill row 1 (second row)
  move.w                #1,AMMXFILLTABLE_END_ROW                                   ; I want to fill up to second row (second row is elaborated)

	; Fill from pixel number 1 up to 2
  lea                   FILL_TABLE+4,a1

  move.w                #1,(a1)+
  move.w                #2,(a1)+
  bsr.w                 ammx_fill_table
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  rts

_fillscanline_test4:
  CLEARFASTBITPLANES                                                               ; Clear fast bitplanes

  move.w                #0,AMMXFILLTABLE_CURRENT_ROW                               ; I want to fill row 0 (first row)
  move.w                #0,AMMXFILLTABLE_END_ROW                                   ; I want to fill up to first row (first row is elaborated)

	; Fill first line
  lea                   FILL_TABLE,a1
  move.w                #0,(a1)+
  move.w                #319,(a1)+
  bsr.w                 ammx_fill_table
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  rts

_fillscanline_test5:
  CLEARFASTBITPLANES                                                               ; Clear fast bitplanes

  move.w                #0,AMMXFILLTABLE_CURRENT_ROW                               ; I want to fill row 0 (first row)
  move.w                #1,AMMXFILLTABLE_END_ROW                                   ; I want to fill up to second row (second row is elaborated)

	; Fill first and second line
  lea                   FILL_TABLE,a1
  move.w                #0,(a1)+
  move.w                #319,(a1)+
  move.w                #0,(a1)+
  move.w                #319,(a1)+
  bsr.w                 ammx_fill_table
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  rts

_fillscanline_test6:
  CLEARFASTBITPLANES                                                               ; Clear fast bitplanes

  move.w                #0,AMMXFILLTABLE_CURRENT_ROW                               ; I want to fill row 1 (second row)
  move.w                #0,AMMXFILLTABLE_END_ROW                                   ; I want to fill up to second row (second row is elaborated)

	; Fill first bit
  lea                   FILL_TABLE,a1
  move.w                #0,(a1)+
  move.w                #0,(a1)+
  move.w                #0,(a1)+
  move.w                #0,(a1)+
  bsr.w                 ammx_fill_table
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  rts

_fillscanline_test7:
  CLEARFASTBITPLANES                                                               ; Clear fast bitplanes

	; Fill from pixel number 1 up to 2
  lea                   FILL_TABLE,a1
  move.w                #0,AMMXFILLTABLE_CURRENT_ROW                               ; I want to fill row 0 (first row)
  move.w                #0,AMMXFILLTABLE_END_ROW                                   ; I want to fill up to first row (first row is elaborated)

  move.w                #1,(a1)+
  move.w                #2,(a1)+
  STROKE                #3
  bsr.w                 ammx_fill_table
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  rts

_fillscanline_test8:
  CLEARFASTBITPLANES                                                               ; Clear fast bitplanes

	; Fill from pixel number 1 up to 2
  lea                   FILL_TABLE,a1
  move.w                #0,AMMXFILLTABLE_CURRENT_ROW                               ; I want to fill row 0 (first row)
  move.w                #0,AMMXFILLTABLE_END_ROW                                   ; I want to fill up to first row (first row is elaborated)

  move.w                #3,(a1)+
  move.w                #7,(a1)+
  STROKE                #3
  bsr.w                 ammx_fill_table
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  rts

_fillscanline_test9:
  CLEARFASTBITPLANES                                                               ; Clear fast bitplanes

  move.w                #0,AMMXFILLTABLE_CURRENT_ROW                               ; I want to fill row 0 (first row)
  move.w                #0,AMMXFILLTABLE_END_ROW                                   ; I want to fill up to first row (first row is elaborated)

	; Fill first line
  lea                   FILL_TABLE,a1
  move.w                #0,(a1)+
  move.w                #319,(a1)+
  STROKE                #3
  bsr.w                 ammx_fill_table
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  rts

_fillscanline_test10:
  CLEARFASTBITPLANES                                                               ; Clear fast bitplanes

  move.w                #2,AMMXFILLTABLE_CURRENT_ROW                               ; I want to fill row 0 (first row)
  move.w                #3,AMMXFILLTABLE_END_ROW                                   ; I want to fill up to first row (first row is elaborated)

	; Fill first line
  lea                   FILL_TABLE+4*2,a1                                          ; START FROM ROW 2 (third)
  move.w                #8,(a1)+
  move.w                #16,(a1)+
  move.w                #8,(a1)+
  move.w                #16,(a1)+
  STROKE                #3
  bsr.w                 ammx_fill_table
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  rts

_fillscanline_test11:
  CLEARFASTBITPLANES                                                               ; Clear fast bitplanes

  move.w                #0,AMMXFILLTABLE_CURRENT_ROW                               ; I want to fill row 0 (first row)
  move.w                #0,AMMXFILLTABLE_END_ROW                                   ; I want to fill up to first row (first row is elaborated)

	; Fill first line
  lea                   FILL_TABLE,a1                                              ; START FROM ROW 2 (third)
  move.w                #8,(a1)+
  move.w                #31,(a1)+

  STROKE                #3
  bsr.w                 ammx_fill_table
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  rts

_fillscanline_test12:
  CLEARFASTBITPLANES                                                               ; Clear fast bitplanes

  move.w                #2,AMMXFILLTABLE_CURRENT_ROW                               ; I want to fill row 0 (first row)
  move.w                #3,AMMXFILLTABLE_END_ROW                                   ; I want to fill up to first row (first row is elaborated)

	; Fill first line
  lea                   FILL_TABLE+4*2,a1                                          ; START FROM ROW 2 (third)
  move.w                #8,(a1)+
  move.w                #31,(a1)+
  move.w                #8,(a1)+
  move.w                #31,(a1)+
  STROKE                #2
  bsr.w                 ammx_fill_table
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  rts

_fillscanline_test13:
  CLEARFASTBITPLANES                                                               ; Clear fast bitplanes

  move.w                #0,AMMXFILLTABLE_CURRENT_ROW                               ; I want to fill row 0 (first row)
  move.w                #0,AMMXFILLTABLE_END_ROW                                   ; I want to fill up to first row (first row is elaborated)

	; Fill first line
  lea                   FILL_TABLE,a1                                              ; START FROM ROW 2 (third)
  move.w                #0,(a1)+
  move.w                #6,(a1)+
  STROKE                #2
  bsr.w                 ammx_fill_table
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  rts

_fillscanline_test14:
  CLEARFASTBITPLANES
  ENABLE_CLIPPING                                                                  ; Clear fast bitplanes

  move.w                #0,AMMXFILLTABLE_CURRENT_ROW                               ; I want to fill row 0 (first row)
  move.w                #0,AMMXFILLTABLE_END_ROW                                   ; I want to fill up to first row (first row is elaborated)

	; Fill first line
  lea                   FILL_TABLE,a1                                              ; START FROM ROW 2 (third)
  move.w                #$0000,(a1)+
  move.w                #$FFC7,(a1)+
  STROKE                #1
  ;bsr.w                 ammx_fill_table_clip
  move.l                AMMX_FILL_FUNCT_ADDR,a0
  jsr                   (a0)
  DISABLE_CLIPPING
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  rts

_fillscanline_test15:
  CLEARFASTBITPLANES                                                               ; Clear fast bitplanes

  move.w                #0,AMMXFILLTABLE_CURRENT_ROW
  move.w                #0,AMMXFILLTABLE_END_ROW 
  STROKE                #1
                                  ; I want to fill up to first row (first row is elaborated)

  lea                   FILL_TABLE,a1

	; Fill from pixel number 15 up to 102
  move.w                #15,(a1)+
  move.w                #102,(a1)+
  bsr.w                 ammx_fill_table_noreset
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  rts

_fillscanline_test16:
  CLEARFASTBITPLANES                                                               ; Clear fast bitplanes

  move.w                #0,AMMXFILLTABLE_CURRENT_ROW
  move.w                #0,AMMXFILLTABLE_END_ROW                                   ; I want to fill up to first row (first row is elaborated)

  lea                   FILL_TABLE,a1

	; Fill from pixel number 15 up to 102
  move.w                #15,(a1)+
  move.w                #102,(a1)+
  STROKE #2
  bsr.w                 ammx_fill_table
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  rts