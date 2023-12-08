#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#define BYTE_TO_BINARY_PATTERN "%c%c%c%c%c%c%c%c"
#define BYTE_TO_BINARY(byte)  \
  ((byte) & 0x80 ? '1' : '0'), \
  ((byte) & 0x40 ? '1' : '0'), \
  ((byte) & 0x20 ? '1' : '0'), \
  ((byte) & 0x10 ? '1' : '0'), \
  ((byte) & 0x08 ? '1' : '0'), \
  ((byte) & 0x04 ? '1' : '0'), \
  ((byte) & 0x02 ? '1' : '0'), \
  ((byte) & 0x01 ? '1' : '0') 

// Funzione per convertire un intero in formato Q2.6
unsigned char convertToQ2_6(double value) {
    unsigned char result;
    int intpart = (int) value;
//    printf("Integer part is %d\n",intpart);
    double decpart = value - intpart;
//    printf("Decimal part is %f\n",decpart);
    
    /*if (intpart==3) 	 result = 0b11000000;
    else if (intpart==2) result = 0b10000000;
    else if (intpart==1) result = 0b01000000;
    else 	         result = 0b00000000;*/

    result = 0;
    if (value>=0.499999)
    {
        printf("Error, value out of range %f\n",value);
        exit(1);
    }
    
    // start of decimal
    double appdecpart = value;

    appdecpart*=2;   
    if (appdecpart>=1)
    {
        appdecpart = appdecpart -1;
    }

    appdecpart*=2;   
    if (appdecpart>=1)
    {
        result |= 0b10000000;
        appdecpart = appdecpart -1;
    }
    
    appdecpart*=2;   
    if (appdecpart>=1)
    {
        result |= 0b01000000;
        appdecpart = appdecpart -1;
    }
    
    appdecpart*=2;
    if (appdecpart>=1)
    {
        result |= 0b00100000;
        appdecpart = appdecpart -1;
    }
    
    appdecpart*=2;   
    if (appdecpart>=1)
    {
        result |= 0b00010000;
        appdecpart = appdecpart -1;
    }
    
    appdecpart*=2;   
    if (appdecpart>=1)
    {
        result |= 0b00001000;
        appdecpart = appdecpart -1;
    }
    
    appdecpart*=2;   
    if (appdecpart>=1)
    {
        result |= 0b00000100;
        appdecpart = appdecpart -1;
    }

    appdecpart*=2;   
    if (appdecpart>=1)
    {
        result |= 0b00000010;
        appdecpart = appdecpart -1;
    }

    appdecpart*=2;   
    if (appdecpart>=1)
    {
        result |= 0b00000001;
        appdecpart = appdecpart -1;
    }
    
    
    
    return result;
}

int main() {
    // Esempio di utilizzo
    
    for (int x=1;x<=128;x+=2)
    {
//      double inputValue = 0.7854;
      for (int y = 1; y<=128; y+=2)
      {
        double inputValue = atan2(y,x)/M_PI;
        // Convertire l'intero nel formato Q2.6
        unsigned char result = convertToQ2_6(inputValue);
//        printf("Input is %f - Result is 0x%02X %c%c%c%c%c%c%c%c\n",inputValue,result,BYTE_TO_BINARY(result));
        printf("dc.b %%%c%c%c%c%c%c%c%c ; X:%d Y:%d InputValue: %f\n",BYTE_TO_BINARY(result),x,y,inputValue);
      }
    }
    
    //unsigned char result = convertToQ2_6(M_PI);
    //printf("PI is %%%c%c%c%c%c%c%c%c\n",BYTE_TO_BINARY(result));

    return 0;
}