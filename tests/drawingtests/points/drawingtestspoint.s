	XDEF _drawing_test1


	SECTION PROCESSING,CODE_F

	include "../../../libs/ammxmacros.i"
	include "../../../libs/matrix/matrix.s"
	include "../../../libs/trigtables.i"
	include "../../../libs/rasterizers/point.s"
	include "../../../libs/rasterizers/processing_bitplanes_fast.s"
	include "../../../libs/rasterizers/processing_table_plotrefs.s"
	include "../../../libs/rasterizers/processingclearfunctions.s"

_drawing_test1:
	
	CLEARFASTBITPLANES ; Clear fast bitplanes
	RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

	move.w #160,d0
	move.w #128,d1
	bsr.w TRANSLATE

	ROTATE #45

	POINT #-5,#-5
	POINT #-5,#5
	POINT #5,#-5
	POINT #5,#5

	bsr.w processing_bitplanes_fast_screen0 ; returns bitplanes addr in d0
	
	rts
