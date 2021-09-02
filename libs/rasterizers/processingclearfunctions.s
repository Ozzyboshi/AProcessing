CLEARFASTBITPLANES MACRO

	; copy from fast bitplanes to slow bitplanes
	IFD USE_DBLBUF
	move.l SCREEN_PTR_0,a0
	move.l SCREEN_PTR_1,a4
	ELSE
	lea SCREEN_0,a0
	lea SCREEN_1,a4
	ENDIF

    IFD VAMPIRE
    move.l #1279,d3
	load #0,e0
    ENDIF
    IFND VAMPIRE
	moveq #0,d0
    move.l #2560-1,d3
    ENDIF

.clearfastbitplanesmacro:
    IFD VAMPIRE
    store e0,(a0)+
	store e0,(a4)+
    ENDIF
    IFND VAMPIRE
    move.l d0,(a0)+
	move.l d0,(a4)+
    ENDIF
	dbra d3,.clearfastbitplanesmacro
	ENDM

FILLFASTBITPLANES MACRO

	; copy from fast bitplanes to slow bitplanes
	lea SCREEN_0,a0
	lea SCREEN_1,a4

	
    IFD VAMPIRE
    move.l #5*255,d3
	load #$FFFFFFFFFFFFFFFF,e0
    ENDIF
    IFND VAMPIRE
	move.l #$FFFFFFFF,d0
    move.l #2560-1,d3
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


COPYBITPLANESANDCLEAR MACRO
	IFD USE_DBLBUF
	move.l SCREEN_PTR_0,a0
	move.l SCREEN_PTR_1,a4
	ELSE
	lea SCREEN_0,a0
	lea SCREEN_1,a4
	ENDIF

	move.l bitplane0,a1
	move.l bitplane1,a2

	moveq #0,d0
    move.l #2560-1,d3
.copybpnsandclearmacro:
	move.l (a0),d1
	move.l (a4),d2

	move.l d1,(a1)+
	move.l d2,(a2)+

	move.l d0,(a0)+
	move.l d0,(a4)+

	dbra d3,.copybpnsandclearmacro
	ENDM
	
PREPARESCREEN MACRO

	; copy from fast bitplanes to slow bitplanes
	move.l #5*255,d3
	IFD USE_DBLBUF
	move.l SCREEN_PTR_0,a0
	move.l SCREEN_PTR_1,a4
	ELSE
	lea SCREEN_0,a0
	lea SCREEN_1,a4
	ENDIF
	
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
.1\@:
	move.l #$7FFF8000,(a0)+
	dbra d3,.1\@
	ENDM

RESETFILLYVALS MACRO
	move.w #-1,FILLTABLE_FRAME_MIN_Y
	move.w #0,FILLTABLE_FRAME_MAX_Y
	ENDM