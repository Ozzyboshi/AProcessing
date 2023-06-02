; ANGLE_BETWEEN_Q10_6 - Get angle in degrees between 2 bidimensional vectors in Q10 6 format
; In order to calculate a dot product the following formula can be applied:
; angle = arcos (a*b / |a|*|b|)
; Input: 
;   - a0.l: address of the first vector
;   - a1.l: address of the second vector
; Output:
;   - d0.l: the calculated angle in degrees
; Trashes:
;   - d1
;   - d7
ANGLE_BETWEEN_Q10_6_TABLE_LOOKUP:
    move.l a1,a2
    jsr DOT_Q10_6

    btst #31,d0
    bne.s ANGLE_BETWEEN_Q10_6_TABLE_LOOKUP2

    ; d0 now holds the dot product, let's save it into d7
    move.l  d0,d7
    asl.l   #6,d7

    GET2DMAGNITUDE_Q10_6_TABLE_LOOKUP
    ; save mag of the first vector into d6
    move.l d0,d6
    
    exg.l a0,a2
    GET2DMAGNITUDE_Q10_6_TABLE_LOOKUP

    ; mult mag of the first and the second vector
    muls.w d0,d6
    lsr.l #6,d6

    ; do the division
    divu.w d6,d7

    moveq #0,d0
    lea ANGLE_BETWEEN_VECTORS_POSITIVE(PC),a0
    move.b 0(a0,d7.w),d0

    rts

ANGLE_BETWEEN_Q10_6_TABLE_LOOKUP2:
    ;move.l a1,a2
    ;jsr DOT_Q10_6
    neg.l d0
    move.l  d0,d7
    asl.l   #6,d7

    GET2DMAGNITUDE_Q10_6_TABLE_LOOKUP
    ; save mag of the first vector into d6
    move.l d0,d6
    
    exg.l a0,a2
    GET2DMAGNITUDE_Q10_6_TABLE_LOOKUP

    ; mult mag of the first and the second vector
    muls.w d0,d6
    lsr.l #6,d6

    ; do the division
    divu.w d6,d7

    moveq #0,d0
    lea ANGLE_BETWEEN_VECTORS_NEGATIVE(PC),a0
    move.b 0(a0,d7.w),d0

    rts

ANGLE_BETWEEN_VECTORS_POSITIVE:
    dc.b %01011010 ; index: 0 ; degrees: 90 - real value 0.000000
    dc.b %01011001 ; index: 1 ; degrees: 89 - real value 0.015625
    dc.b %01011000 ; index: 2 ; degrees: 88 - real value 0.031250
    dc.b %01010111 ; index: 3 ; degrees: 87 - real value 0.046875
    dc.b %01010110 ; index: 4 ; degrees: 86 - real value 0.062500
    dc.b %01010101 ; index: 5 ; degrees: 85 - real value 0.078125
    dc.b %01010100 ; index: 6 ; degrees: 84 - real value 0.093750
    dc.b %01010011 ; index: 7 ; degrees: 83 - real value 0.109375
    dc.b %01010010 ; index: 8 ; degrees: 82 - real value 0.125000
    dc.b %01010001 ; index: 9 ; degrees: 81 - real value 0.140625
    dc.b %01010001 ; index: 10 ; degrees: 81 - real value 0.156250
    dc.b %01010000 ; index: 11 ; degrees: 80 - real value 0.171875
    dc.b %01001111 ; index: 12 ; degrees: 79 - real value 0.187500
    dc.b %01001110 ; index: 13 ; degrees: 78 - real value 0.203125
    dc.b %01001101 ; index: 14 ; degrees: 77 - real value 0.218750
    dc.b %01001100 ; index: 15 ; degrees: 76 - real value 0.234375
    dc.b %01001011 ; index: 16 ; degrees: 75 - real value 0.250000
    dc.b %01001010 ; index: 17 ; degrees: 74 - real value 0.265625
    dc.b %01001001 ; index: 18 ; degrees: 73 - real value 0.281250
    dc.b %01001000 ; index: 19 ; degrees: 72 - real value 0.296875
    dc.b %01000111 ; index: 20 ; degrees: 71 - real value 0.312500
    dc.b %01000110 ; index: 21 ; degrees: 70 - real value 0.328125
    dc.b %01000101 ; index: 22 ; degrees: 69 - real value 0.343750
    dc.b %01000100 ; index: 23 ; degrees: 68 - real value 0.359375
    dc.b %01000011 ; index: 24 ; degrees: 67 - real value 0.375000
    dc.b %01000011 ; index: 25 ; degrees: 67 - real value 0.390625
    dc.b %01000010 ; index: 26 ; degrees: 66 - real value 0.406250
    dc.b %01000001 ; index: 27 ; degrees: 65 - real value 0.421875
    dc.b %01000000 ; index: 28 ; degrees: 64 - real value 0.437500
    dc.b %00111111 ; index: 29 ; degrees: 63 - real value 0.453125
    dc.b %00111110 ; index: 30 ; degrees: 62 - real value 0.468750
    dc.b %00111101 ; index: 31 ; degrees: 61 - real value 0.484375
    dc.b %00111100 ; index: 32 ; degrees: 60 - real value 0.500000
    dc.b %00111010 ; index: 33 ; degrees: 58 - real value 0.515625
    dc.b %00111001 ; index: 34 ; degrees: 57 - real value 0.531250
    dc.b %00111000 ; index: 35 ; degrees: 56 - real value 0.546875
    dc.b %00110111 ; index: 36 ; degrees: 55 - real value 0.562500
    dc.b %00110110 ; index: 37 ; degrees: 54 - real value 0.578125
    dc.b %00110101 ; index: 38 ; degrees: 53 - real value 0.593750
    dc.b %00110100 ; index: 39 ; degrees: 52 - real value 0.609375
    dc.b %00110011 ; index: 40 ; degrees: 51 - real value 0.625000
    dc.b %00110010 ; index: 41 ; degrees: 50 - real value 0.640625
    dc.b %00110000 ; index: 42 ; degrees: 48 - real value 0.656250
    dc.b %00101111 ; index: 43 ; degrees: 47 - real value 0.671875
    dc.b %00101110 ; index: 44 ; degrees: 46 - real value 0.687500
    dc.b %00101101 ; index: 45 ; degrees: 45 - real value 0.703125
    dc.b %00101100 ; index: 46 ; degrees: 44 - real value 0.718750
    dc.b %00101010 ; index: 47 ; degrees: 42 - real value 0.734375
    dc.b %00101001 ; index: 48 ; degrees: 41 - real value 0.750000
    dc.b %00101000 ; index: 49 ; degrees: 40 - real value 0.765625
    dc.b %00100110 ; index: 50 ; degrees: 38 - real value 0.781250
    dc.b %00100101 ; index: 51 ; degrees: 37 - real value 0.796875
    dc.b %00100011 ; index: 52 ; degrees: 35 - real value 0.812500
    dc.b %00100010 ; index: 53 ; degrees: 34 - real value 0.828125
    dc.b %00100000 ; index: 54 ; degrees: 32 - real value 0.843750
    dc.b %00011110 ; index: 55 ; degrees: 30 - real value 0.859375
    dc.b %00011100 ; index: 56 ; degrees: 28 - real value 0.875000
    dc.b %00011011 ; index: 57 ; degrees: 27 - real value 0.890625
    dc.b %00011001 ; index: 58 ; degrees: 25 - real value 0.906250
    dc.b %00010110 ; index: 59 ; degrees: 22 - real value 0.921875
    dc.b %00010100 ; index: 60 ; degrees: 20 - real value 0.937500
    dc.b %00010001 ; index: 61 ; degrees: 17 - real value 0.953125
    dc.b %00001110 ; index: 62 ; degrees: 14 - real value 0.968750
    dc.b %00001010 ; index: 63 ; degrees: 10 - real value 0.984375

ANGLE_BETWEEN_VECTORS_NEGATIVE:
    dc.b %01011010 ; index: 0 ; degrees: 90 - real value 0.000000
    dc.b %01011010 ; index: 1 ; degrees: 90 - real value 0.015625
    dc.b %01011011 ; index: 2 ; degrees: 91 - real value 0.031250
    dc.b %01011100 ; index: 3 ; degrees: 92 - real value 0.046875
    dc.b %01011101 ; index: 4 ; degrees: 93 - real value 0.062500
    dc.b %01011110 ; index: 5 ; degrees: 94 - real value 0.078125
    dc.b %01011111 ; index: 6 ; degrees: 95 - real value 0.093750
    dc.b %01100000 ; index: 7 ; degrees: 96 - real value 0.109375
    dc.b %01100001 ; index: 8 ; degrees: 97 - real value 0.125000
    dc.b %01100010 ; index: 9 ; degrees: 98 - real value 0.140625
    dc.b %01100010 ; index: 10 ; degrees: 98 - real value 0.156250
    dc.b %01100011 ; index: 11 ; degrees: 99 - real value 0.171875
    dc.b %01100100 ; index: 12 ; degrees: 100 - real value 0.187500
    dc.b %01100101 ; index: 13 ; degrees: 101 - real value 0.203125
    dc.b %01100110 ; index: 14 ; degrees: 102 - real value 0.218750
    dc.b %01100111 ; index: 15 ; degrees: 103 - real value 0.234375
    dc.b %01101000 ; index: 16 ; degrees: 104 - real value 0.250000
    dc.b %01101001 ; index: 17 ; degrees: 105 - real value 0.265625
    dc.b %01101010 ; index: 18 ; degrees: 106 - real value 0.281250
    dc.b %01101011 ; index: 19 ; degrees: 107 - real value 0.296875
    dc.b %01101100 ; index: 20 ; degrees: 108 - real value 0.312500
    dc.b %01101101 ; index: 21 ; degrees: 109 - real value 0.328125
    dc.b %01101110 ; index: 22 ; degrees: 110 - real value 0.343750
    dc.b %01101111 ; index: 23 ; degrees: 111 - real value 0.359375
    dc.b %01110000 ; index: 24 ; degrees: 112 - real value 0.375000
    dc.b %01110000 ; index: 25 ; degrees: 112 - real value 0.390625
    dc.b %01110001 ; index: 26 ; degrees: 113 - real value 0.406250
    dc.b %01110010 ; index: 27 ; degrees: 114 - real value 0.421875
    dc.b %01110011 ; index: 28 ; degrees: 115 - real value 0.437500
    dc.b %01110100 ; index: 29 ; degrees: 116 - real value 0.453125
    dc.b %01110101 ; index: 30 ; degrees: 117 - real value 0.468750
    dc.b %01110110 ; index: 31 ; degrees: 118 - real value 0.484375
    dc.b %01111000 ; index: 32 ; degrees: 120 - real value 0.500000
    dc.b %01111001 ; index: 33 ; degrees: 121 - real value 0.515625
    dc.b %01111010 ; index: 34 ; degrees: 122 - real value 0.531250
    dc.b %01111011 ; index: 35 ; degrees: 123 - real value 0.546875
    dc.b %01111100 ; index: 36 ; degrees: 124 - real value 0.562500
    dc.b %01111101 ; index: 37 ; degrees: 125 - real value 0.578125
    dc.b %01111110 ; index: 38 ; degrees: 126 - real value 0.593750
    dc.b %01111111 ; index: 39 ; degrees: 127 - real value 0.609375
    dc.b %10000000 ; index: 40 ; degrees: -128 - real value 0.625000
    dc.b %10000001 ; index: 41 ; degrees: -127 - real value 0.640625
    dc.b %10000011 ; index: 42 ; degrees: -125 - real value 0.656250
    dc.b %10000100 ; index: 43 ; degrees: -124 - real value 0.671875
    dc.b %10000101 ; index: 44 ; degrees: -123 - real value 0.687500
    dc.b %10000110 ; index: 45 ; degrees: -122 - real value 0.703125
    dc.b %10000111 ; index: 46 ; degrees: -121 - real value 0.718750
    dc.b %10001001 ; index: 47 ; degrees: -119 - real value 0.734375
    dc.b %10001010 ; index: 48 ; degrees: -118 - real value 0.750000
    dc.b %10001011 ; index: 49 ; degrees: -117 - real value 0.765625
    dc.b %10001101 ; index: 50 ; degrees: -115 - real value 0.781250
    dc.b %10001110 ; index: 51 ; degrees: -114 - real value 0.796875
    dc.b %10010000 ; index: 52 ; degrees: -112 - real value 0.812500
    dc.b %10010001 ; index: 53 ; degrees: -111 - real value 0.828125
    dc.b %10010011 ; index: 54 ; degrees: -109 - real value 0.843750
    dc.b %10010101 ; index: 55 ; degrees: -107 - real value 0.859375
    dc.b %10010111 ; index: 56 ; degrees: -105 - real value 0.875000
    dc.b %10011000 ; index: 57 ; degrees: -104 - real value 0.890625
    dc.b %10011010 ; index: 58 ; degrees: -102 - real value 0.906250
    dc.b %10011101 ; index: 59 ; degrees: -99 - real value 0.921875
    dc.b %10011111 ; index: 60 ; degrees: -97 - real value 0.937500
    dc.b %10100010 ; index: 61 ; degrees: -94 - real value 0.953125
    dc.b %10100101 ; index: 62 ; degrees: -91 - real value 0.968750
    dc.b %10101001 ; index: 63 ; degrees: -87 - real value 0.984375

;#include <stdio.h>
;#include <math.h>

;#define BYTE_TO_BINARY_PATTERN "%c%c%c%c%c%c%c%c"
;#define BYTE_TO_BINARY(byte)  \
;  ((byte) & 0x80 ? '1' : '0'), \
;  ((byte) & 0x40 ? '1' : '0'), \
;  ((byte) & 0x20 ? '1' : '0'), \
;  ((byte) & 0x10 ? '1' : '0'), \
;  ((byte) & 0x08 ? '1' : '0'), \
;  ((byte) & 0x04 ? '1' : '0'), \
;  ((byte) & 0x02 ? '1' : '0'), \
;  ((byte) & 0x01 ? '1' : '0') 
;  
;int main()
;{
;    const double PI =  3.1415926;
;    
;    for (unsigned char i=0;i<(unsigned char)64;i++)
;    {
;        double x = 0;
;        if ((i) & 0x20) x+=0.5;
;        if ((i) & 0x10) x+=0.5/2;
;        if ((i) & 0x8)  x+=0.5/2/2;
;        if ((i) & 0x4)  x+=0.5/2/2/2;
;        if ((i) & 0x2)  x+=0.5/2/2/2/2;
;        if ((i) & 0x1)  x+=0.5/2/2/2/2/2;
;        
;        char result = (char)(acos(x)*180/PI);
;        
;        //printf("Leading text "BYTE_TO_BINARY_PATTERN" - %f %hhd "BYTE_TO_BINARY_PATTERN"\n", BYTE_TO_BINARY(i),x,result,BYTE_TO_BINARY(result));
;        printf("dc.b %%"BYTE_TO_BINARY_PATTERN" ; index: %hhd ; degrees: %hhd - real value %f\n", BYTE_TO_BINARY(result),i,result,x);
;    }
;    return 0;
;}


;import math

;x1, y1 = 10, 20
;x2, y2 = 30, 1

;angolo = math.atan2(y2 - y1, x2 - x1) * (180 / math.pi)

;print(angolo)



ANGLE_Q10_6:

    GET2DMAGNITUDE_Q10_6_TABLE_LOOKUP
    move.w d0,d1

    ; dot product is simply the x of V1
    move.w (a0),d0
    bmi.s ANGLE_Q10_6_NEG
    
    ; mult by 64
    ext.l d0
    lsl.l #6,d0

    move.w 2(a0),d2
    bmi.s .fourthquadrant  
    
    divu d1,d0
    
    lea ACOS_Q10_16(PC),a1
    move.b 0(a1,d0.w),d0
    ext.w d0
    rts
    
    
.fourthquadrant:
    divu d1,d0
    
    lea ACOS_Q10_16(PC),a1
    move.b 0(a1,d0.w),d0
    ext.w d0

    move.w d0,d1
    move.w #360,d0
    sub.w d1,d0

    rts
    
ANGLE_Q10_6_NEG:
     ; mult by 64
    neg.w d0
    ext.l d0
    lsl.l #6,d0
    divu d1,d0
    
    lea ACOS_Q10_16(PC),a1
    move.b 0(a1,d0.w),d0
    ext.w d0
    move.w d0,d1
    addi.w #180,d0
    
    move.w 2(a0),d2
    bmi.s .nothirdquadrant
    
    sub.w d1,d0
    sub.w d1,d0
    
.nothirdquadrant:
    
    rts

ACOS_Q10_16:
        dc.b %01011010 ; index: 0 ; degrees: 90
        dc.b %01011001 ; index: 1 ; degrees: 89
        dc.b %01011000 ; index: 2 ; degrees: 88
        dc.b %01010111 ; index: 3 ; degrees: 87
        dc.b %01010110 ; index: 4 ; degrees: 86
        dc.b %01010101 ; index: 5 ; degrees: 85
        dc.b %01010100 ; index: 6 ; degrees: 84
        dc.b %01010011 ; index: 7 ; degrees: 83
        dc.b %01010010 ; index: 8 ; degrees: 82
        dc.b %01010001 ; index: 9 ; degrees: 81
        dc.b %01010001 ; index: 10 ; degrees: 81
        dc.b %01010000 ; index: 11 ; degrees: 80
        dc.b %01001111 ; index: 12 ; degrees: 79
        dc.b %01001110 ; index: 13 ; degrees: 78
        dc.b %01001101 ; index: 14 ; degrees: 77
        dc.b %01001100 ; index: 15 ; degrees: 76
        dc.b %01001011 ; index: 16 ; degrees: 75
        dc.b %01001010 ; index: 17 ; degrees: 74
        dc.b %01001001 ; index: 18 ; degrees: 73
        dc.b %01001000 ; index: 19 ; degrees: 72
        dc.b %01000111 ; index: 20 ; degrees: 71
        dc.b %01000110 ; index: 21 ; degrees: 70
        dc.b %01000101 ; index: 22 ; degrees: 69
        dc.b %01000100 ; index: 23 ; degrees: 68
        dc.b %01000011 ; index: 24 ; degrees: 67
        dc.b %01000011 ; index: 25 ; degrees: 67
        dc.b %01000010 ; index: 26 ; degrees: 66
        dc.b %01000001 ; index: 27 ; degrees: 65
        dc.b %01000000 ; index: 28 ; degrees: 64
        dc.b %00111111 ; index: 29 ; degrees: 63
        dc.b %00111110 ; index: 30 ; degrees: 62
        dc.b %00111101 ; index: 31 ; degrees: 61
        dc.b %00111100 ; index: 32 ; degrees: 60
        dc.b %00111010 ; index: 33 ; degrees: 58
        dc.b %00111001 ; index: 34 ; degrees: 57
        dc.b %00111000 ; index: 35 ; degrees: 56
        dc.b %00110111 ; index: 36 ; degrees: 55
        dc.b %00110110 ; index: 37 ; degrees: 54
        dc.b %00110101 ; index: 38 ; degrees: 53
        dc.b %00110100 ; index: 39 ; degrees: 52
        dc.b %00110011 ; index: 40 ; degrees: 51
        dc.b %00110010 ; index: 41 ; degrees: 50
        dc.b %00110000 ; index: 42 ; degrees: 48
        dc.b %00101111 ; index: 43 ; degrees: 47
        dc.b %00101110 ; index: 44 ; degrees: 46
        dc.b %00101101 ; index: 45 ; degrees: 45
        dc.b %00101100 ; index: 46 ; degrees: 44
        dc.b %00101010 ; index: 47 ; degrees: 42
        dc.b %00101001 ; index: 48 ; degrees: 41
        dc.b %00101000 ; index: 49 ; degrees: 40
        dc.b %00100110 ; index: 50 ; degrees: 38
        dc.b %00100101 ; index: 51 ; degrees: 37
        dc.b %00100011 ; index: 52 ; degrees: 35
        dc.b %00100010 ; index: 53 ; degrees: 34
        dc.b %00100000 ; index: 54 ; degrees: 32
        dc.b %00011110 ; index: 55 ; degrees: 30
        dc.b %00011100 ; index: 56 ; degrees: 28
        dc.b %00011011 ; index: 57 ; degrees: 27
        dc.b %00011001 ; index: 58 ; degrees: 25
        dc.b %00010110 ; index: 59 ; degrees: 22
        dc.b %00010100 ; index: 60 ; degrees: 20
        dc.b %00010001 ; index: 61 ; degrees: 17
        dc.b %00001110 ; index: 62 ; degrees: 14
        dc.b %00000111 ; index 63



