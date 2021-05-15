
	XDEF _filline_test1
	
	SECTION PROCESSING,CODE_F

	include "../../../libs/rasterizers/processing_bitplanes_fast.s"
	include "../../../libs/rasterizers/processing_table_plotrefs.s"
	include "../../../libs/rasterizers/processingfill.s"
	include "../../../libs/rasterizers/processingclearfunctions.s"
	include "../../../libs/rasterizers/globaloptions.s"

_filline_test1:
	CLEARFASTBITPLANES ; Clear fast bitplanes

	lea LINEVERTEX_START_FINAL,a1
	move.w #10,(a1)+
	move.w #10,(a1)+
	move.w #30,(a1)+
	move.w #15,(a1)+
	bsr.w ammxlinefill
    
	bsr.w processing_bitplanes_fast_screen0 ; returns bitplanes addr in d0
	rts