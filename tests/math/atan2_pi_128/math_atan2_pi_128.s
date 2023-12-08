  XDEF                 _math_atan2_pi_128_test1
  XDEF                 _math_atan2_pi_128_test2
  XDEF                 _math_atan2_pi_128_test3
  XDEF                 _math_atan2_pi_128_test4
  XDEF                 _math_atan2_pi_128_test5
  XDEF                 _math_atan2_pi_128_test6
  XDEF                 _math_atan2_pi_128_test7
  XDEF                 _math_atan2_pi_128_test8
  XDEF                 _math_atan2_pi_128_test9
  XDEF                 _math_atan2_pi_128_test10
  XDEF                 _math_atan2_pi_128_test11
  XDEF                 _math_atan2_pi_128_test12
  XDEF                 _math_atan2_pi_128_test13
  XDEF                 _math_atan2_pi_128_test14
  XDEF                 _math_atan2_pi_128_test15
  XDEF                 _math_atan2_pi_128_test16
  XDEF                 _math_atan2_pi_128_test17
  XDEF                 _math_atan2_pi_128_test18
  XDEF                 _math_atan2_pi_128_test19
  XDEF                 _math_atan2_pi_128_test20
  XDEF                 _math_atan2_pi_128_test21

  include              "../../../libs/math/operations.s"
  include              "../../../libs/math/sqrt_table_q16_0.i"
  include              "../../../libs/math/atan2_pi_128.s"
  include              "../../../libs/math/atan2_pi_128.i"


OPERAND1:
  dc.w                 -1

_math_atan2_pi_128_test1:
  move.l           d2,-(sp)
  move.w           #1,d0
  move.w           #1,d1
  jsr              ATAN2_PI_128
  move.w           d3,OPERAND1
  move.l           #OPERAND1,d0
  
  move.l               (sp)+,d2
  rts

_math_atan2_pi_128_test2:
  move.l           d2,-(sp)
  move.w           #-1,d0
  move.w           #1,d1
  jsr              ATAN2_PI_128
  move.w           d3,OPERAND1
  move.l           #OPERAND1,d0
  
  move.l               (sp)+,d2
  rts

_math_atan2_pi_128_test3:
  move.l           d2,-(sp)
  move.w           #1,d0
  move.w           #-1,d1
  jsr              ATAN2_PI_128
  move.w           d3,OPERAND1
  move.l           #OPERAND1,d0
  
  move.l               (sp)+,d2
  rts


_math_atan2_pi_128_test4:
  move.l           d2,-(sp)
  move.w           #-1,d0
  move.w           #-1,d1
  jsr              ATAN2_PI_128
  move.w           d3,OPERAND1
  move.l           #OPERAND1,d0
  
  move.l               (sp)+,d2
  rts

_math_atan2_pi_128_test5:
  move.l           d2,-(sp)

  move.w           #1,d0
  move.w           #10,d1
  jsr              ATAN2_PI_128
  move.w           d3,OPERAND1
  move.l           #OPERAND1,d0

  move.l           (sp)+,d2
  rts

_math_atan2_pi_128_test6:
  move.l           d2,-(sp)
  move.w           #-1,d0
  move.w           #10,d1
  jsr              ATAN2_PI_128
  move.w           d3,OPERAND1
  move.l           #OPERAND1,d0
  
  move.l           (sp)+,d2
  rts

_math_atan2_pi_128_test7:
  move.l           d2,-(sp)
  move.w           #1,d0
  move.w           #-10,d1
  jsr              ATAN2_PI_128
  move.w           d3,OPERAND1
  move.l           #OPERAND1,d0
  
  move.l           (sp)+,d2
  rts

_math_atan2_pi_128_test8:
  move.l           d2,-(sp)
  move.w           #-1,d0
  move.w           #-10,d1
  jsr              ATAN2_PI_128
  move.w           d3,OPERAND1
  move.l           #OPERAND1,d0
  
  move.l           (sp)+,d2
  rts

_math_atan2_pi_128_test9:
  move.l           d2,-(sp)
  move.w           #0,d0
  move.w           #0,d1
  jsr              ATAN2_PI_128
  move.w           d3,OPERAND1
  move.l           #OPERAND1,d0
  
  move.l               (sp)+,d2
  rts

_math_atan2_pi_128_test10:
  move.l           d2,-(sp)
  move.w           #1,d0
  move.w           #0,d1
  jsr              ATAN2_PI_128
  move.w           d3,OPERAND1
  move.l           #OPERAND1,d0
  
  move.l               (sp)+,d2
  rts

_math_atan2_pi_128_test11:
  move.l           d2,-(sp)
  move.w           #0,d0
  move.w           #1,d1
  jsr              ATAN2_PI_128
  move.w           d3,OPERAND1
  move.l           #OPERAND1,d0
  
  move.l           (sp)+,d2
  rts

_math_atan2_pi_128_test12:
  move.l           d2,-(sp)
  move.w           #0,d0
  move.w           #-1,d1
  jsr              ATAN2_PI_128
  move.w           d3,OPERAND1
  move.l           #OPERAND1,d0
  
  move.l           (sp)+,d2
  rts

_math_atan2_pi_128_test13:
  move.l           d2,-(sp)
  move.w           #-1,d0
  move.w           #0,d1
  jsr              ATAN2_PI_128
  move.w           d3,OPERAND1
  move.l           #OPERAND1,d0
  
  move.l           (sp)+,d2
  rts

_math_atan2_pi_128_test14:
  move.l           d2,-(sp)
  move.w           #2,d0
  move.w           #9,d1
  jsr              ATAN2_PI_128
  move.w           d3,OPERAND1
  move.l           #OPERAND1,d0
  
  move.l           (sp)+,d2
  rts

_math_atan2_pi_128_test15:
  move.l           d2,-(sp)
  move.w           #120,d0
  move.w           #9,d1
  jsr              ATAN2_PI_128
  move.w           d3,OPERAND1
  move.l           #OPERAND1,d0
  
  move.l           (sp)+,d2
  rts

_math_atan2_pi_128_test16:
  move.l           d2,-(sp)
  move.w           #-120,d0
  move.w           #9,d1
  jsr              ATAN2_PI_128
  move.w           d3,OPERAND1
  move.l           #OPERAND1,d0
  
  move.l           (sp)+,d2
  rts

_math_atan2_pi_128_test17:
  move.l           d2,-(sp)
  move.w           #-2,d0
  move.w           #-100,d1
  jsr              ATAN2_PI_128
  move.w           d3,OPERAND1
  move.l           #OPERAND1,d0
  
  move.l           (sp)+,d2
  rts

_math_atan2_pi_128_test18:
  move.l           d2,-(sp)
  move.w           #-126,d0
  move.w           #126,d1
  jsr              ATAN2_PI_128
  move.w           d3,OPERAND1
  move.l           #OPERAND1,d0
  
  move.l           (sp)+,d2
  rts

_math_atan2_pi_128_test19:
  move.l           d2,-(sp)
  move.w           #126,d0
  move.w           #-126,d1
  jsr              ATAN2_PI_128
  move.w           d3,OPERAND1
  move.l           #OPERAND1,d0
  
  move.l           (sp)+,d2
  rts

_math_atan2_pi_128_test20:
  move.l           d2,-(sp)
  move.w           #100,d0
  move.w           #19,d1
  jsr              ATAN2_PI_128
  move.w           d3,OPERAND1
  move.l           #OPERAND1,d0
  
  move.l           (sp)+,d2
  rts

_math_atan2_pi_128_test21:
  move.l           d2,-(sp)
  move.w           #-64,d0
  move.w           #120,d1
  jsr              ATAN2_PI_128
  neg d3
  move.w           d3,OPERAND1
  move.l           #OPERAND1,d0
  
  move.l           (sp)+,d2
  rts