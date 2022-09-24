  XDEF                 _vectorssimpleops_test1
  XDEF                 _vectorssimpleops_test2
  XDEF                 _vectorssimpleops_test3
  XDEF                 _vectorssimpleops_test4
  XDEF                 _vectorssimpleops_test5
  XDEF                 _vectorssimpleops_test6
  XDEF                 _vectorssimpleops_test7
  XDEF                 _vectorssimpleops_test8
  XDEF                 _vectorssimpleops_test9
  XDEF                 _vectorssimpleops_test10
  XDEF                 _vectorssimpleops_test11
  XDEF                 _vectorssimpleops_test12
  XDEF                 _vectorssimpleops_test13
  XDEF                 _vectorssimpleops_test14
  XDEF                 _vectorssimpleops_test15
  XDEF                 _vectorssimpleops_test16
  XDEF                 _vectorssimpleops_test17
  XDEF                 _vectorssimpleops_test18
  XDEF                 _vectorssimpleops_test19
  XDEF                 _vectorssimpleops_test20
  XDEF                 _vectorssimpleops_test21
  XDEF                 _vectorssimpleops_test22
  XDEF                 _vectorssimpleops_test23
  XDEF                 _vectorssimpleops_test24
  XDEF                 _vectorssimpleops_test25
  XDEF                 _vectorssimpleops_test26
  XDEF                 _vectorssimpleops_test27
  XDEF                 _vectorssimpleops_test28

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

  ; vector 1 is 5,6
  lea VECTOR2,a6
  moveq                #5,d0
  moveq                #6,d1
  CREATE2DVECTOR       a6

  move.l               #VECTOR2,d0                                    ; returns addr in d0
  move.l               (sp)+,d2
  rts

_vectorssimpleops_test9:
  move.l               d2,-(sp)

  ; vector 1 is 10,11
  lea VECTOR1,a0
  moveq                #$A,d0
  moveq                #$B,d1
  CREATE2DVECTOR       a0

  move.l               #VECTOR1,d0                                    ; returns addr in d0
  move.l               (sp)+,d2
  rts

_vectorssimpleops_test10:
  move.l               d2,-(sp)

  ; vector 1 is 3,4
  lea VECTOR1,a0
  moveq                #$3,d0
  moveq                #$4,d1
  CREATE2DVECTOR       a0
  GET2DMAGNITUDE
  move.w d0,(a0)
  move.l               #VECTOR1,d0
  move.l               (sp)+,d2
  rts

_vectorssimpleops_test11:
  move.l               d2,-(sp)

  ; vector 1 is 3,4
  lea VECTOR1,a0
  moveq                #-3,d0
  moveq                #-4,d1
  CREATE2DVECTOR       a0
  GET2DMAGNITUDE
  move.w d0,(a0)
  move.l               #VECTOR1,d0
  move.l               (sp)+,d2
  rts

_vectorssimpleops_test12:
  move.l               d2,-(sp)

  ; vector 1 is 3*64,4*64
  lea VECTOR1,a0
  move.w               #3*64,d0
  move.w               #4*64,d1
  CREATE2DVECTOR       a0
  GET2DMAGNITUDE
  move.w d0,(a0)
  move.l               #VECTOR1,d0
  move.l               (sp)+,d2
  rts

_vectorssimpleops_test13:
  move.l               d2,-(sp)

  ; vector 1 is 3,4
  lea                  VECTOR1,a0
  move.w               #3,d0
  move.w               #4,d1
  CREATE2DVECTOR       a0
  
  moveq #100,d7
  jsr                  SET2DMAGNITUDE
  move.l               #VECTOR1,d0
  move.l               (sp)+,d2
  rts

_vectorssimpleops_test14:
  move.l               d2,-(sp)

  ; vector 1 is 3*64,4*64
  lea VECTOR1,a0
  move.w               #3*64,d0
  move.w               #4*64,d1
  CREATE2DVECTOR       a0
  
  moveq #100,d7
  jsr                  SET2DMAGNITUDE
  move.l               #VECTOR1,d0
  move.l               (sp)+,d2
  rts

_vectorssimpleops_test15:
  move.l               d2,-(sp)

  ; vector 1 is 3*64,4*64
  lea VECTOR1,a0
  move.w               #-3*64,d0
  move.w               #4*64,d1
  CREATE2DVECTOR       a0
  
  moveq                #100,d7
  jsr                  SET2DMAGNITUDE
  move.l               #VECTOR1,d0
  move.l               (sp)+,d2
  rts

_vectorssimpleops_test16:
  move.l               d2,-(sp)

  ; vector 1 is $90,$30
  lea VECTOR1,a0
  move.w               #$90,d0
  move.w               #$30,d1
  CREATE2DVECTOR       a0

  ; vector 2 is $60,$A0
  lea VECTOR2,a0
  move.w               #$60,d0
  move.w               #$a0,d1
  CREATE2DVECTOR       a0

  lea                  VECTOR2,a0
  lea                  VECTOR1,a1

  SUB2DVECTORSTATIC    VECTOR3

  ; set magnitude 3
  moveq                #3,d7
  lea                  VECTOR3,a0
  jsr                  SET2DMAGNITUDE

  lea                  VECTOR3,a0
  lea                  VECTOR1,a1
  ADD2DVECTOR

  move.l               #VECTOR1,d0
  move.l               (sp)+,d2
  rts

_vectorssimpleops_test17:
  move.l               d2,-(sp)

  ; vector 1 is $90,$30
  lea VECTOR1,a0
  move.w               #$90,d0
  move.w               #$30,d1
  CREATE2DVECTOR       a0

  ; vector 2 is $60,$A0
  lea VECTOR2,a0
  move.w               #$90,d0
  move.w               #$a0,d1
  CREATE2DVECTOR       a0

  lea                  VECTOR2,a0
  lea                  VECTOR1,a1

  SUB2DVECTORSTATIC    VECTOR3

  ; set magnitude 1
  moveq                #1,d7
  lea                  VECTOR3,a0
  jsr                  SET2DMAGNITUDE

  lea                  VECTOR3,a0
  lea                  VECTOR1,a1
  ADD2DVECTOR

  move.l               #VECTOR1,d0
  move.l               (sp)+,d2
  rts

_vectorssimpleops_test18:
  move.l               d2,-(sp)

  ; vector 1 is $90,$30
  lea VECTOR1,a0
  move.w               #$90,d0
  move.w               #$a0,d1
  CREATE2DVECTOR       a0

  ; vector 2 is $60,$A0
  lea VECTOR2,a0
  move.w               #$90,d0
  move.w               #$30,d1
  CREATE2DVECTOR       a0

  lea                  VECTOR2,a0
  lea                  VECTOR1,a1

  SUB2DVECTORSTATIC    VECTOR3

  ; set magnitude 1
  moveq                #1,d7
  lea                  VECTOR3,a0
  jsr                  SET2DMAGNITUDE

  lea                  VECTOR3,a0
  lea                  VECTOR1,a1
  ADD2DVECTOR

  move.l               #VECTOR1,d0
  move.l               (sp)+,d2
  rts

_vectorssimpleops_test19:
  move.l               d2,-(sp)

  ; vector 1 is $90,$30
  lea VECTOR1,a0
  move.w               #$90,d0
  move.w               #$30,d1
  CREATE2DVECTOR       a0

  ; vector 2 is $60,$A0
  lea VECTOR2,a0
  move.w               #$80,d0
  move.w               #$30,d1
  CREATE2DVECTOR       a0

  lea                  VECTOR2,a0
  lea                  VECTOR1,a1

  SUB2DVECTORSTATIC    VECTOR3

  ; set magnitude 1
  moveq                #1,d7
  lea                  VECTOR3,a0
  jsr                  SET2DMAGNITUDE

  lea                  VECTOR3,a0
  lea                  VECTOR1,a1
  ADD2DVECTOR

  move.l               #VECTOR1,d0
  move.l               (sp)+,d2
  rts

_vectorssimpleops_test20:
  move.l               d2,-(sp)

  ; vector 1 is $90,$30
  lea VECTOR1,a0
  move.w               #$80,d0
  move.w               #$30,d1
  CREATE2DVECTOR       a0

  ; vector 2 is $60,$A0
  lea VECTOR2,a0
  move.w               #$90,d0
  move.w               #$30,d1
  CREATE2DVECTOR       a0

  lea                  VECTOR2,a0
  lea                  VECTOR1,a1

  SUB2DVECTORSTATIC    VECTOR3

  ; set magnitude 1
  moveq                #1,d7
  lea                  VECTOR3,a0
  jsr                  SET2DMAGNITUDE

  lea                  VECTOR3,a0
  lea                  VECTOR1,a1
  ADD2DVECTOR

  move.l               #VECTOR1,d0
  move.l               (sp)+,d2
  rts

_vectorssimpleops_test21:
  move.l               d2,-(sp)

  ; vector 1 is $90,$30
  move.w               #$80,d0
  move.w               #$30,d1
  CREATE2DVECTOR       VECTOR1

  ; vector 2 is $60,$A0
  move.w               #$80,d0
  move.w               #$30,d1
  CREATE2DVECTOR       VECTOR2

  lea                  VECTOR2,a0
  lea                  VECTOR1,a1

  SUB2DVECTORSTATIC    VECTOR3

  ; set magnitude 1
  moveq                #10,d7
  lea                  VECTOR3,a0
  jsr                  SET2DMAGNITUDE

  lea                  VECTOR3,a0
  lea                  VECTOR1,a1
  ADD2DVECTOR

  move.l               #VECTOR1,d0
  move.l               (sp)+,d2
  rts

_vectorssimpleops_test22:
  move.l               d2,-(sp)

  ; vector 1 is $30,$90
  move.w               #$30,d0 ; 48
  move.w               #$90,d1 ; 144
  asl.w #6,d0
  asl.w #6,d1
  
  CREATE2DVECTOR       VECTOR1

  ; vector 2 is $a0,$90
  move.w               #$a0,d0 ; 160
  move.w               #$98,d1 ; 152
  asl.w #6,d0
  asl.w #6,d1
  
  CREATE2DVECTOR       VECTOR2

  lea                  VECTOR2,a0
  lea                  VECTOR1,a1

  SUB2DVECTORSTATIC    VECTOR3

  ; set magnitude 1
  move.w                #1*64,d7
  lea                  VECTOR3,a0
  jsr                  SET2DMAGNITUDE_FAKE

  lea                  VECTOR3,a0
  lea                  VECTOR1,a1
  ADD2DVECTOR

  move.l               #VECTOR1,d0
  move.l               (sp)+,d2
  rts

_vectorssimpleops_test23:
  move.l               d2,-(sp)

  ; vector 1 is $30,$90
  move.w               #$2400,d0 ; 48
  move.w               #$0c00,d1 ; 144
  
  CREATE2DVECTOR       VECTOR1

  ; vector 2 is $a0,$90
  move.w               #$2300,d0 ; 160
  move.w               #$0c00,d1 ; 152
  
  CREATE2DVECTOR       VECTOR2

  lea                  VECTOR2,a0
  lea                  VECTOR1,a1

  SUB2DVECTORSTATIC    VECTOR3

  ; set magnitude 1
  move.w                #1*64,d7
  lea                  VECTOR3,a0
  jsr                  SET2DMAGNITUDE_FAKE

  lea                  VECTOR3,a0
  lea                  VECTOR1,a1
  ADD2DVECTOR

  move.l               #VECTOR1,d0
  move.l               (sp)+,d2
  rts

_vectorssimpleops_test24:
  move.l               d2,-(sp)
  move.w                #$ff00,d0
  moveq                #0,d1
  CREATE2DVECTOR       VECTOR1

  ; set magnitude 1
  move.w                #1*64,d7
  lea                  VECTOR1,a0
  jsr                  SET2DMAGNITUDE_FAKE

  move.l               #VECTOR1,d0
  move.l               (sp)+,d2
  rts

_vectorssimpleops_test25:
  move.l               d2,-(sp)
  move.w                #100,d0
  move.w                #100,d1
  CREATE2DVECTOR       VECTOR1

  move.w                #10,d7
  lea                  VECTOR1,a0
  jsr                  LIMIT2DVECTOR

  move.l               #VECTOR1,d0
  move.l               (sp)+,d2
  rts

_vectorssimpleops_test26:
  move.l               d2,-(sp)
  move.w                #100,d0
  move.w                #-100,d1
  CREATE2DVECTOR       VECTOR1

  move.w                #10,d7
  lea                  VECTOR1,a0
  jsr                  LIMIT2DVECTOR

  move.l               #VECTOR1,d0
  move.l               (sp)+,d2
  rts

_vectorssimpleops_test27:
  move.l               d2,-(sp)
  move.w                #10,d0
  move.w                #20,d1
  CREATE2DVECTOR       VECTOR1

  move.w                #2,d7
  lea                  VECTOR1,a0
  jsr                  LIMIT2DVECTOR

  move.l               #VECTOR1,d0
  move.l               (sp)+,d2
  rts

_vectorssimpleops_test28:
  move.l               d2,-(sp)
  move.w                #10,d0
  move.w                #20,d1
  CREATE2DVECTOR       VECTOR1

  move.w                #25,d7
  lea                  VECTOR1,a0
  jsr                  LIMIT2DVECTOR

  move.l               #VECTOR1,d0
  move.l               (sp)+,d2
  rts
