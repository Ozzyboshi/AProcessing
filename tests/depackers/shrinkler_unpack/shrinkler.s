  XDEF                 _shrinkler_test1
  XDEF                 _shrinkler_test2
  XDEF                 _shrinkler_test3
  XDEF                 _shrinkler_test4
  XDEF                 _shrinkler_test5
  XDEF                 _shrinkler_test6
  XDEF                 _shrinkler_test7
  XDEF                 _shrinkler_test8

  include              "../../../libs/packers/ShrinklerDecompress.S"

 
_shrinkler_test1:
  move.l               d2,-(sp)
  moveq #0,d0
  lea PACKEDLOL,a0
  lea UNPACKEDLOL,a1
  move.l #0,a2
  move.l #0,a3
  moveq #0,d2
  moveq #1,d7
  jsr ShrinklerDecompress
  move.l #UNPACKEDLOL,d0
  move.l               (sp)+,d2
  rts

_shrinkler_test2:
  move.l               d2,-(sp)
  moveq #0,d0
  lea SHRINKLER_TEST2_PACKED,a0
  lea SHRINKLER_TEST2_UNPACKED,a1
  move.l #0,a2
  move.l #0,a3
  moveq #0,d2
  moveq #1,d7
  jsr ShrinklerDecompress
  move.l #SHRINKLER_TEST2_UNPACKED,d0
  move.l               (sp)+,d2
  rts

_shrinkler_test3:
  move.l               d2,-(sp)
  moveq #0,d0
  lea SHRINKLER_TEST3_PACKED,a0
  lea SHRINKLER_TEST3_UNPACKED,a1
  move.l #0,a2
  move.l #0,a3
  moveq #0,d2
  moveq #1,d7
  jsr ShrinklerDecompress
  move.l #SHRINKLER_TEST3_UNPACKED,d0
  move.l               (sp)+,d2
  rts

_shrinkler_test4:
  move.l               d2,-(sp)
  moveq #0,d0
  lea SHRINKLER_TEST4_PACKED,a0
  lea SHRINKLER_TEST4_UNPACKED,a1
  move.l #0,a2
  move.l #0,a3
  moveq #0,d2
  moveq #1,d7
  jsr ShrinklerDecompress
  move.l #SHRINKLER_TEST4_UNPACKED,d0
  move.l               (sp)+,d2
  rts

_shrinkler_test5:
  move.l               d2,-(sp)
  moveq #0,d0
  lea SHRINKLER_TEST5_PACKED,a0
  lea SHRINKLER_TEST5_UNPACKED,a1
  move.l #0,a2
  move.l #0,a3
  moveq #0,d2
  moveq #1,d7
  jsr ShrinklerDecompress
  move.l #SHRINKLER_TEST5_UNPACKED,d0
  move.l               (sp)+,d2
  rts

_shrinkler_test6:
  move.l               d2,-(sp)
  moveq #0,d0
  lea SHRINKLER_TEST6_PACKED,a0
  lea SHRINKLER_TEST6_UNPACKED,a1
  move.l #0,a2
  move.l #0,a3
  moveq #0,d2
  moveq #1,d7
  jsr ShrinklerDecompress
  move.l #SHRINKLER_TEST6_UNPACKED,d0
  move.l               (sp)+,d2
  rts

_shrinkler_test7:
  move.l               d2,-(sp)
  moveq #0,d0
  lea SHRINKLER_TEST7_PACKED,a0
  lea SHRINKLER_TEST7_UNPACKED,a1
  move.l #0,a2
  move.l #0,a3
  moveq #0,d2
  moveq #1,d7
  jsr ShrinklerDecompress
  move.l #SHRINKLER_TEST7_UNPACKED,d0
  move.l               (sp)+,d2
  rts

_shrinkler_test8:
  move.l               d2,-(sp)
  moveq #0,d0
  lea SHRINKLER_TEST8_PACKED,a0
  lea SHRINKLER_TEST8_UNPACKED,a1
  move.l #0,a2
  move.l #0,a3
  moveq #0,d2
  moveq #1,d7
  jsr ShrinklerDecompress
  move.l #SHRINKLER_TEST8_UNPACKED,d0
  move.l               (sp)+,d2
  rts

PACKEDLOL: INCBIN expected/shrinkler.test1.shr
  even
UNPACKEDLOL: dcb.b 54,0


SHRINKLER_TEST2_PACKED: INCBIN expected/shrinkler.test2.shr
  even
SHRINKLER_TEST2_UNPACKED: dcb.b 51264,0

SHRINKLER_TEST3_PACKED: INCBIN expected/shrinkler.test3.shr
  even
SHRINKLER_TEST3_UNPACKED: dcb.b 51264,0

SHRINKLER_TEST4_PACKED: INCBIN expected/shrinkler.test4.shr
  even
SHRINKLER_TEST4_UNPACKED: dcb.b 51264,0

SHRINKLER_TEST5_PACKED: INCBIN expected/shrinkler.test5.shr
  even
SHRINKLER_TEST5_UNPACKED: dcb.b 51264,0

SHRINKLER_TEST6_PACKED: INCBIN expected/shrinkler.test6.shr
  even
SHRINKLER_TEST6_UNPACKED: dcb.b 51264,0

SHRINKLER_TEST7_PACKED: INCBIN expected/shrinkler.test7.shr
  even
SHRINKLER_TEST7_UNPACKED: dcb.b 124912,0

SHRINKLER_TEST8_PACKED: INCBIN expected/shrinkler.test8.shr
  even
SHRINKLER_TEST8_UNPACKED: dcb.b 124912,0