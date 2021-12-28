; CREATE2DVECTOR - Create (or better, initializes) a 2d vector
; Input: 
;   - d0.w: x value
;   - d1.w: y value
;   - address of the vector as first arg of the macro
; Output: nothing
; Trashes: nothing
  MACRO     CREATE2DVECTOR
  move.w    d0,\1
  move.w    d1,2+\1
  ENDM

; ADD2DVECTOR - add 2 2d vector and place the result in the second vector
; Input: 
;   - a0.l: address of first vector
;   - a1.l: address of second vector
;   - address of the result vector as first arg of the macro
; Output: nothing
; Trashes:
;   - d0 (only on m68k mode)
;   - d1
  MACRO     ADD2DVECTOR
  IFD       VAMPIRE
  LOAD      -4(a1),d1
  paddw     -4(a0),d1,d1
  move.l    d1,(a1)
  ELSE
  move.w    (a0),d0
  move.w    2(a0),d1
  add.w     d0,(a1)
  add.w     d1,2(a1)
  ENDIF
  ENDM

; ADD2DVECTORSTATIC - add 2 2d vector and place the result in a third vector
; Input: 
;   - a0.l: address of first vector
;   - a1.l: address of second vector
;   - address of the result vector as first arg of the macro
; Output: nothing
; Trashes:
;   - d0 (only on m68k mode)
;   - d1
  MACRO     ADD2DVECTORSTATIC
  IFD       VAMPIRE
  LOAD      -4(a1),d1
  paddw     -4(a0),d1,d1
  move.l    d1,\1
  ELSE
  move.w    (a0),d0
  move.w    2(a0),d1
  add.w     (a1),d0
  add.w     2(a1),d1
  move.w    d0,\1
  move.w    d1,2+\1
  ENDIF
  ENDM

; SUB2DVECTOR - subtract 2 2d vector and place the result in the second vector
; Input: 
;   - a0.l: address of first vector
;   - a1.l: address of second vector
;   - address of the result vector as first arg of the macro
; Output: nothing
; Trashes:
;   - d0
;   - d1 (only on m68k mode)
  MACRO     SUB2DVECTOR
  IFD       VAMPIRE
  LOAD      -4(a0),d0
  psubw     -4(a1),d0,d0
  move.l    d0,(a1)
  ELSE
  move.w    (a0),d0
  move.w    2(a0),d1
  sub.w     (a1),d0
  sub.w     2(a1),d1
  move.w    d0,(a1)
  move.w    d1,2(a1)
  ENDIF
  ENDM

; SUB2DVECTORSTATIC - subtract 2 2d vector and place the result in a third vector
; Input: 
;   - a0.l: address of first vector
;   - a1.l: address of second vector
;   - address of the result vector as first arg of the macro
; Output: nothing
; Trashes:
;   - d0
;   - d1 (only on m68k mode)
  MACRO     SUB2DVECTORSTATIC
  IFD       VAMPIRE
  LOAD      -4(a0),d0
  psubw     -4(a1),d0,d0
  move.l    d0,\1
  ELSE
  move.w    (a0),d0
  move.w    2(a0),d1
  sub.w     (a1),d0
  sub.w     2(a1),d1
  move.w    d0,\1
  move.w    d1,2+\1
  ENDIF
  ENDM

; MUL2DVECTOR - multiply 2 2d vector and place the result in the second vector
; Input: 
;   - a0.l: address of first vector
;   - a1.l: address of second vector
;   - address of the result vector as first arg of the macro
; Output: nothing
; Trashes:
;   - d0 (only on m68k mode)
;   - d1
  MACRO     MUL2DVECTOR
  IFD       VAMPIRE
  LOAD      -4(a1),d1
  pmull     -4(a0),d1,d1
  move.l    d1,(a1)
  ELSE
  move.w    (a0),d0
  move.w    2(a0),d1
  muls.w    (a1),d0
  muls.w    2(a1),d1
  move.w    d0,(a1)
  move.w    d1,2(a1)
  ENDIF
  ENDM

; MUL2DVECTORSTATIC - multiply 2 2d vector and place the result in a third vector
; Input: 
;   - a0.l: address of first vector
;   - a1.l: address of second vector
;   - address of the result vector as first arg of the macro
; Output: nothing
; Trashes:
;   - d0
;   - d1 (only on m68k mode)
  MACRO     MUL2DVECTORSTATIC
  IFD       VAMPIRE
  LOAD      -4(a0),d0
  pmull     -4(a1),d0,d0
  move.l    d0,\1
  ELSE
  move.w    (a0),d0
  move.w    2(a0),d1
  muls.w    (a1),d0
  muls.w    2(a1),d1
  move.w    d0,\1
  move.w    d1,2+\1
  ENDIF
  ENDM