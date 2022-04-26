; recalc by sin
; builds trig table cos -sin sin cos in format q 5 11 from a sin
; put sin addr in a0 and dest addr in a1 before calling
; needs 360*8 = 2880 bytes free at addr pointed by a1
; trashes a0 a1 a2 a3 a4 d0 d1 d7
PRECALC_BY_SIN:
    move.l a0,a3
    move.l a0,a4
    adda.l #8*360,a3
    move.w #361-1,d7
    move.l a0,a2
    adda.l #2*90,a2
precalc_by_sin_startloop:
    move.w (a2),(a1)+ ; cos

    ; - sin
    move.w (a0)+,d0
    move.w d0,d1
    muls #-1,d0
    move.w d0,(a1)+

    ; sin
    move.w d1,(a1)+

    ; cos
    move.w (a2)+,(a1)+

    ; reset cos table
    ;cmp.l a2,a3
    ;bne.s precalc_by_sin_dontresetcosptr
    ;move.l a4,a3
    cmp.w #360-270+1,d7
    bne.s precalc_by_sin_dontresetcosptr
    move.l a4,a2

precalc_by_sin_dontresetcosptr:
    dbra d7,precalc_by_sin_startloop
    rts