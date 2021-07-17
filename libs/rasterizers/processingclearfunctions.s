CLEARFASTBITPLANES MACRO

	; copy from fast bitplanes to slow bitplanes
	lea SCREEN_0,a0
	lea SCREEN_1,a4

	
    IFD VAMPIRE
    move.l #5*255,d3
	load #0,e0
    ENDIF
    IFND VAMPIRE
	moveq #0,d0
    move.l #10*255,d3
    ENDIF

	;move.l bitplane0,a1
	;move.l bitplane1,a2
.clearfastbitplanesmacro:
    IFD VAMPIRE
    store e0,(a0)+
	store e0,(a4)+
    ENDIF
    IFND VAMPIRE
    move.l d0,(a0)+
	move.l d0,(a4)+
    ENDIF
	;load (a0),e20
	;load (a4),e21
	;store e20,(a1)+
	;store e21,(a2)+
	;store e0,(a0)+
	;store e0,(a4)+
	dbra d3,.clearfastbitplanesmacro
	ENDM


PREPARESCREEN MACRO

	; copy from fast bitplanes to slow bitplanes
	move.l #5*255,d3
	lea SCREEN_0,a0
	lea SCREEN_1,a4
	
	load #0,e0

	move.l bitplane0,a1
	move.l bitplane1,a2
.preparescreenclearline:
	load (a0),e20
	load (a4),e21
	store e20,(a1)+
	store e21,(a2)+
	store e0,(a0)+
	store e0,(a4)+
	dbra d3,.preparescreenclearline
	ENDM

RESETFILLTABLE MACRO
	move.w #1,AMMX_FILL_TABLE_FIRST_DRAW
	move.l #255,d3
	lea FILL_TABLE,a0
.resetfilltableclearline:
	move.l #$7FFF8000,(a0)+
	dbra d3,.resetfilltableclearline
	ENDM