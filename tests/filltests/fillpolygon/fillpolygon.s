
	XDEF _fillpolygon_test1
	XDEF _fillpolygon_test2
	XDEF _fillpolygon_test3
	XDEF _fillpolygon_test4

	
	SECTION PROCESSING,CODE_F

	include "../../../libs/rasterizers/processing_bitplanes_fast.s"
	include "../../../libs/rasterizers/processing_table_plotrefs.s"
	include "../../../libs/rasterizers/processingfill.s"
	include "../../../libs/rasterizers/processingclearfunctions.s"
	include "../../../libs/rasterizers/globaloptions.s"

_fillpolygon_test1:
	RESETFILLTABLE
	lea LINEVERTEX_START_FINAL,a1
	move.w #16,(a1)+
	move.w #2,(a1)+
	move.w #8,(a1)+
	move.w #26,(a1)+
	bsr.w ammxlinefill

	;lea LINEVERTEX_START_FINAL,a1
	;move.w #8,(a1)+
	;move.w #16,(a1)+
	;move.w #28,(a1)+
	;move.w #16,(a1)+
	;bsr.w ammxlinefill

	lea LINEVERTEX_START_FINAL,a1
	move.w #16,(a1)+
	move.w #2,(a1)+
	move.w #28,(a1)+
	move.w #26,(a1)+
	bsr.w ammxlinefill

	move.w #2,AMMXFILLTABLE_CURRENT_ROW
	move.w #26,AMMXFILLTABLE_END_ROW ; I want to fill up to first row (first row is elaborated)

	CLEARFASTBITPLANES ; Clear fast bitplanes
	bsr.w ammx_fill_table
	bsr.w processing_bitplanes_fast_screen0 ; returns bitplanes addr in d0

	rts


_fillpolygon_test2:
	RESETFILLTABLE
	

	lea LINEVERTEX_START_FINAL,a1
	move.w #10,(a1)+
	move.w #10,(a1)+
	move.w #10,(a1)+
	move.w #20,(a1)+
	bsr.w ammxlinefill

	lea LINEVERTEX_START_FINAL,a1
	move.w #20,(a1)+
	move.w #10,(a1)+
	move.w #20,(a1)+
	move.w #20,(a1)+
	bsr.w ammxlinefill

	move.w #10,AMMXFILLTABLE_CURRENT_ROW
	move.w #20,AMMXFILLTABLE_END_ROW ; I want to fill up to first row (first row is elaborated)

	CLEARFASTBITPLANES ; Clear fast bitplanes

	bsr.w ammx_fill_table
	bsr.w processing_bitplanes_fast_screen0 ; returns bitplanes addr in d0
	rts

_fillpolygon_test3:
	RESETFILLTABLE
	

	lea LINEVERTEX_START_FINAL,a1
	move.w #20,(a1)+
	move.w #20,(a1)+
	move.w #20,(a1)+
	move.w #40,(a1)+
	bsr.w ammxlinefill

	lea LINEVERTEX_START_FINAL,a1
	move.w #20,(a1)+
	move.w #20,(a1)+
	move.w #57,(a1)+
	move.w #40,(a1)+
	bsr.w ammxlinefill

	move.w #20,AMMXFILLTABLE_CURRENT_ROW
	move.w #40,AMMXFILLTABLE_END_ROW ; I want to fill up to first row (first row is elaborated)

	CLEARFASTBITPLANES ; Clear fast bitplanes

	bsr.w ammx_fill_table
	bsr.w processing_bitplanes_fast_screen0 ; returns bitplanes addr in d0
	rts

_fillpolygon_test4:
	RESETFILLTABLE
	

	lea LINEVERTEX_START_FINAL,a1
	move.w #20,(a1)+
	move.w #20,(a1)+
	move.w #20,(a1)+
	move.w #40,(a1)+
	bsr.w ammxlinefill

	lea LINEVERTEX_START_FINAL,a1
	move.w #20,(a1)+
	move.w #40,(a1)+
	move.w #57,(a1)+
	move.w #20,(a1)+
	bsr.w ammxlinefill

	move.w #20,AMMXFILLTABLE_CURRENT_ROW
	move.w #40,AMMXFILLTABLE_END_ROW ; I want to fill up to first row (first row is elaborated)

	CLEARFASTBITPLANES ; Clear fast bitplanes

	bsr.w ammx_fill_table
	bsr.w processing_bitplanes_fast_screen0 ; returns bitplanes addr in d0
	rts