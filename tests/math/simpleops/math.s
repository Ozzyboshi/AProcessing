  XDEF                 _math_test1
  XDEF                 _math_test2
  XDEF                 _math_test3
  XDEF                 _math_test4
  XDEF                 _math_test5
  XDEF                 _math_test6
  XDEF                 _math_test7
  XDEF                 _math_test8
  XDEF                 _math_test9
  XDEF                 _math_test10
  XDEF                 _math_test11

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

_math_test8:
  move.l          d2,-(sp)
  move.l          #14,d0
  BETWEEN_UWORD   d0,#15,#345,d1
  tst.b           d1
  bne.s           .test8check
  move.w          #0,OPERAND1
  bra.s           .test8end
.test8check:
  move.w          #1,OPERAND1
.test8end
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts

_math_test9:
  move.l          d2,-(sp)
  move.l          #15,d0
  BETWEEN_UWORD   d0,#15,#345,d1
  tst.b           d1
  bne.s           .test9check
  move.w          #0,OPERAND1
  bra.s           .test9end
.test9check:
  move.w          #1,OPERAND1
.test9end
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts

_math_test10:
  move.l          d2,-(sp)
  move.l          #345,d0
  BETWEEN_UWORD   d0,#15,#345,d1
  tst.b           d1
  bne.s           .test10check
  move.w          #0,OPERAND1
  bra.s           .test10end
.test10check:
  move.w          #1,OPERAND1
.test10end
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts

_math_test11:
  move.l          d2,-(sp)
  move.l          #346,d0
  BETWEEN_UWORD   d0,#15,#345,d1
  tst.b           d1
  bne.s           .test11check
  move.w          #0,OPERAND1
  bra.s           .test11end
.test11check:
  move.w          #1,OPERAND1
.test11end
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts