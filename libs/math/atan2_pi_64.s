ATAN2_PI_64:
    lea ATAN2_1_QUADRANT(PC),a0                         
    
    btst #15,d1 ; if x < 0 branch to atan2_xneg
    bne.s atan2_xneg
    
    tst.w d0; if y = 0 the tangent does not exists - return zero
    beq.s anan2_ret_zero

    ; check if X=0 and Y!=0
    tst.w d1
    beq.s atan2_resolve_y

    ; if y < 0 branch to atan2_yneg
    btst #15,d0
    bne.s atan2_yneg                                 

    ; go to the beginning of X
    subq #1,d1
    subq #1,d0
    mulu #62,d1
    add.l d1,a0
    add.w d0,a0
    move.b (a0),d3
    ext.w d3
    
    rts
    
; handle X>0 and Y=0
anan2_ret_zero:
    moveq #0,d3
    rts
    
; handle X=0 and Y!=0
atan2_resolve_y:
   move.w #%00100000,d3
   btst #15,d0
   beq.s atan2_resolve_y2
   neg.w d3
   rts
atan2_resolve_y2:
   rts
   
atan2_yneg:
    ; go to the beginning of X
    neg.w d0
    subq #1,d1
    subq #1,d0
    mulu #62,d1
    add.l d1,a0
    add.w d0,a0
    move.b (a0),d3
    ext.w d3

    neg.w d3
    rts
    
; start considering X < 0
atan2_xneg:

    ; d3 must represent 1
    move.w #%01000000,d3
    
    tst.w d0; if y = 0 the tangent is pi
    bne.s atan2_ret_no_pi
    rts
atan2_ret_no_pi:

    btst #15,d0
    bne.s atan2_yneg2
; third case, x<0 and y > 0
    neg.w d1
    subq #1,d1
    subq #1,d0
    mulu #62,d1
    add.l d1,a0
    add.l d0,a0
    sub.b (a0),d3
    ext.w d3
    rts

; last case , x<0 and y <0
atan2_yneg2:
    neg.w d0
    neg.w d1
    subq #1,d1
    subq #1,d0
    mulu #62,d1
    add.l d1,a0
    add.w d0,a0
    sub.b (a0),d3
    ext.w d3
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