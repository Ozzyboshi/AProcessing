  XDEF                 _math_sin_256_test1


  include              "../../../libs/math/sin_256_word_q_8_8_autogen_macro.s"


sinus:              dcb.w 1024,0


_math_sin_256_test1:
  move.l           d2,-(sp)
  PROTON_SINUS
  move.l           #sinus,d0
  move.l           (sp)+,d2
  rts

