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
  XDEF                 _math_test12
  XDEF                 _math_test13
  XDEF                 _math_test14
  XDEF                 _math_test15
  XDEF                 _math_test16
  XDEF                 _math_test17
  XDEF                 _math_test18
  XDEF                 _math_test19
  XDEF                 _math_test20
  XDEF                 _math_test21
  XDEF                 _math_test22
  XDEF                 _math_test23
  XDEF                 _math_test24
  XDEF                 _math_test25
  XDEF                 _math_test26
  XDEF                 _math_test27
  XDEF                 _math_test28
  XDEF                 _math_test29
  XDEF                 _math_test30
  XDEF                 _math_test31
  XDEF                 _math_test32
  XDEF                 _math_test33
  XDEF                 _math_test34
  XDEF                 _math_test35
  XDEF                 _math_test36
  XDEF                 _math_test37
  XDEF                 _math_test38
  XDEF                 _math_test39

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

_math_test12:
  move.l          d2,-(sp)
  move.l          #346,d0
  IF_1_GREATER_2_W_U #65535,d0,math_test_12,s ; if (65535>346){}else jump to math_test_12
  move.w          #2,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts
math_test_12:
  move.w          #1,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts

_math_test13:
  move.l          d2,-(sp)
  move.l          #350,d0
  IF_1_GREATER_2_W_U #350,d0,math_test_13,s ; if (350>346){}else jump to math_test_13
  move.w          #2,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts
math_test_13:
  move.w          #1,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts

_math_test14:
  move.l          d2,-(sp)
  move.l          #350,d0
  IF_1_GREATER_2_W_U #10,d0,math_test_14,s ; if (10>346){}else jump to math_test_14
  move.w          #2,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts
math_test_14:
  move.w          #1,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts

_math_test15:
  move.l          d2,-(sp)
  move.l          #346,d0
  IF_1_GREATER_2_W_S #65535,d0,math_test_15,s ; if (65535>346){}else jump to math_test_15,s
  move.w          #2,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts
math_test_15:
  move.w          #1,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts

_math_test16:
  move.l          d2,-(sp)
  move.l          #350,d0
  IF_1_GREATER_2_W_S #350,d0,math_test_16,s ; if (350>350){}else jump to math_test_16,w
  move.w          #2,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts
math_test_16:
  move.w          #1,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts

_math_test17:
  move.l          d2,-(sp)
  move.l          #350,d0
  IF_1_GREATER_2_W_S #1000,d0,math_test_17,s ; if (1000>350){}else jump to math_test_17,s
  move.w          #2,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts
math_test_17:
  move.w          #1,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts

_math_test18:
  move.l          d2,-(sp)
  move.l          #346,d0
  IF_1_GREATER_EQ_2_W_U #65535,d0,math_test_18,s ; if (65535>346){}else jump to math_test_18
  move.w          #2,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts
math_test_18:
  move.w          #1,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts

_math_test19:
  move.l          d2,-(sp)
  move.l          #350,d0
  IF_1_GREATER_EQ_2_W_U #350,d0,math_test_19,s ; if (350>350){}else jump to math_test_19
  move.w          #2,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts
math_test_19:
  move.w          #1,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts

_math_test20:
  move.l          d2,-(sp)
  move.l          #350,d0
  IF_1_GREATER_EQ_2_W_U #10,d0,math_test_20,s ; if (10>346){}else jump to math_test_20
  move.w          #2,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts
math_test_20:
  move.w          #1,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts

_math_test21:
  move.l          d2,-(sp)
  move.l          #346,d0
  IF_1_GREATER_EQ_2_W_S #65535,d0,math_test_21,s ; if (65535>346){}else jump to math_test_21
  move.w          #2,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts
math_test_21:
  move.w          #1,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts

_math_test22:
  move.l          d2,-(sp)
  move.l          #350,d0
  IF_1_GREATER_EQ_2_W_S #350,d0,math_test_22,s ; if (350>350){}else jump to math_test_22
  move.w          #2,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts
math_test_22:
  move.w          #1,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts

_math_test23:
  move.l          d2,-(sp)
  move.l          #350,d0
  IF_1_GREATER_EQ_2_W_S #10,d0,math_test_23,s ; if (10>346){}else jump to math_test_23
  move.w          #2,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts
math_test_23:
  move.w          #1,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts

_math_test24:
  move.l          d2,-(sp)
  move.l          #1,d0
  IF_1_LESS_2_W_U #65535,d0,math_test_24,s 
  move.w          #2,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts
math_test_24:
  move.w          #1,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts

_math_test25:
  move.l          d2,-(sp)
  move.l          #350,d0
  IF_1_LESS_2_W_U #350,d0,math_test_25,s
  move.w          #2,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts
math_test_25:
  move.w          #1,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts

_math_test26:
  move.l          d2,-(sp)
  move.l          #65535,d0
  IF_1_LESS_2_W_U #350,d0,math_test_26,s 
  move.w          #2,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts
math_test_26:
  move.w          #1,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts

_math_test27:
  move.l          d2,-(sp)
  move.l          #350,d0
  IF_1_LESS_2_W_U #10,d0,math_test_27,s
  move.w          #2,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts
math_test_27:
  move.w          #1,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts

_math_test28:
  move.l          d2,-(sp)
  move.l          #1,d0
  IF_1_LESS_EQ_2_W_U #65535,d0,math_test_28,s 
  move.w          #2,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts
math_test_28:
  move.w          #1,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts

_math_test29:
  move.l          d2,-(sp)
  move.l          #350,d0
  IF_1_LESS_EQ_2_W_U #350,d0,math_test_29,s
  move.w          #2,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts
math_test_29:
  move.w          #1,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts

_math_test30:
  move.l          d2,-(sp)
  move.l          #65535,d0
  IF_1_LESS_EQ_2_W_U #350,d0,math_test_30,s 
  move.w          #2,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts
math_test_30:
  move.w          #1,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts

_math_test31:
  move.l          d2,-(sp)
  move.l          #350,d0
  IF_1_LESS_EQ_2_W_U #10,d0,math_test_31,s
  move.w          #2,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts
math_test_31:
  move.w          #1,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts

_math_test32:
  move.l          d2,-(sp)
  move.l          #1,d0
  IF_1_LESS_2_W_S #65535,d0,math_test_32,s 
  move.w          #2,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts
math_test_32:
  move.w          #1,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts

_math_test33:
  move.l          d2,-(sp)
  move.l          #350,d0
  IF_1_LESS_2_W_S #350,d0,math_test_33,s
  move.w          #2,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts
math_test_33:
  move.w          #1,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts

_math_test34:
  move.l          d2,-(sp)
  move.l          #65535,d0
  IF_1_LESS_2_W_S #350,d0,math_test_34,s 
  move.w          #2,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts
math_test_34:
  move.w          #1,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts

_math_test35:
  move.l          d2,-(sp)
  move.l          #350,d0
  IF_1_LESS_2_W_S #10,d0,math_test_35,s
  move.w          #2,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts
math_test_35:
  move.w          #1,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts

_math_test36:
  move.l          d2,-(sp)
  move.l          #1,d0
  IF_1_LESS_EQ_2_W_S #65535,d0,math_test_36,s 
  move.w          #2,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts
math_test_36:
  move.w          #1,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts

_math_test37:
  move.l          d2,-(sp)
  move.l          #350,d0
  IF_1_LESS_EQ_2_W_S #350,d0,math_test_37,s
  move.w          #2,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts
math_test_37:
  move.w          #1,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts

_math_test38:
  move.l          d2,-(sp)
  move.l          #65535,d0
  IF_1_LESS_EQ_2_W_S #350,d0,math_test_38,s 
  move.w          #2,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts
math_test_38:
  move.w          #1,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts

_math_test39:
  move.l          d2,-(sp)
  move.l          #350,d0
  IF_1_LESS_EQ_2_W_S #10,d0,math_test_39,s
  move.w          #2,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts
math_test_39:
  move.w          #1,OPERAND1
  move.l          #OPERAND1,d0
  move.l          (sp)+,d2
  rts
