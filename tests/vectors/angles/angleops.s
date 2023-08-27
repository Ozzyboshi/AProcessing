  XDEF                 _angleops_test1
  XDEF                 _angleops_test2
  XDEF                 _angleops_test3
  XDEF                 _angleops_test4
  XDEF                 _angleops_test5
  XDEF                 _angleops_test6

  include              "../../../libs/vectors/sqrt_q10_6_lookup_table.i"
  include              "../../../libs/vectors/sqrt_q4_12_lookup_table.i"

  include              "../../../libs/rasterizers/globaloptions.s"
  include              "../../../libs/vectors/operations.s"
  include              "../../../libs/ammxmacros.i"
  include              "../../../libs/vectors/trigtables.i"
  include              "../../../libs/vectors/dot.s"
  include              "../../../libs/vectors/anglebetweenvectors.s"


VECTOR1:
  dc.l                 0

VECTOR2:
  dc.l                 0

VECTOR3:
  dc.l                 0
 

_angleops_test1:
  move.l               d2,-(sp)

  ; vector1 is 1,2
  move.w                #1*64,d0
  move.w                #1*64,d1
  CREATE2DVECTOR        VECTOR1

  lea                  VECTOR1,a0
  jsr                  ANGLE_Q10_6

  move.w               d0,VECTOR1
  move.l               #VECTOR1,d0
  move.l               (sp)+,d2
  rts

_angleops_test2:
  move.l               d2,-(sp)

  move.w                #10*64,d0
  move.w                #20*64,d1
  CREATE2DVECTOR        VECTOR1

  lea                  VECTOR1,a0


  jsr                  ANGLE_Q10_6


  move.w               d0,VECTOR1
  move.l               #VECTOR1,d0
  move.l               (sp)+,d2
  rts

_angleops_test3:
  move.l               d2,-(sp)

  ; vector1 is 1,2
  move.w                #25*64,d0
  move.w                #8*64,d1

  CREATE2DVECTOR        VECTOR1

  lea                  VECTOR1,a0


  jsr                  ANGLE_Q10_6


  move.w               d0,VECTOR1
  move.l               #VECTOR1,d0
  move.l               (sp)+,d2
  rts

_angleops_test4:
  move.l               d2,-(sp)

  ; vector1 is 1,2
  move.w                #25*64,d0
  neg.w                 d0
  move.w                #8*64,d1

  CREATE2DVECTOR        VECTOR1

  lea                  VECTOR1,a0


  jsr                  ANGLE_Q10_6


  move.w               d0,VECTOR1
  move.l               #VECTOR1,d0
  move.l               (sp)+,d2
  rts

_angleops_test5:
  move.l               d2,-(sp)

  ; vector1 is 1,2
  move.w                #25*64,d0
  move.w                #8*64,d1
  neg.w                 d1

  CREATE2DVECTOR        VECTOR1

  lea                  VECTOR1,a0


  jsr                  ANGLE_Q10_6


  move.w               d0,VECTOR1
  move.l               #VECTOR1,d0
  move.l               (sp)+,d2
  rts

_angleops_test6:
  move.l               d2,-(sp)

  ; vector1 is 1,2
  move.w                #25*64,d0
  neg.w                 d0
  move.w                #8*64,d1
  neg.w                 d1

  CREATE2DVECTOR        VECTOR1

  lea                  VECTOR1,a0


  jsr                  ANGLE_Q10_6


  move.w               d0,VECTOR1
  move.l               #VECTOR1,d0
  move.l               (sp)+,d2
  rts
