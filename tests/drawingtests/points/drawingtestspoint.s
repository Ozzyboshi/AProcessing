	XDEF _drawing_test1
	XDEF _drawing_test2
	XDEF _drawing_test3

	SECTION PROCESSING,CODE_F

	include "../../../libs/rasterizers/globaloptions.s"
	include "../../../libs/ammxmacros.i"
	include "../../../libs/matrix/matrixcommon.s"
	include "../../../libs/matrix/matrix.s"
	include "../../../libs/trigtables.i"
	include "../../../libs/rasterizers/point.s"
	include "../../../libs/matrix/point.s"
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

	STROKE #1

	moveq #-5,d0
	moveq #-5,d1
	jsr POINT

	moveq #-5,d0
	moveq #5,d1
	jsr POINT

	moveq #5,d0
	moveq #-5,d1
	jsr POINT

	moveq #5,d0
	moveq #5,d1
	jsr POINT

	processing_bitplanes_fast_screen0 ; returns bitplanes addr in d0
	
	rts

_drawing_test2:

	CLEARFASTBITPLANES ; Clear fast bitplanes
	RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

	move.w #160,d0
	move.w #128,d1
	bsr.w TRANSLATE

	ROTATE #45

	STROKE #2

	moveq #-5,d0
	moveq #-5,d1
	jsr POINT

	moveq #-5,d0
	moveq #5,d1
	jsr POINT

	moveq #5,d0
	moveq #-5,d1
	jsr POINT

	moveq #5,d0
	moveq #5,d1
	jsr POINT

	processing_bitplanes_fast_screen0 ; returns bitplanes addr in d0
	
	rts

_drawing_test3:

	CLEARFASTBITPLANES ; Clear fast bitplanes
	RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

	move.w #160,d0
	move.w #128,d1
	bsr.w TRANSLATE

	ROTATE #45

	STROKE #3

	moveq #-5,d0
	moveq #-5,d1
	jsr POINT

	moveq #-5,d0
	moveq #5,d1
	jsr POINT

	moveq #5,d0
	moveq #-5,d1
	jsr POINT

	moveq #5,d0
	moveq #5,d1
	jsr POINT

	processing_bitplanes_fast_screen0 ; returns bitplanes addr in d0
	
	rts

