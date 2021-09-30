; my own macro to load a immediate
REG_LOADI MACRO
	load #$\1\2\3\4,\5  ; 0 1 0 0
	ENDM

; add 3 rightmost signed 3 of a En register and store the result in the right word of d1
REG_ADD_LESS_SIG_3_WORDS MACRO
	vperm #$000000AB,e21,\1,d0 ; e21 zero register
	paddw \1,d0,d0
	move.l d0,d1
	swap d1
	add.w d0,d1
	ENDM

REG_ZERO MACRO
	load #$0000000000000000,\1 ; zero register
	ENDM

   ; XDEF _ammxmatrixmul3X3
	;XDEF _ammxmatrixmul3X3Trig
	;XDEF _ammxmatrixmul1X3

WAITBLITTER MACRO
  btst      #6,$dff002
.1\@
  btst      #6,$dff002
  bne.s     .1\@
  ENDM