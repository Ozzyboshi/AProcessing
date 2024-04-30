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