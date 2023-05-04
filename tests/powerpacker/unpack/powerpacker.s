  XDEF                 _powerpacker_test1
  XDEF                 _powerpacker_test2
  XDEF                 _powerpacker_test3
  XDEF                 _powerpacker_test4
  XDEF                 _powerpacker_test5
  XDEF                 _powerpacker_test6
  

  include              "../../../libs/powerpacker/RNC_1.S"

 
_powerpacker_test1:
  move.l               d2,-(sp)
  moveq #0,d0
  lea PACKEDLOL,a0
  lea UNPACKEDLOL,a1
  jsr Unpack
  move.l #UNPACKEDLOL,d0
  move.l               (sp)+,d2
  rts

_powerpacker_test2:
  move.l               d2,-(sp)
  moveq #0,d0
  lea POWERPACKER_TEST2_PACKED,a0
  lea POWERPACKER_TEST2_UNPACKED,a1
  jsr Unpack
  move.l #POWERPACKER_TEST2_UNPACKED,d0
  move.l               (sp)+,d2
  rts

_powerpacker_test3:
  move.l               d2,-(sp)
  moveq #0,d0
  lea POWERPACKER_TEST3_PACKED,a0
  lea POWERPACKER_TEST3_UNPACKED,a1
  jsr Unpack
  move.l #POWERPACKER_TEST3_UNPACKED,d0
  move.l               (sp)+,d2
  rts

_powerpacker_test4:
  move.l               d2,-(sp)
  moveq #0,d0
  lea POWERPACKER_TEST4_PACKED,a0
  lea POWERPACKER_TEST4_UNPACKED,a1
  jsr Unpack
  move.l #POWERPACKER_TEST4_UNPACKED,d0
  move.l               (sp)+,d2
  rts

_powerpacker_test5:
  move.l               d2,-(sp)
  moveq #0,d0
  lea POWERPACKER_TEST5_PACKED,a0
  lea POWERPACKER_TEST5_UNPACKED,a1
  jsr Unpack
  move.l #POWERPACKER_TEST5_UNPACKED,d0
  move.l               (sp)+,d2
  rts

_powerpacker_test6:
  move.l               d2,-(sp)
  moveq #0,d0
  lea POWERPACKER_TEST6_PACKED,a0
  lea POWERPACKER_TEST6_UNPACKED,a1
  jsr Unpack
  move.l #POWERPACKER_TEST6_UNPACKED,d0
  move.l               (sp)+,d2
  rts

PACKEDLOL: INCBIN expected/powerpacker.test1.RNC
  even
UNPACKEDLOL: dcb.b 54,0


POWERPACKER_TEST2_PACKED: INCBIN expected/powerpacker.test2.RNC
  even
POWERPACKER_TEST2_UNPACKED: dcb.b 51264,0

POWERPACKER_TEST3_PACKED: INCBIN expected/powerpacker.test3.rnc
  even
POWERPACKER_TEST3_UNPACKED: dcb.b 51264,0

POWERPACKER_TEST4_PACKED: INCBIN expected/powerpacker.test4.rnc
  even
POWERPACKER_TEST4_UNPACKED: dcb.b 51264,0

POWERPACKER_TEST5_PACKED: INCBIN expected/powerpacker.test5.rnc
  even
POWERPACKER_TEST5_UNPACKED: dcb.b 51264,0

POWERPACKER_TEST6_PACKED: INCBIN expected/powerpacker.test6.rnc
  even
POWERPACKER_TEST6_UNPACKED: dcb.b 51264,0