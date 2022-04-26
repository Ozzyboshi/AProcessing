  XDEF                 _precalcsimpleops_test1
  XDEF                 _precalcsimpleops_test2


  include              "../../../libs/rasterizers/globaloptions.s"
  include              "../../../libs/precalc/precalc_by_sin.s"
  include              "../../../libs/trigtables_sin.i"
  include              "../../../libs/trigtables.i"
  include              "../../../libs/ammxmacros.i"

 
_precalcsimpleops_test1:
  move.l               d2,-(sp)
  move.l               #ROT_Z_MATRIX_Q5_11,d0                                    ; returns addr in d0
  move.l               (sp)+,d2
  rts

NEW_TAB: dcb.b 361*8,$00
_precalcsimpleops_test2:
  move.l               d2,-(sp)
  lea SIN_Q5_11,a0
  lea NEW_TAB,a1
  jsr PRECALC_BY_SIN
  move.l               #NEW_TAB,d0                                    ; returns addr in d0
  move.l               (sp)+,d2
  rts

