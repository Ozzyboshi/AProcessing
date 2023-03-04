; Single playfield mode
COPSET2BPL MACRO
  dc.w       $100
  dc.w       %0010001000000000
  ENDM

COPSET3BPL MACRO
  dc.w       $100
  dc.w       %0011001000000000
  ENDM

COPSET4BPL MACRO
	dc.w	$100
	dc.w	%0100001000000000
ENDM

COPSET5BPL MACRO
  dc.w       $100
  dc.w       %0101001000000000
  ENDM

; Double playfield modes
COPSET23BPL MACRO
  dc.w       $100
  dc.w       $5600
  ENDM
