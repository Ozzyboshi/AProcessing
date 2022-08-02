	XDEF _drawing_test1
	XDEF _drawing_test2
	XDEF _drawing_test3

	SECTION PROCESSING,CODE_F

	include "../../../libs/rasterizers/globaloptions.s"
	include "../../../libs/ammxmacros.i"
	include "../../../libs/matrix/matrix.s"
	include "../../../libs/trigtables.i"
	include "../../../libs/rasterizers/point.s"
	include "../../../libs/matrix/point.s"
	include "../../../libs/rasterizers/processing_bitplanes_fast.s"
	include "../../../libs/rasterizers/processing_table_plotrefs.s"
	include "../../../libs/rasterizers/processingclearfunctions.s"

_drawing_test1:

	move.l               d2,-(sp)


	CLEARFASTBITPLANES ; Clear fast bitplanes


	moveq #0,d0
	moveq #0,d1
	STROKE #$00ABCDEF
	jsr POINT

	moveq #1,d0
	moveq #0,d1
	STROKE #$00012345
	jsr POINT

	moveq #1,d0
	moveq #1,d1
	STROKE #$0056789A
	jsr POINT

	processing_bitplanes_fast_screen0 ; returns bitplanes addr in d0
	move.l               (sp)+,d2
	rts

_drawing_test2:

	move.l               d2,-(sp)

	CLEARFASTBITPLANES ; Clear fast bitplanes
	RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

	move.w #160,d0
	move.w #128,d1
	jsr TRANSLATE

	ROTATE #45

	STROKE #$FFFFFF

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
	move.l               (sp)+,d2
	rts

_drawing_test3:
	move.l               d2,-(sp)
	CLEARFASTBITPLANES ; Clear fast bitplanes
	RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

	move.w #160,d0
	move.w #128,d1
	jsr TRANSLATE

	ROTATE #45

	STROKE #$ABCDEF

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
	move.l               (sp)+,d2
	rts

