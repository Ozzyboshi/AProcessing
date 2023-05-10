  XDEF                 _lz4_test1
  XDEF                 _lz4_test2
  XDEF                 _lz4_test3
  XDEF                 _lz4_test4
  XDEF                 _lz4_test5
  XDEF                 _lz4_test6
  XDEF                 _lz4_test7
  XDEF                 _lz4_test8
  
  include              "../../../libs/rasterizers/globaloptions.s"
  include              "../../../libs/packers/lz4_frame.asm"

 
_lz4_test1:
  ;lz4   -9 --no-frame-crc lz4.test1 lz4.test.lz4
  move.l               d2,-(sp)
  move.l #29,d0
  lea PACKEDLOL,a0
  lea UNPACKEDLOL,a1
  jsr lz4_frame_depack
  move.l #UNPACKEDLOL,d0
  move.l               (sp)+,d2
  rts

_lz4_test2:
  ;lz4   -9 --no-frame-crc lz4.test1 lz4.test.lz4
  move.l               d2,-(sp)
  move.l #51264,d0
  lea PACKEDLZ4_2,a0
  lea UNPACKEDLZ4_2,a1
  jsr lz4_frame_depack
  move.l #UNPACKEDLZ4_2,d0
  move.l               (sp)+,d2
  rts

_lz4_test3:
  ;lz4   -9 --no-frame-crc lz4.test1 lz4.test.lz4
  move.l               d2,-(sp)
  move.l #51264,d0
  lea PACKEDLZ4_3,a0
  lea UNPACKEDLZ4_3,a1
  jsr lz4_frame_depack
  move.l #UNPACKEDLZ4_3,d0
  move.l               (sp)+,d2
  rts

_lz4_test4:
  ;lz4   -9 --no-frame-crc lz4.test1 lz4.test.lz4
  move.l               d2,-(sp)
  move.l #51264,d0
  lea PACKEDLZ4_4,a0
  lea UNPACKEDLZ4_4,a1
  jsr lz4_frame_depack
  move.l #UNPACKEDLZ4_4,d0
  move.l               (sp)+,d2
  rts

  _lz4_test5:
  ;lz4   -9 --no-frame-crc lz4.test1 lz4.test.lz4
  move.l               d2,-(sp)
  move.l #51264,d0
  lea PACKEDLZ4_5,a0
  lea UNPACKEDLZ4_5,a1
  jsr lz4_frame_depack
  move.l #UNPACKEDLZ4_5,d0
  move.l               (sp)+,d2
  rts

_lz4_test6:
  ;lz4   -9 --no-frame-crc lz4.test1 lz4.test.lz4
  move.l               d2,-(sp)
  move.l #51264,d0
  lea PACKEDLZ4_6,a0
  lea UNPACKEDLZ4_6,a1
  jsr lz4_frame_depack
  move.l #UNPACKEDLZ4_6,d0
  move.l               (sp)+,d2
  rts

_lz4_test7:
  ;lz4   -9 --no-frame-crc lz4.test1 lz4.test.lz4
  move.l               d2,-(sp)
  move.l #124912,d0
  lea PACKEDLZ4_7,a0
  lea UNPACKEDLZ4_7,a1
  jsr lz4_frame_depack
  move.l #UNPACKEDLZ4_7,d0
  move.l               (sp)+,d2
  rts

_lz4_test8:
  ;lz4   -9 --no-frame-crc lz4.test1 lz4.test.lz4
  move.l               d2,-(sp)
  move.l #124912,d0
  lea PACKEDLZ4_8,a0
  lea UNPACKEDLZ4_8,a1
  jsr lz4_frame_depack
  move.l #UNPACKEDLZ4_8,d0
  move.l               (sp)+,d2
  rts

PACKEDLOL: INCBIN expected/lz4.test.lz4
  even
UNPACKEDLOL: dcb.b 54,0

PACKEDLZ4_2: INCBIN expected/lz4.test2.lz4
  even
UNPACKEDLZ4_2: dcb.b 51264,0

PACKEDLZ4_3: INCBIN expected/lz4.test3.lz4
  even
UNPACKEDLZ4_3: dcb.b 51264,0

PACKEDLZ4_4: INCBIN expected/lz4.test4.lz4
  even
UNPACKEDLZ4_4: dcb.b 51264,0

PACKEDLZ4_5: INCBIN expected/lz4.test5.lz4
  even
UNPACKEDLZ4_5: dcb.b 51264,0

PACKEDLZ4_6: INCBIN expected/lz4.test6.lz4
  even
UNPACKEDLZ4_6: dcb.b 51264,0

PACKEDLZ4_7: INCBIN expected/lz4.test7.lz4
  even
UNPACKEDLZ4_7: dcb.b 124912,0

PACKEDLZ4_8: INCBIN expected/lz4.test8.lz4
  even
UNPACKEDLZ4_8: dcb.b 124912,0
