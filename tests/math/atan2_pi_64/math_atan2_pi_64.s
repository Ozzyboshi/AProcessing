  XDEF                 _math_atan2_pi_64_test1
  XDEF                 _math_atan2_pi_64_test2
  XDEF                 _math_atan2_pi_64_test3
  XDEF                 _math_atan2_pi_64_test4
  XDEF                 _math_atan2_pi_64_test5
  XDEF                 _math_atan2_pi_64_test6
  XDEF                 _math_atan2_pi_64_test7
  XDEF                 _math_atan2_pi_64_test8
  XDEF                 _math_atan2_pi_64_test9
  XDEF                 _math_atan2_pi_64_test10
  XDEF                 _math_atan2_pi_64_test11
  XDEF                 _math_atan2_pi_64_test12
  XDEF                 _math_atan2_pi_64_test13

  include              "../../../libs/math/operations.s"
  include              "../../../libs/math/sqrt_table_q16_0.i"
  include              "../../../libs/math/atan2_pi_64.s"
  include              "../../../libs/math/atan2_pi_64.i"


OPERAND1:
  dc.w                 -1

_math_atan2_pi_64_test1:
  move.l           d2,-(sp)
  move.w           #1,d0
  move.w           #1,d1
  jsr              ATAN2_PI_64
  move.w           d3,OPERAND1
  move.l           #OPERAND1,d0
  
  move.l               (sp)+,d2
  rts

_math_atan2_pi_64_test2:
  move.l           d2,-(sp)
  move.w           #-1,d0
  move.w           #1,d1
  jsr              ATAN2_PI_64
  move.w           d3,OPERAND1
  move.l           #OPERAND1,d0
  
  move.l               (sp)+,d2
  rts

_math_atan2_pi_64_test3:
  move.l           d2,-(sp)
  move.w           #1,d0
  move.w           #-1,d1
  jsr              ATAN2_PI_64
  move.w           d3,OPERAND1
  move.l           #OPERAND1,d0
  
  move.l               (sp)+,d2
  rts


_math_atan2_pi_64_test4:
  move.l           d2,-(sp)
  move.w           #-1,d0
  move.w           #-1,d1
  jsr              ATAN2_PI_64
  move.w           d3,OPERAND1
  move.l           #OPERAND1,d0
  
  move.l               (sp)+,d2
  rts

_math_atan2_pi_64_test5:
  move.l           d2,-(sp)
  move.w           #1,d0
  move.w           #10,d1
  jsr              ATAN2_PI_64
  move.w           d3,OPERAND1
  move.l           #OPERAND1,d0
  
  move.l               (sp)+,d2
  rts

_math_atan2_pi_64_test6:
  move.l           d2,-(sp)
  move.w           #-1,d0
  move.w           #10,d1
  jsr              ATAN2_PI_64
  move.w           d3,OPERAND1
  move.l           #OPERAND1,d0
  
  move.l               (sp)+,d2
  rts

_math_atan2_pi_64_test7:
  move.l           d2,-(sp)
  move.w           #1,d0
  move.w           #-10,d1
  jsr              ATAN2_PI_64
  move.w           d3,OPERAND1
  move.l           #OPERAND1,d0
  
  move.l               (sp)+,d2
  rts

_math_atan2_pi_64_test8:
  move.l           d2,-(sp)
  move.w           #-1,d0
  move.w           #-10,d1
  jsr              ATAN2_PI_64
  move.w           d3,OPERAND1
  move.l           #OPERAND1,d0
  
  move.l               (sp)+,d2
  rts

_math_atan2_pi_64_test9:
  move.l           d2,-(sp)
  move.w           #0,d0
  move.w           #0,d1
  jsr              ATAN2_PI_64
  move.w           d3,OPERAND1
  move.l           #OPERAND1,d0
  
  move.l               (sp)+,d2
  rts

_math_atan2_pi_64_test10:
  move.l           d2,-(sp)
  move.w           #1,d0
  move.w           #0,d1
  jsr              ATAN2_PI_64
  move.w           d3,OPERAND1
  move.l           #OPERAND1,d0
  
  move.l               (sp)+,d2
  rts

_math_atan2_pi_64_test11:
  move.l           d2,-(sp)
  move.w           #0,d0
  move.w           #1,d1
  jsr              ATAN2_PI_64
  move.w           d3,OPERAND1
  move.l           #OPERAND1,d0
  
  move.l               (sp)+,d2
  rts

_math_atan2_pi_64_test12:
  move.l           d2,-(sp)
  move.w           #0,d0
  move.w           #-1,d1
  jsr              ATAN2_PI_64
  move.w           d3,OPERAND1
  move.l           #OPERAND1,d0
  
  move.l               (sp)+,d2
  rts

_math_atan2_pi_64_test13:
  move.l           d2,-(sp)
  move.w           #-1,d0
  move.w           #0,d1
  jsr              ATAN2_PI_64
  move.w           d3,OPERAND1
  move.l           #OPERAND1,d0
  
  move.l               (sp)+,d2
  rts