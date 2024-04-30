CORDIC:
    ; Load angle table into a0
    lea ANGTABLE,a0

    ; init Shiftcounter , register is d6
    moveq #0,d6

    ; init SumAngle , register is d3
    moveq #0,d3

cordicloop:
    ; check if Y is positive
    tst.w d1
    bmi cordicnegative

    ; ********************* Y is positive ***********************
    ; Xnew = X + Y >> Shiftcounter
    move.w d1,d5 ; first we have to shift Y , use scratch register d5
    asr.w d6,d5  ; Y is now shifted into d5
    add.w d0,d5  ; Now d5 holds Xnew

    ; Ynew = Y - X >> Shiftcounter
    move.w d0,d4 ; first we have to shift Y , use scratch register d4
    neg.w d4
    asr.w d6,d4  ; Y is now shifted into d5
    add.w d1,d4
    
    add.w (a0)+,d3 ; SumAngle += AngTable[i]

    bra cordicincreaseangle


cordicnegative:
    ; ********************* Y is NEGATIVE ***********************
    ; Xnew = X + Y >> Shiftcounter
    move.w d1,d5 ; first we have to shift Y , use scratch register d5
    asr.w d6,d5  ; Y is now shifted into d5
    neg d5
    add.w d0,d5  ; Now d5 holds Xnew

    ; Ynew = Y - X >> Shiftcounter
    move.w d0,d4 ; first we have to shift Y , use scratch register d4
    asr.w d6,d4  ; Y is now shifted into d5
    add.w d1,d4

    sub.w (a0)+,d3 ; SumAngle -= AngTable[i]

cordicincreaseangle:

    move.w d5,d0
    move.w d4,d1
    beq CORDINCEND
    tst.w (a0)
    beq CORDINCEND

    addq #1,d6 ; Increment shifting
    
    ; cycle over 
    bra cordicloop
CORDINCEND:
    rts

ANGTABLE: 
    dc.w %0010110100000000 ; 45
    dc.w %0001101010010000 ; 26.565
    dc.w %0000111000001001 ; 14.036
    dc.w %0000011100100000 ; 7.125
    dc.w %0000001110010011 ; 3.576 
    dc.w %0000000111001010 ; 1.790
    dc.w %0000000011100101 ; 0.895
    dc.w %0000000001110010 ; 0.448
    dc.w 0