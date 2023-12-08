;Routine ATAN2_PI_128 - Try to return atan2(Y,X)/PI using a precalculated 4096 byte table
; Input:
; - d0.w : Y
; - d1.w : X
; Return value of atan2() into d3.w (Q7,9 signed format)

ATAN2_PI_128:
    ; test Y for odd
    btst #0,d0
    beq.s atan2_pi_n128_y_even

    ; test X for odd
    btst #0,d1
    beq.s atan2_pi_n128_x_even

    ; we are here if both Y and X are ODD
    bsr.w ATAN2_PI_128_ODD
    rts

; here ancle case where Y is even BUT X is odd, decrement and increment X only
atan2_pi_n128_y_even:
    ; if Y is zero, regadless of X, it's a corner case, we dont need to do multiple calculation
    tst.w d0
    bne.s atan2_no_special_case
    bsr.w ATAN2_PI_128_ODD
    rts
atan2_no_special_case:

    ; test if also x is even
    btst #0,d1
    beq.s atan2_pi_n128_xy_even

    move.w d0,d3
    swap d0
    move.w d3,d0
    
    move.w d1,d3
    swap d1
    move.w d3,d1

    sub.w #1,d0
    bsr.s ATAN2_PI_128_ODD

    swap d0
    swap d1
    swap d3

    addq #1,d0
    bsr.s ATAN2_PI_128_ODD

    move.w d3,d0
    swap d3
    add.w d0,d3
    asr.w #1,d3

    rts

    ; here handle case where X is even BUT Y is odd, decrement and increment X only
atan2_pi_n128_x_even:
    move.w d0,d3
    swap d0
    move.w d3,d0
    
    move.w d1,d3
    swap d1
    move.w d3,d1

    sub.w #1,d1
    bsr.s ATAN2_PI_128_ODD

    swap d0
    swap d1
    swap d3

    addq #1,d1
    bsr.s ATAN2_PI_128_ODD

    move.w d3,d0
    swap d3
    add.w d0,d3
    asr.w #1,d3

    rts

; here handle case where both x and y are even (double average)
atan2_pi_n128_xy_even:
    move.w d0,d3
    swap d0
    move.w d3,d0
    
    move.w d1,d3
    swap d1
    move.w d3,d1

    sub.w #1,d0
    sub.w #1,d1
    bsr.s ATAN2_PI_128_ODD

    swap d0
    swap d1
    swap d3

    addq #1,d0
    addq #1,d1
    bsr.s ATAN2_PI_128_ODD

    move.w d3,d0
    swap d3
    add.w d0,d3
    asr.w #1,d3
    rts

ATAN2_PI_128_ODD:
    lea ATAN2_128_QUADRANT(PC),a0

    btst #15,d1 ; if x < 0 branch to atan2_128_xneg
    bne.s atan2_128_xneg

    tst.w d0; if y = 0 the tangent does not exists - return zero
    beq.s anan2_128_ret_zero

    ; check if X=0 and Y!=0
    tst.w d1
    beq.s atan2_128_resolve_y

    ; if y < 0 branch to atan2_128_yneg
    btst #15,d0
    bne.s atan2_128_yneg

    ; go to the beginning of X
    subq #1,d1
    subq #1,d0

    asr.w #1,d0
    asr.w #1,d1

    lsl.w #6,d1
    add.w d1,a0
    add.w d0,a0
    clr.w  d3
    move.b (a0),d3

    rts
    
; handle X>0 and Y=0
anan2_128_ret_zero:
    moveq #0,d3
    rts
    
; handle X=0 and Y!=0
atan2_128_resolve_y:
   move.w #%100000000,d3
   btst #15,d0
   beq.s atan2_128_resolve_y2
   neg.w d3
   rts
atan2_128_resolve_y2:
   rts
   
atan2_128_yneg:
    ; go to the beginning of X
    neg.w d0
    subq #1,d1
    subq #1,d0
    asr.w #1,d0
    asr.w #1,d1

    lsl.w #6,d1
    add.w d1,a0
    add.w d0,a0
    clr.w d3
    move.b (a0),d3

    neg.w d3
    rts
    
; start considering X < 0
atan2_128_xneg:

    ; d3 must represent 1
    move.w #%1000000000,d3
    
    tst.w d0; if y = 0 the tangent is pi
    bne.s atan2_128_ret_no_pi
    rts
atan2_128_ret_no_pi:

    btst #15,d0
    bne.s atan2_128_yneg2
; third case, x<0 and y > 0
    neg.w d1
    subq #1,d1
    subq #1,d0
    asr.w #1,d0
    asr.w #1,d1

    lsl.w #6,d1
    add.w d1,a0
    add.w d0,a0
    clr.w d1
    move.b (a0),d1
    sub.w d1,d3
    rts

; last case , x<0 and y <0
atan2_128_yneg2:
    neg.w d0
    neg.w d1
    subq #1,d1
    subq #1,d0
    asr.w #1,d0
    asr.w #1,d1

    lsl.w #6,d1
    add.w d1,a0
    add.w d0,a0
    clr.w  d1
    move.b (a0),d1
    sub.w d1,d3
    neg.w d3
    rts

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

;// Funzione per convertire un intero in formato Q2.6
;unsigned char convertToQ2_6(double value) {
;    unsigned char result;
;    int intpart = (int) value;
;//    printf("Integer part is %d\n",intpart);
;    double decpart = value - intpart;
;//    printf("Decimal part is %f\n",decpart);
;    
;    if (intpart==3)      result = 0b11000000;
;    else if (intpart==2) result = 0b10000000;
;    else if (intpart==1) result = 0b01000000;
;    else                 result = 0b00000000;
;    
;    // start of decimal
;    double appdecpart = decpart;
;    appdecpart*=2;   
;    if (appdecpart>=1)
;    {
;        result |= 0b00100000;
;        appdecpart = appdecpart -1;
;    }
;    
;    appdecpart*=2;   
;    if (appdecpart>=1)
;    {
;        result |= 0b00010000;
;        appdecpart = appdecpart -1;
;    }
;    
;    appdecpart*=2;
;    if (appdecpart>=1)
;    {
;        result |= 0b00001000;
;        appdecpart = appdecpart -1;
;    }
;    
;    appdecpart*=2;   
;    if (appdecpart>=1)
;    {
;        result |= 0b00000100;
;        appdecpart = appdecpart -1;
;    }
;    
;    appdecpart*=2;   
;    if (appdecpart>=1)
;    {
;        result |= 0b00000010;
;        appdecpart = appdecpart -1;
;    }
;    
;    appdecpart*=2;   
;    if (appdecpart>=1)
;    {
;        result |= 0b00000001;
;        appdecpart = appdecpart -1;
;    }
;    
;    
;    
;    return result;
;}
;
;int main() {
;    // Esempio di utilizzo
;    
;    for (int x=1;x<=62;x++)
;    {
;//      double inputValue = 0.7854;
;      for (int y = 1; y<=62; y++)
;      {
;        double inputValue = atan2(y,x)/M_PI;
;        // Convertire l'intero nel formato Q2.6
;        unsigned char result = convertToQ2_6(inputValue);
;//        printf("Input is %f - Result is 0x%02X %c%c%c%c%c%c%c%c\n",inputValue,result,BYTE_TO_BINARY(result));
;        printf("dc.b %%%c%c%c%c%c%c%c%c ; X:%d Y:%d InputValue: %f\n",BYTE_TO_BINARY(result),x,y,inputValue);
;      }
;    }
;    
;    unsigned char result = convertToQ2_6(M_PI);
;    printf("PI is %%%c%c%c%c%c%c%c%c\n",BYTE_TO_BINARY(result));
;
;    return 0;
;}