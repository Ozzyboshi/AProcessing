  XDEF                 _vectorssimpleops_test1
  XDEF                 _vectorssimpleops_test2
  XDEF                 _vectorssimpleops_test3
  XDEF                 _vectorssimpleops_test4
  XDEF                 _vectorssimpleops_test5
  XDEF                 _vectorssimpleops_test6
  XDEF                 _vectorssimpleops_test7
  XDEF                 _vectorssimpleops_test8
  XDEF                 _vectorssimpleops_test9

  include              "../../../libs/rasterizers/globaloptions.s"
  include              "../../../libs/vectors/operations.s"
  include              "../../../libs/ammxmacros.i"

VECTOR1:
  dc.l                 0

VECTOR2:
  dc.l                 0

VECTOR3:
  dc.l                 0
 
_vectorssimpleops_test1:
  move.l               d2,-(sp)

  ; vector 1 is 3,4
  moveq                #3,d0
  moveq                #4,d1
  CREATE2DVECTOR       VECTOR1

  ; vector 2 is 5,6
  moveq                #5,d0
  moveq                #6,d1
  CREATE2DVECTOR       VECTOR2

  ; Add them
  lea                  VECTOR1,a0
  lea                  VECTOR2,a1
  ADD2DVECTORSTATIC    VECTOR3

  move.l               #VECTOR3,d0                                    ; returns addr in d0
  move.l               (sp)+,d2
  rts



_vectorssimpleops_test2:
  move.l               d2,-(sp)

  ; vector 1 is 3,4
  moveq                #3,d0
  moveq                #4,d1
  CREATE2DVECTOR       VECTOR1

  ; vector 2 is 5,6
  moveq                #5,d0
  moveq                #7,d1
  CREATE2DVECTOR       VECTOR2

  lea                  VECTOR1,a0
  lea                  VECTOR2,a1

  ; sub them
  SUB2DVECTORSTATIC    VECTOR3

  move.l               #VECTOR3,d0                                    ; returns addr in d0
  move.l               (sp)+,d2
  rts



_vectorssimpleops_test3:
  move.l               d2,-(sp)

  ; vector 1 is 3,4
  moveq                #3,d0
  moveq                #4,d1
  CREATE2DVECTOR       VECTOR1

  ; vector 2 is 5,6
  moveq                #5,d0
  moveq                #7,d1
  CREATE2DVECTOR       VECTOR2

  lea                  VECTOR1,a0
  lea                  VECTOR2,a1

  ; sub them
  MUL2DVECTORSTATIC    VECTOR3

  move.l               #VECTOR3,d0                                    ; returns addr in d0
  move.l               (sp)+,d2
  rts



_vectorssimpleops_test4:
  move.l               d2,-(sp)

  ; vector 1 is 3,4
  moveq                #3,d0
  moveq                #4,d1
  CREATE2DVECTOR       VECTOR1

  ; vector 2 is 5,6
  moveq                #5,d0
  moveq                #6,d1
  CREATE2DVECTOR       VECTOR2

  ; Add them
  lea                  VECTOR1,a0
  lea                  VECTOR2,a1
  ADD2DVECTOR

  move.l               #VECTOR2,d0                                    ; returns addr in d0
  move.l               (sp)+,d2
  rts

_vectorssimpleops_test5:
  move.l               d2,-(sp)

  ; vector 1 is 3,4
  moveq                #3,d0
  moveq                #4,d1
  CREATE2DVECTOR       VECTOR1

  ; vector 2 is 5,6
  moveq                #5,d0
  moveq                #7,d1
  CREATE2DVECTOR       VECTOR2

  ; Add them
  lea                  VECTOR1,a0
  lea                  VECTOR2,a1
  SUB2DVECTOR

  move.l               #VECTOR2,d0                                    ; returns addr in d0
  move.l               (sp)+,d2
  rts

_vectorssimpleops_test6:
  move.l               d2,-(sp)

  ; vector 1 is 3,4
  moveq                #3,d0
  moveq                #4,d1
  CREATE2DVECTOR       VECTOR1

  ; vector 2 is 5,6
  moveq                #5,d0
  moveq                #7,d1
  CREATE2DVECTOR       VECTOR2

  lea                  VECTOR1,a0
  lea                  VECTOR2,a1

  ; mul them
  MUL2DVECTOR

  move.l               #VECTOR2,d0                                    ; returns addr in d0
  move.l               (sp)+,d2
  rts

_vectorssimpleops_test7:
  move.l               d2,-(sp)

  ; vector 1 is 3,4
  moveq                #3,d0
  moveq                #4,d1
  CREATE2DVECTOR       VECTOR1

  move.l               #VECTOR1,d0                                    ; returns addr in d0
  move.l               (sp)+,d2
  rts

_vectorssimpleops_test8:
  move.l               d2,-(sp)

  ; vector 1 is 3,4
  lea VECTOR2,a6
  moveq                #5,d0
  moveq                #6,d1
  CREATE2DVECTOR       a6

  move.l               #VECTOR2,d0                                    ; returns addr in d0
  move.l               (sp)+,d2
  rts

_vectorssimpleops_test9:
  move.l               d2,-(sp)

  ; vector 1 is 3,4
  lea VECTOR1,a0
  moveq                #$A,d0
  moveq                #$B,d1
  CREATE2DVECTOR       a0

  move.l               #VECTOR1,d0                                    ; returns addr in d0
  move.l               (sp)+,d2
  rts