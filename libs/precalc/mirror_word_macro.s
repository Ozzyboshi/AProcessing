MIRROR_WORD MACRO

    moveq #0,d6
    moveq #16-1,d7
    swap d0
    moveq #0,d1

mirror:
    move.w #0,d0
    rol.l #1,d0
    lsl.w d6,d0
    or.w d0,d1
    addq #1,d6

    dbra d7,mirror
    ENDM