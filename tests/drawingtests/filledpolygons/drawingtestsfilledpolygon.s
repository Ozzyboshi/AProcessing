	XDEF _drawing_test1


	SECTION PROCESSING,CODE_F

	include "../../../libs/rasterizers/globaloptions.s"
	include "../../../libs/ammxmacros.i"
	include "../../../libs/matrix/matrix.s"
	include "../../../libs/trigtables.i"
	include "../../../libs/rasterizers/processing_bitplanes_fast.s"
	include "../../../libs/rasterizers/processing_table_plotrefs.s"
	include "../../../libs/rasterizers/processingclearfunctions.s"
	include "../../../libs/rasterizers/square.s"
	include "../../../libs/rasterizers/point.s"
	include "../../../libs/rasterizers/processingfill.s"

_drawing_test1:
	
	CLEARFASTBITPLANES ; Clear fast bitplanes
	RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6


	move.w #160,d0
	move.w #128,d1
	bsr.w TRANSLATE


	ROTATE #45



	move.w #-5,d0
	move.w #-5,d1
	move.w #10,d5

	bsr.w SQUARE ;#-5,#-5,#10

	bsr.w processing_bitplanes_fast_screen0 ; returns bitplanes addr in d0
	
	rts
