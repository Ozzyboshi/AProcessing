BUILDCOLORTABLEMAP_SMALL:
    move.l d7,d6
    moveq #0,d1

buildcolortablemaploop:
    ; red start
    move.w (a0)+,d0
    sub.w (a0)+,d0
    asl.w  #8,d0
    ext.l d0
    divs d6,d0 ; 10/20
    muls d1,d0
    asr.w #8,d0
    add.w -2(a0),d0
    move.b d0,(a1)+

    ; blue start
    move.w (a0)+,d0
    sub.w (a0)+,d0
    asl.w  #8,d0
    ext.l d0
    divs d6,d0 ; 10/20
    muls d1,d0
    asr.w #8,d0
    add.w -2(a0),d0
    lsl.w #4,d0
    move.b d0,(a1)+

    ; green start
    move.w (a0)+,d0
    sub.w (a0)+,d0
    asl.w  #8,d0
    ext.l d0
    divs d6,d0 ; 10/20
    muls d1,d0
    asr.w #8,d0
    add.w -2(a0),d0
    or.b d0,-1(a1)

    suba.w #12,a0
    addq #1,d1
    dbra d7,buildcolortablemaploop
    rts