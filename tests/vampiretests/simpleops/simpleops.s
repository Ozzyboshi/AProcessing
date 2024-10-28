  XDEF                 _vampire_test1
  XDEF                 _vampire_test2
  XDEF                 _vampire_test3
  XDEF                 _vampire_test4
  XDEF                 _vampire_test5
  XDEF                 _vampire_test6
  XDEF                 _vampire_test7
  XDEF                 _vampire_test8
  XDEF                 _vampire_test9
  XDEF                 _vampire_test10
  XDEF                 _vampire_test11
  XDEF                 _vampire_test12
  XDEF                 _vampire_test13
  XDEF                 _vampire_test14
  XDEF                 _vampire_test15
  XDEF                 _vampire_test16
  XDEF                 _vampire_test17
  XDEF                 _vampire_test18
  XDEF                 _vampire_test19
  XDEF                 _vampire_test20
  XDEF                 _vampire_test21
  XDEF                 _vampire_test22
  XDEF                 _vampire_test23
  XDEF                 _vampire_test24
  XDEF                 _vampire_test25
  XDEF                 _vampire_test26
  XDEF                 _vampire_test27
  XDEF                 _vampire_test28
  XDEF                 _vampire_test29
  XDEF                 _vampire_test30
  XDEF                 _vampire_test31
  XDEF                 _vampire_test32
  include              "../../../libs/rasterizers/globaloptions.s"
  include              "../../../libs/vampfpu/cmp8bytesex.s"

 
 RESULT: dc.l 0,0
_vampire_test1:
  LOAD               #$1234567812345678,d1
  lea                RESULT,a0
  STORE              d1,(a0)
  move.l             #RESULT,d0
  rts
_vampire_test2:
  LOAD               #$9876543223456789,E1
  lea                RESULT,B0
  STORE              E1,(B0)
  move.l             #RESULT,d0
  rts
_vampire_test3:
  LOAD               #$1234567812345678,E1
  LSLQ               #60,E1,E2
  lea                RESULT,B0
  STORE              E2,(B0)
  move.l             #RESULT,d0
  rts
_vampire_test4:
  LOAD               #$1234567812345678,E1
  LSRQ               #60,E1,E2
  lea                RESULT,B0
  STORE              E2,(B0)
  move.l             #RESULT,d0
  rts

; LOADI test
TEST5_data:          dc.l $56781234,$12349876,$12345678,$09876543,$34567812,$87654309
_vampire_test5:
  lea                TEST5_data,a0 ; a0 now points to our dummy data we want to LOAD into data registers
  moveq              #1,D0         ; let's say we want to load into D1, we put value 1 into D0
  LOADI              (a0),d0 ; Load 8 bytes from A0 and put them into d1 (d0 contains index 1)

  lea                RESULT,B0
  STORE              d1,(B0)
  move.l             #RESULT,d0
  rts

; LOADI test
_vampire_test6:
  lea                TEST5_data,a0 ; a0 now points to our dummy data we want to LOAD into data registers
  moveq              #40,D0         ; let's say we want to load into E0, we put value 1 into D0

  moveq              #3-1,d7
test6loop:
  LOADI              (a0)+,d0 ; Load 8 bytes from A0 and put them into d1 (d0 contains index 1)
  addq               #1,d0
  dbra               d7,test6loop
  lea                RESULT,B0
  STORE              E0,(B0)
  move.l             #RESULT,d0
  rts

_vampire_test7:
  LOAD               #$5676545432322121,d1
  moveq              #1,D0         ; let's say we want to store into D1, we put value 1 into D0
  lea                RESULT,B0
  STOREI              d0,(b0) ; Store 8 bytes from D1 and put them  at addr b0
  move.l             #RESULT,d0
  rts

RESULTTEST8: dc.l -1,-1
_vampire_test8:
  LOAD               #$5676545432322121,E0
  move.b              #$F0,D0         ; let's say we want to store only first 4 bytes, we set the upper nibble

  lea                RESULTTEST8,B0
  STOREM             E0,d0,(b0) ; Store 4 bytes from E0 and put them  at addr b0 - result 5676 5454 ffff ffff
  move.l             #RESULTTEST8,d0
  rts

RESULTTEST9: dc.l -1,-1
_vampire_test9:
  LOAD               #$5676545432322121,E0
  move.b              #%10101010,D0         ; let's say we want to store into D1, we put value 1 into D0
  lea                RESULTTEST9,B0
  STOREM             E0,d0,(b0) ; Store 4 bytes from E0 and put them  at addr b0 - result 56FF 54FF 32ff 21ff
  move.l             #RESULTTEST9,d0
  rts

RESULTTEST10: dc.l -1,-1
_vampire_test10:
  LOAD               #$5676545432322199,E0
  moveq              #1,D0         ; let's say we want to store max 1 byte
  lea                RESULTTEST10,B0
  STOREC             E0,d0,(b0) ; Store 1 bytes from E0 and put them  at addr b0 - result 56FF FFFF ffff ffff
  move.l             #RESULTTEST10,d0
  rts

RESULTTEST11: dc.l -1,-1
_vampire_test11:
  LOAD               #$5676545432322121,E0
  LOAD              #$FF00FF00FF00FF00,D0         ; store only even bytes
  lea                RESULTTEST11,B0
  STOREILM           E0,d0,(b0) ; Store even bytes from E0 and put them at addr b0 - result FF76 FF54 ff32 ff21
  move.l             #RESULTTEST11,d0
  rts

RESULTTEST12: dc.l -1,-1
_vampire_test12:
  LOAD               #$5600545432322100,E0
  lea                RESULTTEST12,B0
  STOREM3           E0,d1,(b0) ; Copy only bytes different than 0 , result is 56ff5454 323221ff
  move.l             #RESULTTEST12,d0
  rts

RESULTTEST13: dc.l 0
_vampire_test13:
  move.l             #$00000001,d0
  addiw.l            #-3,d0 ; subtract the word -3 ($FFFC) to 1, result must be $FFFE
  move.l             d0,RESULTTEST13 
  move.l             #RESULTTEST13,d0
  rts

RESULTTEST14: dc.l 0
_vampire_test14:
  move.l             #$80000000,d0
  ;moveiw.l            #3,d0 ; set the word 3
  ;dc.w $A200,$3
  move.l             #$80000003,d0
  move.l             d0,RESULTTEST14 
  move.l             #RESULTTEST14,d0
  rts

RESULTTEST15: dc.l 0,0
_vampire_test15:
  LOAD             #$0102030405067F08,e0
  LOAD             #$0A0A0A0A0A0A01FF,e1
  PADDB              e0,e1,d0
  STORE              d0,RESULTTEST15
  move.l             #RESULTTEST15,d0
  rts

RESULTTEST16: dc.l 0,0
_vampire_test16:
  LOAD             #$0102030405067F08,e0
  LOAD             #$0A0A0A0A0A0A01FF,e1
  PADDUSB          e0,e1,d0
  STORE              d0,RESULTTEST15
  move.l             #RESULTTEST15,d0
  rts

RESULTTEST17: dc.l 0,0
_vampire_test17:
  LOAD             #$100210047FFF0008,e0
  LOAD             #$100A100A0001FFFF,e1
  PADDW            e0,e1,d0
  STORE            d0,RESULTTEST17
  move.l           #RESULTTEST17,d0
  rts

RESULTTEST18: dc.l 0,0
_vampire_test18:
  LOAD             #$100210047FFF0008,e0
  LOAD             #$100A100A0001FFFF,e1
  PADDUSW          e0,e1,d0
  STORE              d0,RESULTTEST18
  move.l             #RESULTTEST18,d0
  rts

RESULTTEST19: dc.l 0,0
_vampire_test19:
  LOAD             #$100210047FFF0008,e0
  LOAD             #$100A100A0001FFFF,e1
  PMULL            e0,e1,d0
  STORE            d0,RESULTTEST19
  move.l           #RESULTTEST19,d0
  rts

RESULTTEST20: dc.l 0,0
_vampire_test20:
  LOAD             #$100210047FFF0008,e0
  LOAD             #$100A100A0001FFFF,e1
  PMULH            e0,e1,d0
  STORE            d0,RESULTTEST20
  move.l           #RESULTTEST20,d0
  rts

RESULTTEST21: dc.l 0,0
_vampire_test21:
  LOAD             #$100210047FFF0008,e0
  LOAD             #$100A100A0001FFFF,e1
  PMUL88            e0,e1,d0
  STORE            d0,RESULTTEST21
  move.l           #RESULTTEST21,d0
  rts

RESULTTEST22: dc.l 0,0
_vampire_test22:
  LOAD             #$FF0210047FFF0008,e0
  LOAD             #$100A100A0001FFFF,e1
  PMULA            e0,e1,d0
  STORE            d0,RESULTTEST22
  move.l           #RESULTTEST22,d0
  rts

;RESULTTEST23INPUT: dc.l $01070107,$01070107,$02080208,$02080208,$03090309,$03090309,$040A040A,$040A040A
;                   dc.l $050B050B,$050B050B,$060C060C,$070D070D,$070D070D,$080E080E,$090F090F,$090F090F
RESULTTEST23INPUT: dc.b $16,0,0,0,3,0,0,0
                   dc.b $1,0,0,0,3,0,0,0
                   dc.b $1,0,0,0,3,0,0,0
                   dc.b $1,0,0,0,3,0,0,0
                   ; ----------------------
                   dc.b $16,0,0,0,4,0,0,0
                   dc.b $2,0,0,0,4,0,0,0
                   dc.b $2,0,0,0,4,0,0,0
                   dc.b $2,0,0,0,4,0,0,0

RESULTTEST23OUPUT_BPL1: dc.l 0,0
RESULTTEST23OUPUT_BPL2: dc.l 0,0
RESULTTEST23OUPUT_BPL3: dc.l 0,0
RESULTTEST23OUPUT_BPL4: dc.l 0,0
RESULTTEST23OUPUT_BPL5: dc.l 0,0

_vampire_test23:
  movem.l d1-d7/a0-a6,-(sp)
     
  lea                   RESULTTEST23INPUT,a0
  lea                   RESULTTEST23OUPUT_BPL1,a1
	lea                   RESULTTEST23OUPUT_BPL2,a2
	lea                   RESULTTEST23OUPUT_BPL3,a3
	lea                   RESULTTEST23OUPUT_BPL4,a4
	lea                   RESULTTEST23OUPUT_BPL5,a5


  C2P                   (a0)+,E0 ; take a chunk of 8 bytes into E0
  C2P                   (a0)+,E1 ; take a chunk of 8 bytes into E1
  C2P                   (a0)+,E2 ; take a chunk of 8 bytes into E2
  C2P                   (a0)+,E3 ; take a chunk of 8 bytes into E3

  ; 32 pixels are now loaded into data registers in planar format

  TRANSLO               E0-E3,D0:D1 ; merge lower
  TRANSHI               E0-E3,D2:D3 ; merge upper

  C2P                   (a0)+,E0 ; take a chunk of 8 bytes into E10
  C2P                   (a0)+,E1 ; take a chunk of 8 bytes into E11
  C2P                   (a0)+,E2 ; take a chunk of 8 bytes into E12
  C2P                   (a0)+,E3 ; take a chunk of 8 bytes into E13

  TRANSLO               E0-E3,D4:D5 ; merge lower
  TRANSHI               E0-E3,D6:D7 ; merge upper

  VPERM                 #$13579BDF,d1,d5,e0 ; BPL0
  VPERM                 #$02468ACE,d1,d5,e1 ;BPL1

  VPERM                 #$13579BDF,d0,d4,e2 ;BPL2
  VPERM                 #$02468ACE,d0,d4,e3 ;BPL3

  VPERM                 #$13579BDF,d3,d7,e4 ; BPL5

  ; store data into actual bitplanes
  store                 e0,(a1)+
  store                 e1,(a2)+
  store                 e2,(a3)+
  store                 e3,(a4)+
  store                 e4,(a5)+

  movem.l (sp)+,d1-d7/a0-a6
  move.l           #RESULTTEST23OUPUT_BPL1,d0
  rts

TABLE24IN: dc.w $5,$e,2,$f,$4,$d,1,$e,$3,$d,1,$e,$1,$2,3,4
TABLE24OUT: dc.w 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
_vampire_test24:
  move.l               d2,-(sp)
  lea TABLE24OUT,a1
  MEMCPY16 TABLE24IN,a1,32/16
  move.l               #TABLE24OUT,d0                                    ; returns addr in d0
  move.l               (sp)+,d2
  rts

TABLE25OUT: dc.l $11111111,$11111111
_vampire_test25:
  move.l               d2,-(sp)

  load #$0233023401210112,E0
  load #$0233023401210112,E1
  pcmpeqb e0,e1,e2
  store e2,TABLE25OUT

  move.l               #TABLE25OUT,d0                                    ; returns addr in d0
  move.l               (sp)+,d2
  rts

TABLE26OUT: dc.l $11111111,$11111111
_vampire_test26:
  move.l               d2,-(sp)

  load #$0233023401210112,E0
  load #$0233023401210113,E1
  pcmpeqb e0,e1,e2
  store e2,TABLE26OUT

  move.l               #TABLE26OUT,d0                                    ; returns addr in d0
  move.l               (sp)+,d2
  rts

TABLE27OUT: dc.l $11111111,$11111111
_vampire_test27:
  move.l               d2,-(sp)

  load #$0233023401210112,E0
  load #$02330234012100FF,E1
  pcmphib e0,e1,e2
  store e2,TABLE27OUT

  move.l               #TABLE27OUT,d0                                    ; returns addr in d0
  move.l               (sp)+,d2
  rts

TABLE28OUT: dc.l $11111111,$11111111
_vampire_test28:
  move.l               d2,-(sp)

  load #$0233023401210112,E0
  load #$02330234012100FF,E1
  pcmpgeb e0,e1,e2
  store e2,TABLE28OUT

  move.l               #TABLE28OUT,d0                                    ; returns addr in d0
  move.l               (sp)+,d2
  rts

TABLE29OUT: dc.l $11111111,$11111111
_vampire_test29:
  move.l               d2,-(sp)

  load #$0233023401210112,E0
  load #$02330234012100FF,E1
  pcmpgtb e0,e1,e2
  store e2,TABLE29OUT

  move.l               #TABLE29OUT,d0                                    ; returns addr in d0
  move.l               (sp)+,d2
  rts



TABLE30OUT: dc.l $11111111,$11111111
_vampire_test30:
  move.l               d2,-(sp)

  load #$0233023401210112,E1
  CMP8BYTESEXS #$0233023401210112,e1,e2,test30uguali,test30nouguali
  
test30nouguali:
  load #$FFFFFFFFFFFFFFFF,e0
  store e0,TABLE30OUT
  move.l               #TABLE30OUT,d0                                    ; returns addr in d0
  move.l               (sp)+,d2
  rts
test30uguali:
  load #$0000000000000000,e0
  store e0,TABLE30OUT
  move.l               #TABLE30OUT,d0                                    ; returns addr in d0
  move.l               (sp)+,d2
  rts

TABLE31OUT: dc.l $11111111,$11111111
_vampire_test31:
  move.l               d2,-(sp)

  load #$0233023401210112,E1
  CMP8BYTESEXS #$0233123401210112,e1,e2,test31uguali,test31nouguali
  
test31nouguali:
  load #$FFFFFFFFFFFFFFFF,e0
  store e0,TABLE31OUT
  move.l               #TABLE31OUT,d0                                    ; returns addr in d0
  move.l               (sp)+,d2
  rts
test31uguali:
  load #$0000000000000000,e0
  store e0,TABLE31OUT
  move.l               #TABLE31OUT,d0                                    ; returns addr in d0
  move.l               (sp)+,d2
  rts

TABLE32OUT: dc.l $0,$0
_vampire_test32:
  move.l               d2,-(sp)

  load #$0123456789ABCDEF,E0
  load #$02330234012100FF,E1
  load #$5555555555555555,E2

  load #$e2,e3

  minterm e0-e3,e0

  store e0,TABLE32OUT

  move.l               #TABLE32OUT,d0                                    ; returns addr in d0
  move.l               (sp)+,d2
  rts