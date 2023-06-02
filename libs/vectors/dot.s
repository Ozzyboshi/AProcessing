; DOT_Q10_6 - Get dot product of 2 bidimensional vectors in Q10 6 format
; In order to calculate a dot product the following formulas can be applied:
; a · b = |a| × |b| × cos(θ)
; OR
; a · b = ax × bx + ay × by
; This routine will use the second algorithm
; Input: 
;   - a0.l: address of the first vector
;   - a1.l: address of the second vector
; Output:
;   - d0.l: the calculated dot product
; Trashes:
;   - d1
;   - d7
DOT_Q10_6:
    moveq   #6,d7

    move.w  (a1),d0
    muls    (a0),d0
    asr.l   d7,d0

    move.w  2(a1),d1
    muls    2(a0),d1
    asr.l   d7,d1

    add.l   d1,d0

    rts
