  XDEF                 _angleops_test1
  XDEF                 _angleops_test2
  XDEF                 _angleops_test3
  XDEF                 _angleops_test4
  XDEF                 _angleops_test5
  XDEF                 _angleops_test6
  XDEF                 _angleops_test7
  XDEF                 _angleops_test8
  XDEF                 _angleops_test9

  include              "../../../libs/vectors/sqrt_q10_6_lookup_table.i"
  include              "../../../libs/vectors/sqrt_q4_12_lookup_table.i"

  include              "../../../libs/rasterizers/globaloptions.s"
  include              "../../../libs/vectors/operations.s"
  include              "../../../libs/ammxmacros.i"
  include              "../../../libs/vectors/trigtables.i"
  include              "../../../libs/vectors/dot.s"
  include              "../../../libs/vectors/anglebetweenvectors.s"
  include              "../../../libs/vectors/cordic.s"

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

  ; vector1 is 25,8
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

RESULT: dc.l 0
_angleops_test7:
  ;angle = arcos (a*b / |a|*|b|)
  ; angle = arcos (64*64 + 10)
  move.l               d2,-(sp)

  ; vector1 is 64,64
  move.w                #1*64,d0
  move.w                #2*64,d1

  CREATE2DVECTOR        VECTOR1

  lea                  VECTOR1,a0

  move.w    (a0),d0  
  muls.w     d0,d0
  lsr.l      #6,d0

 
  
  
  move.w    2(a0),d1
  muls.w     d1,d1
  lsr.l      #6,d1

  add.l      d1,d0

  jsr glsqrt
  ;lsr.l #1,d0
  lsr.l #2,d0 ; qui vale 181, va bene, è la radice intera senza decimali!!!!
  ;move.l d0,RESULT
  ;move.l               #RESULT,d0
  ;move.l               (sp)+,d2
  ;rts

  moveq #0,d1
  move.w    (a0),d1
  lsr.l #6,d1
  muls d1,d0

  ;move.l d0,RESULT
  ;move.l               #RESULT,d0
  ;move.l               (sp)+,d2
  ;rts

  
  ; here d0 is denominatore
  
  moveq #0,d2
  move.w    (a0),d2
  lsr.l #6,d2
  muls d2,d2
  lsl.l #8,d2

  ;move.l d2,RESULT
  ;move.l               #RESULT,d0
  ;move.l               (sp)+,d2
  ;rts
  
  lsl.l #3,d2
  divu d0,d2 ; qui sto dividendo un numero in formato q10,6 nel formato q16,0

  ;lsr.w #3,d2
  move.l d2,RESULT
  move.l               #RESULT,d0
  move.l               (sp)+,d2
  rts
DEG2RADDIVPI:
  dc.b %00000000 ; 0 deg / 0.000000
  dc.b %00000000 ; 1 deg / 0.005556
  dc.b %00000000 ; 2 deg / 0.011111
  dc.b %00000001 ; 3 deg / 0.016667
  dc.b %00000001 ; 4 deg / 0.022222
  dc.b %00000001 ; 5 deg / 0.027778
  dc.b %00000010 ; 6 deg / 0.033333
  dc.b %00000010 ; 7 deg / 0.038889
  dc.b %00000010 ; 8 deg / 0.044444
  dc.b %00000011 ; 9 deg / 0.050000
  dc.b %00000011 ; 10 deg / 0.055556
  dc.b %00000011 ; 11 deg / 0.061111
  dc.b %00000100 ; 12 deg / 0.066667
  dc.b %00000100 ; 13 deg / 0.072222
  dc.b %00000100 ; 14 deg / 0.077778
  dc.b %00000101 ; 15 deg / 0.083333
  dc.b %00000101 ; 16 deg / 0.088889
  dc.b %00000110 ; 17 deg / 0.094444
  dc.b %00000110 ; 18 deg / 0.100000
  dc.b %00000110 ; 19 deg / 0.105556
  dc.b %00000111 ; 20 deg / 0.111111
  dc.b %00000111 ; 21 deg / 0.116667
  dc.b %00000111 ; 22 deg / 0.122222
  dc.b %00001000 ; 23 deg / 0.127778
  dc.b %00001000 ; 24 deg / 0.133333
  dc.b %00001000 ; 25 deg / 0.138889
  dc.b %00001001 ; 26 deg / 0.144444
  dc.b %00001001 ; 27 deg / 0.150000
  dc.b %00001001 ; 28 deg / 0.155556
  dc.b %00001010 ; 29 deg / 0.161111
  dc.b %00001010 ; 30 deg / 0.166667
  dc.b %00001011 ; 31 deg / 0.172222
  dc.b %00001011 ; 32 deg / 0.177778
  dc.b %00001011 ; 33 deg / 0.183333
  dc.b %00001100 ; 34 deg / 0.188889
  dc.b %00001100 ; 35 deg / 0.194444
  dc.b %00001100 ; 36 deg / 0.200000
  dc.b %00001101 ; 37 deg / 0.205556
  dc.b %00001101 ; 38 deg / 0.211111
  dc.b %00001101 ; 39 deg / 0.216667
  dc.b %00001110 ; 40 deg / 0.222222
  dc.b %00001110 ; 41 deg / 0.227778
  dc.b %00001110 ; 42 deg / 0.233333
  dc.b %00001111 ; 43 deg / 0.238889
  dc.b %00001111 ; 44 deg / 0.244444
  dc.b %00010000 ; 45 deg / 0.250000
  dc.b %00010000 ; 46 deg / 0.255556
  dc.b %00010000 ; 47 deg / 0.261111
  dc.b %00010001 ; 48 deg / 0.266667
  dc.b %00010001 ; 49 deg / 0.272222
  dc.b %00010001 ; 50 deg / 0.277778
  dc.b %00010010 ; 51 deg / 0.283333
  dc.b %00010010 ; 52 deg / 0.288889
  dc.b %00010010 ; 53 deg / 0.294444
  dc.b %00010011 ; 54 deg / 0.300000
  dc.b %00010011 ; 55 deg / 0.305556
  dc.b %00010011 ; 56 deg / 0.311111
  dc.b %00010100 ; 57 deg / 0.316667
  dc.b %00010100 ; 58 deg / 0.322222
  dc.b %00010100 ; 59 deg / 0.327778
  dc.b %00010101 ; 60 deg / 0.333333
  dc.b %00010101 ; 61 deg / 0.338889
  dc.b %00010110 ; 62 deg / 0.344444
  dc.b %00010110 ; 63 deg / 0.350000
  dc.b %00010110 ; 64 deg / 0.355556
  dc.b %00010111 ; 65 deg / 0.361111
  dc.b %00010111 ; 66 deg / 0.366667
  dc.b %00010111 ; 67 deg / 0.372222
  dc.b %00011000 ; 68 deg / 0.377778
  dc.b %00011000 ; 69 deg / 0.383333
  dc.b %00011000 ; 70 deg / 0.388889
  dc.b %00011001 ; 71 deg / 0.394444
  dc.b %00011001 ; 72 deg / 0.400000
  dc.b %00011001 ; 73 deg / 0.405556
  dc.b %00011010 ; 74 deg / 0.411111
  dc.b %00011010 ; 75 deg / 0.416667
  dc.b %00011011 ; 76 deg / 0.422222
  dc.b %00011011 ; 77 deg / 0.427778
  dc.b %00011011 ; 78 deg / 0.433333
  dc.b %00011100 ; 79 deg / 0.438889
  dc.b %00011100 ; 80 deg / 0.444444
  dc.b %00011100 ; 81 deg / 0.450000
  dc.b %00011101 ; 82 deg / 0.455556
  dc.b %00011101 ; 83 deg / 0.461111
  dc.b %00011101 ; 84 deg / 0.466667
  dc.b %00011110 ; 85 deg / 0.472222
  dc.b %00011110 ; 86 deg / 0.477778
  dc.b %00011110 ; 87 deg / 0.483333
  dc.b %00011111 ; 88 deg / 0.488889
  dc.b %00011111 ; 89 deg / 0.494444
  dc.b %00100000 ; 90 deg / 0.500000
  even

_angleops_test8:
  move.l               d2,-(sp)
  
  move.w #200,d0
  move.w #100,d1

  jsr CORDIC
  move.w d3,d0

  move.l d3,RESULT
  move.l               #RESULT,d0
  move.l               (sp)+,d2
  rts

TABLE: dcb.b 64*64,0

_angleops_test9:
  move.l               d2,-(sp)
  
  lea TABLE,a0
  moveq #64-1,d6 ; how many cycles for x?
  move.w #1,d0
test9loopx:  
  
  move.w #1,d1
  moveq #0,d5


  moveq #64-1,d7 ; how many cycles for y?
test9loop;

  movem.l d0/d1/d2/d4/d5/d6/d7/a0,-(sp)
  jsr CORDIC
  movem.l (sp)+,d0/d1/d2/d4/d5/d6/d7/a0
  lsr.w #8,d3
  cmp.b #$FF,d3
  bne.s noerrore
  moveq #0,d3
noerrore:

  MAXUWORD d5,d3

  addq #2,d1
  lea DEG2RADDIVPI2,a1
  move.b 0(a1,d3.w),(a0)+
  ;move.b d3,(a0)+
  move.b d3,d5 ; save it for later comparison
  dbra d7,test9loop

  addq #2,d0
  dbra d6,test9loopx

  move.l               #TABLE,d0
  move.l               (sp)+,d2
  rts

DEG2RADDIVPI2:
  dc.b %00000000 ; 0 deg / 0.000000
  dc.b %00000010 ; 1 deg / 0.005556
  dc.b %00000101 ; 2 deg / 0.011111
  dc.b %00001000 ; 3 deg / 0.016667
  dc.b %00001011 ; 4 deg / 0.022222
  dc.b %00001110 ; 5 deg / 0.027778
  dc.b %00010001 ; 6 deg / 0.033333
  dc.b %00010011 ; 7 deg / 0.038889
  dc.b %00010110 ; 8 deg / 0.044444
  dc.b %00011001 ; 9 deg / 0.050000
  dc.b %00011100 ; 10 deg / 0.055556
  dc.b %00011111 ; 11 deg / 0.061111
  dc.b %00100010 ; 12 deg / 0.066667
  dc.b %00100100 ; 13 deg / 0.072222
  dc.b %00100111 ; 14 deg / 0.077778
  dc.b %00101010 ; 15 deg / 0.083333
  dc.b %00101101 ; 16 deg / 0.088889
  dc.b %00110000 ; 17 deg / 0.094444
  dc.b %00110011 ; 18 deg / 0.100000
  dc.b %00110110 ; 19 deg / 0.105556
  dc.b %00111000 ; 20 deg / 0.111111
  dc.b %00111011 ; 21 deg / 0.116667
  dc.b %00111110 ; 22 deg / 0.122222
  dc.b %01000001 ; 23 deg / 0.127778
  dc.b %01000100 ; 24 deg / 0.133333
  dc.b %01000111 ; 25 deg / 0.138889
  dc.b %01001001 ; 26 deg / 0.144444
  dc.b %01001100 ; 27 deg / 0.150000
  dc.b %01001111 ; 28 deg / 0.155556
  dc.b %01010010 ; 29 deg / 0.161111
  dc.b %01010101 ; 30 deg / 0.166667
  dc.b %01011000 ; 31 deg / 0.172222
  dc.b %01011011 ; 32 deg / 0.177778
  dc.b %01011101 ; 33 deg / 0.183333
  dc.b %01100000 ; 34 deg / 0.188889
  dc.b %01100011 ; 35 deg / 0.194444
  dc.b %01100110 ; 36 deg / 0.200000
  dc.b %01101001 ; 37 deg / 0.205556
  dc.b %01101100 ; 38 deg / 0.211111
  dc.b %01101110 ; 39 deg / 0.216667
  dc.b %01110001 ; 40 deg / 0.222222
  dc.b %01110100 ; 41 deg / 0.227778
  dc.b %01110111 ; 42 deg / 0.233333
  dc.b %01111010 ; 43 deg / 0.238889
  dc.b %01111101 ; 44 deg / 0.244444
  dc.b %10000000 ; 45 deg / 0.250000
  dc.b %10000010 ; 46 deg / 0.255556
  dc.b %10000101 ; 47 deg / 0.261111
  dc.b %10001000 ; 48 deg / 0.266667
  dc.b %10001011 ; 49 deg / 0.272222
  dc.b %10001110 ; 50 deg / 0.277778
  dc.b %10010001 ; 51 deg / 0.283333
  dc.b %10010011 ; 52 deg / 0.288889
  dc.b %10010110 ; 53 deg / 0.294444
  dc.b %10011001 ; 54 deg / 0.300000
  dc.b %10011100 ; 55 deg / 0.305556
  dc.b %10011111 ; 56 deg / 0.311111
  dc.b %10100010 ; 57 deg / 0.316667
  dc.b %10100100 ; 58 deg / 0.322222
  dc.b %10100111 ; 59 deg / 0.327778
  dc.b %10101010 ; 60 deg / 0.333333
  dc.b %10101101 ; 61 deg / 0.338889
  dc.b %10110000 ; 62 deg / 0.344444
  dc.b %10110011 ; 63 deg / 0.350000
  dc.b %10110110 ; 64 deg / 0.355556
  dc.b %10111000 ; 65 deg / 0.361111
  dc.b %10111011 ; 66 deg / 0.366667
  dc.b %10111110 ; 67 deg / 0.372222
  dc.b %11000001 ; 68 deg / 0.377778
  dc.b %11000100 ; 69 deg / 0.383333
  dc.b %11000111 ; 70 deg / 0.388889
  dc.b %11001001 ; 71 deg / 0.394444
  dc.b %11001100 ; 72 deg / 0.400000
  dc.b %11001111 ; 73 deg / 0.405556
  dc.b %11010010 ; 74 deg / 0.411111
  dc.b %11010101 ; 75 deg / 0.416667
  dc.b %11011000 ; 76 deg / 0.422222
  dc.b %11011011 ; 77 deg / 0.427778
  dc.b %11011101 ; 78 deg / 0.433333
  dc.b %11100000 ; 79 deg / 0.438889
  dc.b %11100011 ; 80 deg / 0.444444
  dc.b %11100110 ; 81 deg / 0.450000
  dc.b %11101001 ; 82 deg / 0.455556
  dc.b %11101100 ; 83 deg / 0.461111
  dc.b %11101110 ; 84 deg / 0.466667
  dc.b %11110001 ; 85 deg / 0.472222
  dc.b %11110100 ; 86 deg / 0.477778
  dc.b %11110111 ; 87 deg / 0.483333
  dc.b %11111010 ; 88 deg / 0.488889
  dc.b %11111101 ; 89 deg / 0.494444
  dc.b %11111111 ; 90 deg / 0.500000
