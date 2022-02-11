
  XDEF                  _fillpolygon_test1
  XDEF                  _fillpolygon_test2
  XDEF                  _fillpolygon_test3
  XDEF                  _fillpolygon_test4
  XDEF                  _fillpolygon_test5
  XDEF                  _fillpolygon_test6
  XDEF                  _fillpolygon_test7
  XDEF                  _fillpolygon_test8
  XDEF                  _fillpolygon_test9
  XDEF                  _fillpolygon_test10
  XDEF                  _fillpolygon_test11
  XDEF                  _fillpolygon_test12
  XDEF                  _fillpolygon_test13
  XDEF                  _fillpolygon_test14
  XDEF                  _fillpolygon_test15
  XDEF                  _fillpolygon_test16
  XDEF                  _fillpolygon_test17
  XDEF                  _fillpolygon_test18

  SECTION               PROCESSING,CODE_F

  include               "../../../libs/rasterizers/globaloptions.s"
  include               "../../../libs/ammxmacros.i"
  include               "../../../libs/rasterizers/processing_bitplanes_fast.s"
  include               "../../../libs/rasterizers/processing_table_plotrefs.s"
  include               "../../../libs/rasterizers/processingfill.s"
  include               "../../../libs/rasterizers/clipping.s"
  include               "../../../libs/rasterizers/processingclearfunctions.s"
  include               "../../../libs/rasterizers/line.s"

_fillpolygon_test1:
  RESETFILLTABLE
  lea                   LINEVERTEX_START_FINAL,a1
  move.w                #16,(a1)+
  move.w                #2,(a1)+
  move.w                #8,(a1)+
  move.w                #26,(a1)+
  bsr.w                 ammxlinefill

  lea                   LINEVERTEX_START_FINAL,a1
  move.w                #16,(a1)+
  move.w                #2,(a1)+
  move.w                #28,(a1)+
  move.w                #26,(a1)+
  bsr.w                 ammxlinefill

  CLEARFASTBITPLANES                                                               ; Clear fast bitplanes
  STROKE                #1
  bsr.w                 ammx_fill_table
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0

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

  ;move.w                #10,AMMXFILLTABLE_CURRENT_ROW
  ;move.w                #20,AMMXFILLTABLE_END_ROW                                   ; I want to fill up to first row (first row is elaborated)

  CLEARFASTBITPLANES                                                               ; Clear fast bitplanes

  bsr.w                 ammx_fill_table
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
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

  ;move.w                #20,AMMXFILLTABLE_CURRENT_ROW
  ;move.w                #40,AMMXFILLTABLE_END_ROW                                   ; I want to fill up to first row (first row is elaborated)

  CLEARFASTBITPLANES                                                               ; Clear fast bitplanes

  bsr.w                 ammx_fill_table
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
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

  ;move.w                #20,AMMXFILLTABLE_CURRENT_ROW
  ;move.w                #40,AMMXFILLTABLE_END_ROW                                   ; I want to fill up to first row (first row is elaborated)

  CLEARFASTBITPLANES                                                               ; Clear fast bitplanes

  bsr.w                 ammx_fill_table
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
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

  ;move.w                #100,AMMXFILLTABLE_CURRENT_ROW
  ;move.w                #255-110,AMMXFILLTABLE_END_ROW                              ; I want to fill up to first row (first row is elaborated)

  CLEARFASTBITPLANES                                                               ; Clear fast bitplanes

  bsr.w                 ammx_fill_table
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  rts

_fillpolygon_test6:
  RESETFILLTABLE
  ENABLE_CLIPPING
  lea                   LINEVERTEX_START_FINAL,a1
  move.w                #-16,(a1)+
  move.w                #0,(a1)+
  move.w                #600,(a1)+
  move.w                #0,(a1)+
  bsr.w                 ammxlinefill

  CLEARFASTBITPLANES                                                               ; Clear fast bitplanes
  bsr.w                 ammx_fill_table_clip
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  DISABLE_CLIPPING
  rts

_fillpolygon_test7:
  RESETFILLTABLE
  ENABLE_CLIPPING
  lea                   LINEVERTEX_START_FINAL,a1
  move.w                #0,(a1)+
  move.w                #-5,(a1)+
  move.w                #-5,(a1)+
  move.w                #5,(a1)+
  bsr.w                 ammxlinefill

  lea                   LINEVERTEX_START_FINAL,a1
  move.w                #-5,(a1)+
  move.w                #-5,(a1)+
  move.w                #5,(a1)+
  move.w                #5,(a1)+
  bsr.w                 ammxlinefill

  lea                   LINEVERTEX_START_FINAL,a1
  move.w                #0,(a1)+
  move.w                #-5,(a1)+
  move.w                #5,(a1)+
  move.w                #5,(a1)+
  bsr.w                 ammxlinefill

  CLEARFASTBITPLANES                                                               ; Clear fast bitplanes
  bsr.w                 ammx_fill_table_clip
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  DISABLE_CLIPPING
  rts

_fillpolygon_test8:
  RESETFILLTABLE
  ENABLE_CLIPPING

  LINE                  #-10,#-5,#-15,#5
  LINE                  #-15,#-5,#-5,#5
  LINE                  #-10,#-5,#-5,#5

  CLEARFASTBITPLANES                                                               ; Clear fast bitplanes
  bsr.w                 ammx_fill_table_clip
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  DISABLE_CLIPPING
  rts

_fillpolygon_test9:
  RESETFILLTABLE
  ENABLE_CLIPPING

  LINE                  #10,#-5,#5,#5
  LINE                  #5,#-5,#15,#5
  LINE                  #10,#-5,#15,#5

  CLEARFASTBITPLANES                                                               ; Clear fast bitplanes
  bsr.w                 ammx_fill_table_clip
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  DISABLE_CLIPPING
  rts

_fillpolygon_test10:
  RESETFILLTABLE
  ENABLE_CLIPPING

  STROKE                #3

  LINE                  #319,#255-5,#319-5,#255+5
  LINE                  #319,#255-5,#319+5,#255+5
  LINE                  #319-5,#255+5,#319+5,#255+5
  CLEARFASTBITPLANES
  bsr.w                 ammx_fill_table_clip
  processing_bitplanes_fast_screen0  

  STROKE                #1 

  DISABLE_CLIPPING
  rts

_fillpolygon_test11:
  RESETFILLTABLE
  ENABLE_CLIPPING
  CLEARFASTBITPLANES


  STROKE                #3

  LINE                  #319-5,#255+5,#319+5,#255+5
  bsr.w                 ammx_fill_table_clip
  processing_bitplanes_fast_screen0  

  STROKE                #1 

  DISABLE_CLIPPING
  rts

_fillpolygon_test12:
  RESETFILLTABLE
  ENABLE_CLIPPING
  CLEARFASTBITPLANES


  STROKE                #3

  LINE                  #319+10,#255-5,#319+5,#255+5
  LINE                  #319+10,#255-5,#319+15,#255+5
  LINE                  #319+5,#255+5,#319+15,#255+5
  bsr.w                 ammx_fill_table_clip
  processing_bitplanes_fast_screen0  

  STROKE                #1 

  DISABLE_CLIPPING
  rts


_fillpolygon_test13:
  RESETFILLTABLE
  ENABLE_CLIPPING

  STROKE                #3

  LINE                  #319,#0-5,#319-5,#0+5
  LINE                  #319,#0-5,#319+5,#0+5
  LINE                  #319-5,#0+5,#319+5,#0+5
  CLEARFASTBITPLANES
  bsr.w                 ammx_fill_table_clip
  processing_bitplanes_fast_screen0  

  STROKE                #1 

  DISABLE_CLIPPING
  rts

_fillpolygon_test14:
  RESETFILLTABLE
  ENABLE_CLIPPING

  STROKE                #3

  LINE                  #319,#0-15,#319-5,#0-5
  LINE                  #319,#0-15,#319+5,#0-5
  LINE                  #319-5,#0-5,#319+5,#0-5
  CLEARFASTBITPLANES
  bsr.w                 ammx_fill_table_clip
  processing_bitplanes_fast_screen0  

  STROKE                #1 

  DISABLE_CLIPPING
  rts

_fillpolygon_test15:
  RESETFILLTABLE
  ENABLE_CLIPPING

  STROKE                #3

  LINE                  #-10,#-10,#329,#-10
  LINE                  #-10,#265,#329,#265
  LINE                  #-10,#-10,#-10,#265
  LINE                  #329,#-10,#329,#265
  CLEARFASTBITPLANES
  bsr.w                 ammx_fill_table_clip
  processing_bitplanes_fast_screen0  

  STROKE                #1 

  DISABLE_CLIPPING
  rts

_fillpolygon_test16:
  RESETFILLTABLE
  lea                   LINEVERTEX_START_FINAL,a1
  move.w                #16,(a1)+
  move.w                #2,(a1)+
  move.w                #8,(a1)+
  move.w                #26,(a1)+
  bsr.w                 ammxlinefill

  lea                   LINEVERTEX_START_FINAL,a1
  move.w                #16,(a1)+
  move.w                #2,(a1)+
  move.w                #28,(a1)+
  move.w                #26,(a1)+
  bsr.w                 ammxlinefill

  CLEARFASTBITPLANES                                                               ; Clear fast bitplanes
  bsr.w                 ammx_fill_table_bpl1
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0

  rts

_fillpolygon_test17:
  RESETFILLTABLE
  lea                   LINEVERTEX_START_FINAL,a1
  move.w                #16,(a1)+
  move.w                #2,(a1)+
  move.w                #8,(a1)+
  move.w                #26,(a1)+
  bsr.w                 ammxlinefill

  lea                   LINEVERTEX_START_FINAL,a1
  move.w                #16,(a1)+
  move.w                #2,(a1)+
  move.w                #28,(a1)+
  move.w                #26,(a1)+
  bsr.w                 ammxlinefill

  CLEARFASTBITPLANES                                                               ; Clear fast bitplanes
  STROKE                #2
  bsr.w                 ammx_fill_table
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0

  rts

_fillpolygon_test18:
  RESETFILLTABLE
  lea                   LINEVERTEX_START_FINAL,a1
  move.w                #16,(a1)+
  move.w                #2,(a1)+
  move.w                #8,(a1)+
  move.w                #26,(a1)+
  bsr.w                 ammxlinefill

  lea                   LINEVERTEX_START_FINAL,a1
  move.w                #16,(a1)+
  move.w                #2,(a1)+
  move.w                #28,(a1)+
  move.w                #26,(a1)+
  bsr.w                 ammxlinefill

  CLEARFASTBITPLANES                                                               ; Clear fast bitplanes
  bsr.w                 ammx_fill_table_bpl2
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0

  rts
