; Fast bitplanes
; This bitplanes will be copied into chip ram by PREPARESCREEN MACRO

SCREEN_0
    dcb.b 40*256,$00

SCREEN_1
    dcb.b 40*256,$00

processing_bitplanes_fast_screen0:
	move.l #SCREEN_0,d0
	rts
