; COPFADEFPU2 - Re-maps a 12 bit RGB color (format 0R0G0B) from one range to another.
; For each color the difference between first color and secon color is divided
; by Number of phases then multiplied by the Phase of the output color and added
; to the first color.
; The goal is to get nice color transitions (interpolation) from the first color to the second.
; Something similar has already been done (see precalc dir) but this one is meant to be used on the fly on vampire.
; Input:
;	- d0.w : First color (format $0RGB)
;	- d1.w : Second color (format $0RGB)
; - fp1.w : Number of phases (put a number greater than zero here)
; - fp2.w : Phase of the output color
; Output:
;   d0.w : will be used to return new the output color
;   e23.l: will return the content of d0.w but in long format
; Defines: nothing
;
; Trashes: 
; - d0-d6
; - fp0
; Depends on RGBTO0R0B0G macro
COPFADEFPU2:
  load d0,d2
  load d1,d3

  IFD VAMPIRE
  load d2,e23
  psubb d2,d3,d4 ;d4 #$F9F9FA


; start of BLUE
  fmove.b d4,fp0

  fdiv fp1,fp0
  fmul fp2,fp0
  fmove.l fp0,d0
  vperm #$FFFFFFF7,e23,e23,d6
  add.b d6,d0 ; fin qui ok

  ; start of green
  lsr.l #8,d4
  ;...

  fmove.b d4,fp0
  fdiv fp1,fp0
  fmul fp2,fp0
  fmove.l fp0,d1
  vperm #$FFFFFFF6,e23,e23,d6
  add.b d6,d1

  ; start of red
  lsr.l #8,d4
  fmove.b d4,fp0

  fdiv fp1,fp0
  fmul fp2,fp0
  fmove.l fp0,d2
  vperm #$FFFFFFF5,e23,e23,d6
  add.b d6,d2

  ; start modifica
  move.b d2,e23 ; red
  lslq #8,e23,e23
  move.b d1,e23 ; green
  lslq #8,e23,e23
  move.b d0,e23 ; blu
  pand #$FFFFFF,e23,e23
  ; end modifica


  lsl.w #4,d1
  or.w d1,d0

  lsl.w #8,d2
  andi.w #$FF,d0

  or.w d2,d0
  ENDC
  rts
