  XDEF                 _math_sin_256_test1
  XDEF                 _math_sin_256_test2
  XDEF                 _math_sin_256_test3

  include              "../../../libs/math/sin_256_word_q_8_8_autogen_macro.s"
  include              "../../../libs/math/sin_cos_256_word_q_8_8_autogen_macro.s"
  include              "../../../libs/rasterizers/globaloptions.s"


sinus:   dcb.w 256,0           
cosinus: dcb.w 1024,0

_math_sin_256_test1:
  move.l           d2,-(sp)
  PROTON_SINUS
  move.l           #sinus,d0
  move.l           (sp)+,d2
  rts

sin_cos: dcb.w 2048+512,0
_math_sin_256_test2:
  move.l           d2,-(sp)
  lea              sin_cos,a0
  jsr              make_sinus
  move.l           #sin_cos,d0
  move.l           (sp)+,d2
  rts

_math_sin_256_test3:
  move.l           d2,-(sp)
  PROTON_SINUS
  PROTON_COS_BY_SIN
  move.l           #cosinus,d0
  move.l           (sp)+,d2
  rts

