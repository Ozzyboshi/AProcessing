  XDEF                 _precalcsimpleops_test1
  XDEF                 _precalcsimpleops_test2
  XDEF                 _precalcsimpleops_test3
  XDEF                 _precalcsimpleops_test4
  XDEF                 _precalcsimpleops_test5
  XDEF                 _precalcsimpleops_test6
  XDEF                 _precalcsimpleops_test7
  XDEF                 _precalcsimpleops_test8
  XDEF                 _precalcsimpleops_test9
  XDEF                 _precalcsimpleops_test10
  XDEF                 _precalcsimpleops_test11
  XDEF                 _precalcsimpleops_test12
  XDEF                 _precalcsimpleops_test13
  XDEF                 _precalcsimpleops_test14
  XDEF                 _precalcsimpleops_test15
  XDEF                 _precalcsimpleops_test16
  XDEF                 _precalcsimpleops_test17
  XDEF                 _precalcsimpleops_test18
  XDEF                 _precalcsimpleops_test19
  XDEF                 _precalcsimpleops_test20

  include              "../../../libs/rasterizers/globaloptions.s"
  include              "../../../libs/precalc/precalc_by_sin.s"
  include              "../../../libs/precalc/precalc_col_table.s"
  include              "../../../libs/precalc/double_byte.s"
  include              "../../../libs/precalc/half_word.s"
  include              "../../../libs/precalc/bubble_sort_4_bytes.s"
  include              "../../../libs/precalc/map.s"
  include              "../../../libs/precalc/dec2txt.s"
  include              "../../../libs/trigtables_sin.i"
  include              "../../../libs/trigtables.i"
  include              "../../../libs/ammxmacros.i"
  include              "../../../libs/precalc/mirror_word_macro.s"
  include              "../../../libs/precalc/mirror_word_function.s"

 
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

COLORSTABLE1: dcb.w 16,$00

_precalcsimpleops_test3:
  move.l               d2,-(sp)
  moveq #16-1,d7
  lea COLORSTABLE1,a0
precalcsimpleops_test3_clearloop:
  move.w #0,(a0)+
  dbra d7,precalcsimpleops_test3_clearloop
  move.w #$0000,d0
  move.w #$0fff,d1
  moveq  #16-1,d7
  lea COLORSTABLE1,a0
    
  jsr buildcolortable
  move.l               #COLORSTABLE1,d0                                    ; returns addr in d0
  move.l               (sp)+,d2
  rts

_precalcsimpleops_test4:
  move.l               d2,-(sp)
  moveq #16-1,d7
  lea COLORSTABLE1,a0
precalcsimpleops_test4_clearloop:
  move.w #0,(a0)+
  dbra d7,precalcsimpleops_test4_clearloop
  move.w #$0000,d1
  move.w #$0fff,d0
  moveq  #16-1,d7
  lea COLORSTABLE1,a0
    
  jsr buildcolortable
  move.l               #COLORSTABLE1,d0                                    ; returns addr in d0
  move.l               (sp)+,d2
  rts

_precalcsimpleops_test5:
  move.l               d2,-(sp)
  moveq #16-1,d7
  lea COLORSTABLE1,a0
precalcsimpleops_test5_clearloop:
  move.w #0,(a0)+
  dbra d7,precalcsimpleops_test5_clearloop
  move.w #$0de8,d0
  move.w #$0315,d1
  moveq  #16-1,d7
  lea COLORSTABLE1,a0
    
  jsr buildcolortable
  move.l               #COLORSTABLE1,d0                                    ; returns addr in d0
  move.l               (sp)+,d2
  rts

COLORSTABLE2: dcb.w 32,$00
_precalcsimpleops_test6:
  move.l               d2,-(sp)
  moveq #32-1,d7
  lea COLORSTABLE2,a0
precalcsimpleops_test6_clearloop:
  move.w #0,(a0)+
  dbra d7,precalcsimpleops_test6_clearloop
  move.w #$0de8,d0
  move.w #$0315,d1
  moveq  #32-1,d7
  lea COLORSTABLE2,a0
    
  jsr buildcolortable
  move.l               #COLORSTABLE2,d0                                    ; returns addr in d0
  move.l               (sp)+,d2
  rts

COLORSTABLE3: dcb.w 64,$00
_precalcsimpleops_test7:
  move.l               d2,-(sp)
  moveq #64-1,d7
  lea COLORSTABLE3,a0
precalcsimpleops_test7_clearloop:
  move.w #0,(a0)+
  dbra d7,precalcsimpleops_test7_clearloop
  move.w #$0de8,d0
  move.w #$0315,d1
  moveq  #64-1,d7
  lea COLORSTABLE3,a0
    
  jsr buildcolortable
  move.l               #COLORSTABLE3,d0                                    ; returns addr in d0
  move.l               (sp)+,d2
  rts

_precalcsimpleops_test8:
  move.l               d2,-(sp)
  move.w #%00001110,d0
  jsr DOUBLE_BYTE
  move.w               d0,COLORSTABLE1
  move.l               #COLORSTABLE1,d0                                    ; returns addr in d0
  move.l               (sp)+,d2
  rts

SKY_COLORSTABLE_0:
  dcb.w 128,$00
  
_precalcsimpleops_test9:
  move.l               d2,-(sp)
  move.w #$0006,d0
  move.w #$0b36,d1
  moveq  #(128/2)-1,d7
  lea SKY_COLORSTABLE_0,a0
  jsr buildcolortable

  move.w #$0b36,d0
  move.w #$0003,d1
  moveq  #(128/2)-1,d7
  lea SKY_COLORSTABLE_0+128/2*2,a0
  jsr buildcolortable
  move.l #SKY_COLORSTABLE_0,d0
  move.l               (sp)+,d2
  rts

mapdata: dc.w 0
_precalcsimpleops_test10:
  move.l               d2,-(sp)
  move.w #127,d0
  move.w #0,d1
  move.w #254,d2
  move.w #500,d3
  move.w #5500,d4
  jsr MAP
  move.w d4,mapdata
  move.l #mapdata,d0
  move.l               (sp)+,d2
  rts

_precalcsimpleops_test11:
  move.l               d2,-(sp)
  move.w #700,d0
  move.w #500,d1
  move.w #5500,d2
  move.w #0,d3
  move.w #254,d4
  jsr MAP
  move.w d4,mapdata
  move.l #mapdata,d0
  move.l               (sp)+,d2
  rts

_precalcsimpleops_test12:
  move.l               d2,-(sp)
  move.w #10,d0
  move.w #-10,d1
  move.w #10,d2
  move.w #-160,d3
  move.w #160,d4
  jsr MAP
  move.w d4,mapdata
  move.l #mapdata,d0
  move.l               (sp)+,d2
  rts

_precalcsimpleops_test13:
  move.l               d2,-(sp)
  move.w #10,d0
  move.w #-160,d1
  move.w #160,d2
  move.w #-10,d3
  move.w #10,d4
  jsr MAP
  move.w d4,mapdata
  move.l #mapdata,d0
  move.l               (sp)+,d2
  rts

buffer: dc.b 0,0,0,0,0,0

_precalcsimpleops_test14:
  move.l               d2,-(sp)
  move.l #0,buffer
  move.l #0,buffer+2
  lea     buffer,a0    ;pointer to the buffer
  move.w    #12345,d1     ;number to convert
  jsr dec2txt

  move.l #buffer,d0
  move.l               (sp)+,d2
  rts

_precalcsimpleops_test15:
  move.l               d2,-(sp)
  move.l #0,buffer
  move.l #0,buffer+2
  lea     buffer,a0    ;pointer to the buffer
  move.l    #$FFFF3039,d1     ;number to convert
  jsr dec2txt

  move.l #buffer,d0
  move.l               (sp)+,d2
  rts

_precalcsimpleops_test16:
  move.l               d2,-(sp)
  move.w #%0000111000001110,d0
  jsr HALF_WORD
  move.b               d0,COLORSTABLE1
  move.l               #COLORSTABLE1,d0                                    ; returns addr in d0
  move.l               (sp)+,d2
  rts

_precalcsimpleops_test17:
  move.l               d2,-(sp)
  move.w #%1101001000101110,d0
  jsr HALF_WORD
  move.b               d0,COLORSTABLE1
  move.l               #COLORSTABLE1,d0                                    ; returns addr in d0
  move.l               (sp)+,d2
  rts

A: dc.l MOVERS
   dc.l MOVERS2
   dc.l MOVERS3

B: dc.l MOVERS
   dc.l MOVERS2
   dc.l MOVERS3
   dc.l MOVERS4
   dc.l MOVERS5
   dc.l MOVERS6
   dc.l MOVERS7
   dc.l MOVERS8
   dc.l MOVERS9
   dc.l MOVERS10


MOVERS:
    dc.w 1,20
MOVERS2:
    dc.w 2,100
MOVERS3:
    dc.w 3,5
MOVERS4:
    dc.w 4,20
MOVERS5:
    dc.w 5,11
MOVERS6:
    dc.w 6,9
MOVERS7:
    dc.w 7,7
MOVERS8:
    dc.w 8,2
MOVERS9:
    dc.w 9,3
MOVERS10:
    dc.w 10,256

RES: dc.l 0,0,0

RES2: dc.l 0,0,0,0,0,0,0,0,0,0

compare_function:
    movem.l d0/a5/a6,-(sp)
    move.l (a5),a5
    move.l (a6),a6
    move.w 2(a5),d0
    moveq #0,d5
    cmp.w 2(a6),d0
    smi d5
    movem.l (sp)+,d0/a5/a6
    rts

_precalcsimpleops_test18:
  move.l              d2,-(sp)
  lea                 A,a0
  move.w              #3,d7
  lea                 compare_function,a2

  jsr                 bubble_sort_4_bytes

  lea RES,a1
  move.l A,a0
  move.l (a0),(a1)+    
  move.l A+4,a0
  move.l (a0),(a1)+
  move.l A+8,a0
  move.l (a0),(a1)+

  move.l              #RES,d0                                    ; returns addr in d0
  move.l              (sp)+,d2
  rts

_precalcsimpleops_test19:
  move.l              d2,-(sp)
  lea                 B,a0
  move.w              #10,d7
  lea                 compare_function,a2
  jsr                 bubble_sort_4_bytes

  lea RES2,a1
  move.l B,a0
  move.l (a0),(a1)+    
  move.l B+4,a0
  move.l (a0),(a1)+
  move.l B+8,a0
  move.l (a0),(a1)+
  move.l B+12,a0
  move.l (a0),(a1)+
  move.l B+16,a0
  move.l (a0),(a1)+
  move.l B+20,a0
  move.l (a0),(a1)+
  move.l B+24,a0
  move.l (a0),(a1)+
  move.l B+28,a0
  move.l (a0),(a1)+
  move.l B+32,a0
  move.l (a0),(a1)+
  move.l B+36,a0
  move.l (a0),(a1)+
  move.l              #RES2,d0                                    ; returns addr in d0
  move.l              (sp)+,d2
  rts

_precalcsimpleops_test20:
  move.l               d2,-(sp)
  move.w #%1101001000101110,d0
  jsr MIRROR_WORD_F
  move.w               d1,COLORSTABLE1
  move.l               #COLORSTABLE1,d0                                    ; returns addr in d0
  move.l               (sp)+,d2
  rts