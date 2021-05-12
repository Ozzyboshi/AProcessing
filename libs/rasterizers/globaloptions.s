GLOBAL_OPTIONS:
	dc.l $00000000
	dc.w $0000
	dc.b $00
STROKE_DATA:	dc.b $01 ; colors here

STROKE MACRO
	IFD VAMPIRE 
	PAND #$FFFFFFFFFFFFFF00,e22,e22 ; last byte zeroed
	POR \1,e22,e22 ; last byte reserved for bitplanes
	ENDIF
	move.b \1,STROKE_DATA
	ENDM
