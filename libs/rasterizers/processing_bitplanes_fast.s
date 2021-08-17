; Fast bitplanes
; This bitplanes will be copied into chip ram by PREPARESCREEN MACRO
    IFD USE_DBLBUF
SCREEN_PTR_0: dc.l SCREEN_0
SCREEN_PTR_1: dc.l SCREEN_1
SCREEN_OFFSET: dc.l 40*256*2*-1
    ENDIF
    IFD USE_VIDEOCHIP
    SECTION ".data_chip",data
    ENDIF

SCREEN_0
    dcb.b 40*256,$00

SCREEN_1
    dcb.b 40*256,$00

    IFD USE_DBLBUF
SCREEN_00
    dcb.b 40*256,$00

SCREEN_11
    dcb.b 40*256,$00
    ENDIF

processing_bitplanes_fast_screen0:
	move.l #SCREEN_0,d0
	rts
