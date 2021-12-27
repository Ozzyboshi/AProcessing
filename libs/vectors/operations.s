; CREATE2DVECTOR - Create (or better, initializes) a 2d vector
; Input: 
;   - d0.w: x value
;   - d1.w: y value
;   - address of the vector as first arg of the macro
; Output: nothing
; Trashes: nothing
    MACRO CREATE2DVECTOR
    move.w d0,\1
    move.w d1,2+\1
    ENDM

; ADD2DVECTORSTATIC - add 2 2d vector and place the result in a third vector
; Input: 
;   - a0.l: address of first vector
;   - a1.l: address of second vector
;   - address of the result vector as first arg of the macro
; Output: nothing
; Trashes:
;   - d0
;   - d1
    MACRO ADD2DVECTORSTATIC
    IFD VAMPIRE
    LOAD (a0),d0
    LOAD (a1),d1
    paddw d0,d1,d1
    VPERM #$01230123,d1,d1,d0
    move.l d0,\1
    ELSE
    move.w (a0),d0
    move.w 2(a0),d1
    add.w (a1),d0
    add.w 2(a1),d1
    move.w d0,\1
    move.w d1,2+\1
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
;   - d1
    MACRO SUB2DVECTORSTATIC
    IFD VAMPIRE
    LOAD (a0),d0
    LOAD (a1),d1
    psubw d1,d0,d1
    VPERM #$01230123,d1,d1,d0
    move.l d0,\1
    ELSE
    move.w (a0),d0
    move.w 2(a0),d1
    sub.w (a1),d0
    sub.w 2(a1),d1
    move.w d0,\1
    move.w d1,2+\1
    ENDIF
    ENDM