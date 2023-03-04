  XDEF                 _math_test1
  XDEF                 _math_test2

  include              "../../../libs/math/operations.s"


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