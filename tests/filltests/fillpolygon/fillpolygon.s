
  XDEF                  _fillpolygon_test1
  XDEF                  _fillpolygon_test2
  XDEF                  _fillpolygon_test3
  XDEF                  _fillpolygon_test4
  XDEF                  _fillpolygon_test5

	
  SECTION               PROCESSING,CODE_F

  include               "../../../libs/ammxmacros.i"
  include               "../../../libs/rasterizers/processing_bitplanes_fast.s"
  include               "../../../libs/rasterizers/processing_table_plotrefs.s"
  include               "../../../libs/rasterizers/processingfill.s"
  include               "../../../libs/rasterizers/processingclearfunctions.s"
  include               "../../../libs/rasterizers/globaloptions.s"

_fillpolygon_test1:
  RESETFILLTABLE
  lea                   LINEVERTEX_START_FINAL,a1
  move.w                #16,(a1)+
  move.w                #2,(a1)+
  move.w                #8,(a1)+
  move.w                #26,(a1)+
  bsr.w                 ammxlinefill

	;lea LINEVERTEX_START_FINAL,a1
	;move.w #8,(a1)+
	;move.w #16,(a1)+
	;move.w #28,(a1)+
	;move.w #16,(a1)+
	;bsr.w ammxlinefill

  lea                   LINEVERTEX_START_FINAL,a1
  move.w                #16,(a1)+
  move.w                #2,(a1)+
  move.w                #28,(a1)+
  move.w                #26,(a1)+
  bsr.w                 ammxlinefill

  move.w                #2,AMMXFILLTABLE_CURRENT_ROW
  move.w                #26,AMMXFILLTABLE_END_ROW                                  ; I want to fill up to first row (first row is elaborated)

  CLEARFASTBITPLANES                                                               ; Clear fast bitplanes
  bsr.w                 ammx_fill_table
  bsr.w                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0

  rts


_fillpolygon_test2:
  RESETFILLTABLE
	

  lea                   LINEVERTEX_START_FINAL,a1
  move.w                #10,(a1)+
  move.w                #10,(a1)+
  move.w                #10,(a1)+
  move.w                #20,(a1)+
  bsr.w                 ammxlinefill

  lea                   LINEVERTEX_START_FINAL,a1
  move.w                #20,(a1)+
  move.w                #10,(a1)+
  move.w                #20,(a1)+
  move.w                #20,(a1)+
  bsr.w                 ammxlinefill

  move.w                #10,AMMXFILLTABLE_CURRENT_ROW
  move.w                #20,AMMXFILLTABLE_END_ROW                                  ; I want to fill up to first row (first row is elaborated)

  CLEARFASTBITPLANES                                                               ; Clear fast bitplanes

  bsr.w                 ammx_fill_table
  bsr.w                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  rts

_fillpolygon_test3:
  RESETFILLTABLE
	

  lea                   LINEVERTEX_START_FINAL,a1
  move.w                #20,(a1)+
  move.w                #20,(a1)+
  move.w                #20,(a1)+
  move.w                #40,(a1)+
  bsr.w                 ammxlinefill

  lea                   LINEVERTEX_START_FINAL,a1
  move.w                #20,(a1)+
  move.w                #20,(a1)+
  move.w                #57,(a1)+
  move.w                #40,(a1)+
  bsr.w                 ammxlinefill

  move.w                #20,AMMXFILLTABLE_CURRENT_ROW
  move.w                #40,AMMXFILLTABLE_END_ROW                                  ; I want to fill up to first row (first row is elaborated)

  CLEARFASTBITPLANES                                                               ; Clear fast bitplanes

  bsr.w                 ammx_fill_table
  bsr.w                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  rts

_fillpolygon_test4:
  RESETFILLTABLE
	

  lea                   LINEVERTEX_START_FINAL,a1
  move.w                #20,(a1)+
  move.w                #20,(a1)+
  move.w                #20,(a1)+
  move.w                #40,(a1)+
  bsr.w                 ammxlinefill

  lea                   LINEVERTEX_START_FINAL,a1
  move.w                #20,(a1)+
  move.w                #40,(a1)+
  move.w                #57,(a1)+
  move.w                #20,(a1)+
  bsr.w                 ammxlinefill

  move.w                #20,AMMXFILLTABLE_CURRENT_ROW
  move.w                #40,AMMXFILLTABLE_END_ROW                                  ; I want to fill up to first row (first row is elaborated)

  CLEARFASTBITPLANES                                                               ; Clear fast bitplanes

  bsr.w                 ammx_fill_table
  bsr.w                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  rts

_fillpolygon_test5:
  RESETFILLTABLE
	

  lea                   LINEVERTEX_START_FINAL,a1
  move.w                #100,(a1)+
  move.w                #255-155,(a1)+
  move.w                #125,(a1)+
  move.w                #255-152,(a1)+
  bsr.w                 ammxlinefill

  lea                   LINEVERTEX_START_FINAL,a1
  move.w                #126,(a1)+
  move.w                #255-151,(a1)+
  move.w                #132,(a1)+
  move.w                #255-118,(a1)+
  bsr.w                 ammxlinefill

  lea                   LINEVERTEX_START_FINAL,a1
  move.w                #132,(a1)+
  move.w                #255-118,(a1)+
  move.w                #114,(a1)+
  move.w                #255-110,(a1)+
  bsr.w                 ammxlinefill

  lea                   LINEVERTEX_START_FINAL,a1
  move.w                #114,(a1)+
  move.w                #255-110,(a1)+
  move.w                #100,(a1)+
  move.w                #255-155,(a1)+
  bsr.w                 ammxlinefill

  move.w                #100,AMMXFILLTABLE_CURRENT_ROW
  move.w                #255-110,AMMXFILLTABLE_END_ROW                             ; I want to fill up to first row (first row is elaborated)

  CLEARFASTBITPLANES                                                               ; Clear fast bitplanes

  bsr.w                 ammx_fill_table
  bsr.w                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  rts