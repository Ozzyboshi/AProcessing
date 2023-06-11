  XDEF                 _math_test1
  XDEF                 _math_test2
  XDEF                 _math_test3
  XDEF                 _math_test4
  XDEF                 _math_test5
  XDEF                 _math_test6
  XDEF                 _math_test7

  include              "../../../libs/math/operations.s"
  include              "../../../libs/math/sqrt_table_q16_0.i"
  include              "../../../libs/math/sqrt.s"


OPERAND1:
  dc.l                 -1

_math_test1:
  move.l           d2,-(sp)
  move.w           #$1,OPERAND1
  ABS_WORD         OPERAND1

  move.l           #OPERAND1,d0
  
  move.l               (sp)+,d2
  rts

_math_test2:
  move.l           d2,-(sp)
  move.w           #-1,OPERAND1
  ABS_WORD         OPERAND1

  move.l           #OPERAND1,d0
  
  move.l               (sp)+,d2
  rts

_math_test3:
  move.l           d2,-(sp)
  move.l           #10,d0
  SQRT_Q16_0
  move.w          d1,OPERAND1

  move.l           #OPERAND1,d0
  
  move.l               (sp)+,d2
  rts

_math_test4:
  move.l           d2,-(sp)
  move.l           #40000,d0
  SQRT_Q16_0
  move.w          d1,OPERAND1

  move.l           #OPERAND1,d0
  
  move.l               (sp)+,d2
  rts

_math_test5:
  move.l           d2,-(sp)
  move.l           #160000,d0
  SQRT_Q16_0
  move.w          d1,OPERAND1

  move.l           #OPERAND1,d0
  
  move.l               (sp)+,d2
  rts

_math_test6:
  move.l           d2,-(sp)
  move.l           #123455,d0
  SQRT_Q16_0
  move.w          d1,OPERAND1

  move.l           #OPERAND1,d0
  
  move.l               (sp)+,d2
  rts

_math_test7:
  move.l          d2,-(sp)
  move.l          #123455,d0
  jsr             SQRT_FIG
  move.w          d0,OPERAND1

  move.l          #OPERAND1,d0
  
  move.l          (sp)+,d2
  rts