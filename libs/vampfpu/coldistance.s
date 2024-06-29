COLDIST:

    sub.w d3,d0
    sub.w d4,d1
    sub.w d5,d2

    muls d0,d0
    muls d1,d1
    muls d2,d2

    add.w d1,d0
    add.w d2,d0

    fmove.w d0,fp0

    fsqrt fp0,fp0
    rts