  XDEF                 _cranker_test1
  XDEF                 _cranker_test2
  XDEF                 _cranker_test3
  XDEF                 _cranker_test4
  XDEF                 _cranker_test5
  XDEF                 _cranker_test6
  XDEF                 _cranker_test7
  XDEF                 _cranker_test8
  
  include              "../../../libs/rasterizers/globaloptions.s"
  include              "../../../libs/packers/decruncher.asm"

 
_cranker_test1:
  ;cranker-0.66_linux -cd -f cranker.test1 -o cranker.test.cranker
  move.l               d2,-(sp)
  lea PACKEDLOL+4,a0
  lea UNPACKEDLOL,a1
  jsr lzodecrunch
  move.l #UNPACKEDLOL,d0
  move.l               (sp)+,d2
  rts

_cranker_test2:
  move.l               d2,-(sp)
  lea PACKEDcranker_2+4,a0
  lea UNPACKEDcranker_2,a1
  jsr lzodecrunch
  move.l #UNPACKEDcranker_2,d0
  move.l               (sp)+,d2
  rts

_cranker_test3:
  move.l               d2,-(sp)
  lea PACKEDcranker_3+4,a0
  lea UNPACKEDcranker_3,a1
  jsr lzodecrunch
  move.l #UNPACKEDcranker_3,d0
  move.l               (sp)+,d2
  rts

_cranker_test4:
  move.l               d2,-(sp)
  lea PACKEDcranker_4+4,a0
  lea UNPACKEDcranker_4,a1
  jsr lzodecrunch
  move.l #UNPACKEDcranker_4,d0
  move.l               (sp)+,d2
  rts

  _cranker_test5:
  move.l               d2,-(sp)
  lea PACKEDcranker_5+4,a0
  lea UNPACKEDcranker_5,a1
  jsr lzodecrunch
  move.l #UNPACKEDcranker_5,d0
  move.l               (sp)+,d2
  rts

_cranker_test6:
  move.l               d2,-(sp)
  lea PACKEDcranker_6+4,a0
  lea UNPACKEDcranker_6,a1
  jsr lzodecrunch
  move.l #UNPACKEDcranker_6,d0
  move.l               (sp)+,d2
  rts

_cranker_test7:
  move.l               d2,-(sp)
  lea PACKEDcranker_7+4,a0
  lea UNPACKEDcranker_7,a1
  jsr lzodecrunch
  move.l #UNPACKEDcranker_7,d0
  move.l               (sp)+,d2
  rts

_cranker_test8:
  move.l               d2,-(sp)
  lea PACKEDcranker_8+4,a0
  lea UNPACKEDcranker_8,a1
  jsr lzodecrunch
  move.l #UNPACKEDcranker_8,d0
  move.l               (sp)+,d2
  rts

PACKEDLOL: INCBIN expected/cranker.test1.crk
  even
UNPACKEDLOL: dcb.b 54,0

PACKEDcranker_2: INCBIN expected/cranker.test2.crk
  even
UNPACKEDcranker_2: dcb.b 51264,0

PACKEDcranker_3: INCBIN expected/cranker.test3.crk
  even
UNPACKEDcranker_3: dcb.b 51264,0

PACKEDcranker_4: INCBIN expected/cranker.test4.crk
  even
UNPACKEDcranker_4: dcb.b 51264,0

PACKEDcranker_5: INCBIN expected/cranker.test5.crk
  even
UNPACKEDcranker_5: dcb.b 51264,0

PACKEDcranker_6: INCBIN expected/cranker.test6.crk
  even
UNPACKEDcranker_6: dcb.b 51264,0

PACKEDcranker_7: INCBIN expected/cranker.test7.crk
  even
UNPACKEDcranker_7: dcb.b 124912,0

PACKEDcranker_8: INCBIN expected/cranker.test8.crk
  even
UNPACKEDcranker_8: dcb.b 124912,0
