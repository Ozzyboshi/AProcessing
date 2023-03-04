# Quick reference guide

### General math instructions
- #### ABS_WORD - Get absolute value for a word (MACRO)
  Input: 
  - Dx.w or Address

  Output:
    Nothing
    
  Defines:
    Nothing
    
  Trashes:
    Nothing
     
  Example: Get abs of -1
   
  ```
  move.w           #$1,OPERAND1
  ABS_WORD         OPERAND1
  ```
  At address OPERAND1 (word) we have $0001

### CPU Drawing instructions

- #### POINT - Plots a point (CPU)

  Input:
  - d0.w : Point X (0-319)
  - d1.w : Point Y (0-255)

  Output:
    Nothing

  Defines:
  - USE_CLIPPING
  - USE_DBLBUF

  Trashes:
  - d0
  - d1
  - a0
  - a1

  Example: Plot a point at coord X=5 and Y=5

  ```asm
  moveq #5,d0
  moveq #5,d1
  jsr POINT
  ```
  
- #### LINE - Draws a line (CPU) (FILLTABLE) (MACRO)

  Input:
  - param1 : Point X1 (0-319)
  - param2 : Point Y1 (0-255)
  - param3 : Point X2 (0-319)
  - param4 : Point Y2 (0-255)

  Output:
    Nothing

  Defines:
  - USE_CLIPPING
  - USE_DBLBUF

  Trashes:
  - a1

  Example: Draw cartesian axes with the origin at the center of the screen

  ```asm
  LINE                  #WIDTH/2,#0,#WIDTH/2,#HEIGHT-1
  LINE                  #0,#HEIGHT/2,#WIDTH-1,#HEIGHT/2
  ```
  
  **Note**: The *LINE_NODRAW* macro perform the same exact operation but just sets up the fill table and does not print anything on the screen.
  To print run function which addr is inside *AMMX_FILL_FUNCT_ADDR*.

  **Note**: The *LINE_NODRAW* macro is ment to be used in combination with *FILL_TABLE* and does not take into account the transformation matrix. If you want the draw to be done according to the transformation matrix use LINEDRAW instead (description following)

#### LINEDRAW - Draws a line (CPU) (FILLTABLE) (MACRO)
##### This version is different from DRAW because it takes into account the transformation matrix.

  Input:
  - param1 : Point X1 (0-319)
  - param2 : Point Y1 (0-255)
  - param3 : Point X2 (0-319)
  - param4 : Point Y2 (0-255)

  Output:
    Nothing

  Defines:
  - USE_CLIPPING
  - USE_DBLBUF

  Trashes: nothing

  Example: Draw cartesian Y axis with the origin at the center of the screen

  ```asm
  ; Go to the center
  move.w #WIDTH/2,d0
  move.w #HEIGHT/2,d1
  jsr TRANSLATE

  LINEDRAW                  #0,#-HEIGHT/2,#0,#HEIGHT/2
  ```
  
  WARNING!!!! Do not use d0 and d1 for passing values, if you want to use data registers please use from d2 up to d7, for example:
  ```asm
  ; Go to the center
  move.w #WIDTH/2,d0
  move.w #HEIGHT/2,d1
  jsr TRANSLATE

  move.w DEBUGVECTOR,d2
  move.w DEBUGVECTOR+2,d3
  STROKE #2
  LINEDRAW #0,#0,d2,d3
  ```

- #### RECT - Draws a rectangle (CPU)

  Input:
  - d0.w : First point X (0-319)
  - d1.w : First point Y (0-255)
  - d5.w : Width in pixels -1
  - d6.w : Height in pixels -1
  
  Output:
    Nothing
  Defines:
  - USE_CLIPPING
  - USE_DBLBUF
  
  Trashes: nothing
  
  Example: Draw a rectangle with upper left point at the origin with width 11px and  height 3 px

  ```asm
    move.w            #0,d0
    move.w            #0,d1
    move.w            #10,d5
    move.w            #2,d6
    
    jsr               RECT
  ```

### Vector instructions

#### CREATE2DVECTOR - Create (or better, initializes) a 2d vector

 Input:

- d0.w: x value
- d1.w: y value
- address of the vector as first arg of the macro

 Output: nothing

 Trashes: nothing

 Example: Create a new 2d vector with x=3 and y=4

  ```asm
  VECTOR1:
  dc.l                 0
  ...
  ; vector 1 is 3,4
  moveq                #3,d0
  moveq                #4,d1
  CREATE2DVECTOR       VECTOR1    
  ```
  
  Example: Create a new 2d vector with x=10 and y=11 using addr register

  ```asm
  VECTOR1:
  dc.l                 0
  ...
  lea VECTOR1,a0
  moveq                #$A,d0
  moveq                #$B,d1
  CREATE2DVECTOR       a0
  ```
  
 #### CREATE2DVECTORFROMANGLE - Create (or better, initializes) a 2d vector using an angle as the input, the magnitude of the vector will be one (MACRO)

 Input:

- a0.l: address of vector to initialize
- d7.w: Angle in degrees (range 0-359)

 Output: nothing

 Trashes:
 - a0
 - d7

 Example: Create a new 2d vector with angle 90 and length = 1

  ```asm
  VECTOR1:
  dc.l                 0
  ...
  ; vector 1 is 3,4
  moveq                #90,d7
  lea                  VECTOR1,a0
  CREATE2DVECTORFROMANGLE    
  ```
  
#### ADD2DVECTOR - add 2 2d vectors and place the result in the second vector
  Input: 
  
  - a0.l: address of first vector
  - a1.l: address of second vector (the content will be overwritten with the result of the operation)
  
  Output: nothing
  
  Trashes:
  - d0 (only on m68k mode)
  - d1
    
  Example: Store VECTOR1+VECTOR2 inside VECTOR2

  ```asm
  VECTOR1:
  dc.l                 0
  
  VECTOR2:
  dc.l                 0
  
  ...
  lea                  VECTOR1,a0
  lea                  VECTOR2,a1
  ADD2DVECTOR  
  ```
  
#### SUB2DVECTORSTATIC - Subtract 2 2d vectors and place the result in the third

 Input:

- a0.l: address of first vector (minuend)
- a1.l: address of second vector (subtrahend)
- address of the destination vector

 Output: nothing

 Trashes: ???

 Example: Store VECTOR1-VECTOR2 to VECTOR3

  ```asm
  VECTOR1:
  dc.l                 0
  
  VECTOR2:
  dc.l                 0
  
  VECTOR3:
  dc.l                 0
  ...
  lea                  VECTOR1,a0
  lea                  VECTOR2,a1
  SUB2DVECTORSTATIC    VECTOR3    
  ```
  
 #### MUL2DVECTOR1X2 - Multiply a scalar value with a 2d vector and place the result in the 2d vector

 Input:

- a0.l: address of first monodimentional vector
- a1.l: address of second 2d vector

 Output: nothing

 Trashes:
 
 - d0
 - d1
 
 Example: Store SCALAR VALUE*VECTOR2 to VECTOR2

  ```asm
  VECTOR1:
  dc.l                 0
  
  VECTOR2:
  dc.l                 0
  
  ...
  ; vector 1 is 3
  move.w #3,VECTOR1

  ; vector 2 is 5,7
  moveq                #5,d0
  moveq                #7,d1
  CREATE2DVECTOR       VECTOR2 
  
   ; mul them
  lea                  VECTOR1,a0
  lea                  VECTOR2,a1
  MUL2DVECTOR1X2
  ```

#### MUL2DVECTOR1X2_Q4_12 - Multiply a scalar value with a 2d vector and place the result in the 2d vector, all vectors on Q4,12 format

 Input:

- a0.l: address of first monodimentional vector
- a1.l: address of second 2d vector

 Output: nothing

 Trashes:
 
 - d0
 - d1
 
 Example: Store SCALAR VALUE*VECTOR2 to VECTOR2

  ```asm
  VECTOR1:
  dc.l                 0
  
  VECTOR2:
  dc.l                 0
  
  ...
  ; vector 1 is 0.5 in q4,12 format
  move.w #2048,VECTOR1

  ; vector 2 is 3,3 in q4,12 format
  move.w                #12288,d0
  move.w                #12288,d1
  CREATE2DVECTOR       VECTOR2 
  
   ; mul them
  lea                  VECTOR1,a0
  lea                  VECTOR2,a1
  MUL2DVECTOR1X2_Q4_12
  
  ; result in vector 2 must be 1.5,1.5 (binary is 0001.100000000000)
  ```


#### DIV2DVECTOR1X2 - Divide a scalar value with a 2d vector and place the result in the 2d vector

 Input:

- a0.l: address of first monodimentional vector
- a1.l: address of second 2d vector

 Output: nothing

 Trashes:
 
 - d0
 - d1
 
 Example: Store SCALAR VALUE/VECTOR2 to VECTOR2

  ```asm
  VECTOR1:
  dc.l                 0
  
  VECTOR2:
  dc.l                 0
  
  ...
  ; vector 1 is 3
  move.w #3,VECTOR1

  ; vector 2 is 15,21
  moveq                #15,d0
  moveq                #21,d1
  CREATE2DVECTOR       VECTOR2 
  
   ; div them
  lea                  VECTOR1,a0
  lea                  VECTOR2,a1
  DIV2DVECTOR1X2
  ```

#### DIV2DVECTOR - Divide 2 2d vectors and place the result in the second vector

 Input:

- a0.l: address of first vector (dividend or numerator)
- a1.l: address of second vector (divisor) (the content will be overwritten with the result of the operation)

 Output: nothing

 Trashes:
 
 - d0
 - d1
 
 Warning: division by zero is not checked, if there is a zero on VECTOR2 it will result in a divide by zero exception!

 Example: Store VECTOR1/VECTOR2 to VECTOR3

  ```asm
  VECTOR1:
  dc.l                 0
  
  VECTOR2:
  dc.l                 0
  
  ...
  lea                  VECTOR1,a0
  lea                  VECTOR2,a1
  DIV2DVECTOR    
  ```

#### DIV2DVECTORSTATIC - Divide 2 2d vectors and place the result in the third (MACRO)

 Input:

- a0.l: address of first vector (dividend or numerator)
- a1.l: address of second vector (divisor)
- address of the destination vector

 Output: nothing

 Trashes:
 
 - d0
 - d1
 
 Warning: division by zero is not checked, if there is a zero on VECTOR2 it will result in a divide by zero exception!

 Example: Store VECTOR1/VECTOR2 to VECTOR3

  ```asm
  VECTOR1:
  dc.l                 0
  
  VECTOR2:
  dc.l                 0
  
  VECTOR3:
  dc.l                 0
  ...
  lea                  VECTOR1,a0
  lea                  VECTOR2,a1
  DIV2DVECTORSTATIC    VECTOR3    
  ```

### GET2DMAGNITUDE - get magnitude of 2d vector

 Input:

- a0.l: address of vector

 Output:

- d0.w: magnitude of the vector (rounded to integer)

 Trashes:

- d0
- d1

 Example: get the magnitude of vector 3,4

 ```asm
 lea VECTOR1,a0
 moveq                #$3,d0
 moveq                #$4,d1
 CREATE2DVECTOR       a0
 GET2DMAGNITUDE
 ; here d0 holds the value 5 which is the magnitude
 ```
 
 ### GET2DMAGNITUDE_Q10_6_TABLE_LOOKUP - get magnitude of 2d vector in Q10.6 format using LOOKUP Table (MACRO)

 Input:

- a0.l: address of vector

 Output:

- d0.w: magnitude of the vector (rounded to integer)

 Trashes:

- d0
- d1
- a1

 Example: get the magnitude of vector 3,4

 ```asm
  move.w               #30*64,d0
  move.w               #9*64,d1
  CREATE2DVECTOR       VECTOR1

  lea                  VECTOR1,a0
  GET2DMAGNITUDE_Q10_6_TABLE_LOOKUP
 ; here d0 holds the value $07d4 which is the magnitude in Q10.6 format
 ; in binary : %0000 0111 1101 0100
 ; in q10.6 format %11111.0101
 ; $11111 is 31
 ; $01.0100 is 0.25+0.0625 = 0.25625
 ; final result is 31.3125 (quite close to 31.3209195267)
 ```
 Note: include file libs/vectors/sqrt_q10_6_lookup_table.i which contains the lookup table in order to use this macro

### SET2DMAGNITUDE - set magnitude of 2d vector

 Input:

- a0.l: address of vector
- d7.w: desired magnitude (integer)

 Output:
    Input vector at address a0 will hold the new vector with the given magnitude

 Trashes:

- d0
- d1
- d2

 Example: set the magnitude of vector 3,4 to 100

 ```asm
 lea VECTOR1,a0
 moveq                #$3,d0
 moveq                #$4,d1
 CREATE2DVECTOR       a0
 moveq #100,d7
 jsr                  SET2DMAGNITUDE
 ; here a0 holds the address of the vector with magnitude set to 100
 ```

  Note: in order to use GET2DMAGNITUDE and SET2DMAGNITUDE use one of the following DEFINES according to the vector length:

- -DSQRT_SMALL
- -DSQRT_MEDIUM
- -DSQRT_BIG


### SET2DMAGNITUDE_FAKE - set magnitude of 2d vector without using sqrt (this is why it's fake)

 Input:

- a0.l: address of vector (least 6 significant bits are the decimal part)
- d7.w: desired magnitude (least 6 significant bits are the decimal part)


 Output:
  Input vector at address a0 will hold the new vector with the given magnitude

 Trashes:

- d0
- d1
- d2
- d5
- d6

 Example: set the magnitude of vector 3,4 to 1

 ```asm
 lea VECTOR1,a0
 moveq                #$3*64,d0
 moveq                #$4*64,d1
 CREATE2DVECTOR       a0
 moveq #1*64,d7
 jsr                  SET2DMAGNITUDE_FAKE
 ; here a0 holds the address of the vector with magnitude set to 100
 ```

  Note: in order to use SET2DMAGNITUDE_FAKE use SQRT_FAKE define
  
### SET2DMAGNITUDE_Q10_6_TABLE_LOOKUP - set magnitude of 2d vector in Q10.6 format using a lookup table

 Input:

- a0.l: address of vector (least 6 significant bits are the decimal part)
- d7.w: desired magnitude (least 6 significant bits are the decimal part)

 Output:
  Input vector at address a0 will hold the new vector with the given magnitude

 Trashes:

- d0
- d1
- a1

 Example: of 2dvector  0.5625,-0.828125 q10.6 fmt to 0.015625

 ```asm
 ; vector 1 is 0.5625,-0.828125
 lea                  VECTOR1,a0
 move.w               #$0024,d0
 move.w               #$FFCB,d1
 CREATE2DVECTOR       a0
 
 ; set mag 2^-6 (0.015625)
 move.w               #1,d7
  
 jsr                  SET2DMAGNITUDE_Q10_6_TABLE_LOOKUP
 ; here a0 holds the address of the vector with magnitude set to 0.015625
 ```

  Note: in order to use SET2DMAGNITUDE_Q10_6_TABLE_LOOKUP use Q10_6_TABLE_LOOKUP define and include libs/vectors/sqrt_q10_6_lookup_table.i


### SET2DMAGNITUDE_Q4_12_TABLE_LOOKUP - set magnitude of 2d vector in Q4.12 format using a lookup table

 Input:

- a0.l: address of vector (least 6 significant bits are the decimal part)
- d7.w: desired magnitude (least 6 significant bits are the decimal part)

 Output:
  Input vector at address a0 will hold the new vector with the given magnitude

 Trashes:

- d0
- d1
- a1

 Example: of 2dvector  0.5625,-0.828125 q10.6 fmt to 0.015625

 ```asm
 ; vector 1 is 0.5625,-0.828125
 lea                  VECTOR1,a0
 move.w               #%0000100100000000,d0
 move.w               #%0000110101000000,d1
 neg.w                d1
 CREATE2DVECTOR       a0
 
 ; set mag 2^-6 (0.015625)
 move.w               #%0000000001000000,d7
  
 jsr                  SET2DMAGNITUDE_Q4_12_TABLE_LOOKUP
 ; here a0 holds the address of the vector with magnitude set to 0.015625
 ```

  Note: in order to use SET2DMAGNITUDE_Q4_12_TABLE_LOOKUP use Q4_12_TABLE_LOOKUP define and include libs/vectors/sqrt_q4_12_lookup_table.i
 
### LIMIT2DVECTOR - Limit the magnitude of this vector to the value used for the max parameter

 Input:

- a0.l: address of the vector to check agains the limit
- d7.w: the maximum magnitude for the vector
 
 Output: Nothing

 Trashes:

- d0
- d1
- d7

 Example: set the magnitude of vector 3,4 to 1

 ```asm
 move.w                #100,d0
 move.w                #100,d1
 CREATE2DVECTOR       VECTOR1

 move.w                #10,d7
 lea                  VECTOR1,a0
 jsr                  LIMIT2DVECTOR
 ; here new vector will hold values 7,7 according to the new magnitude
 ```

### Matrix operation instructions

#### RESETMATRIX - Resets current transformation matrix to defaults in Q16,6 format

Input: Nothing

Output: Nothing

 Example: Set the current transformation matrix to
```
 1 0 0
 0 1 0
 0 0 1
```
 
  ```
  RESETMATRIX
  ```
  
#### LOADIDENTITYANDTRANSLATE - Reset matrix and Specifies an displace the origin of the axis within the display window

 Input:

- d0.w: x displacement (integer format)
- d1.w: y displacement (integer format)

 Output: nothing

 Trashes: nothing
  
 Example: change the origin to the center of the screen

   ```
   move.w                                        #WIDTH/2,d0
   move.w                                        #HEIGHT/2,d1
   jsr                                           LOADIDENTITYANDTRANSLATE
   ```

#### ROTATE - Rotate the current transformation matrix along the Z-Axis

 Input:

- d0.w: degrees (integer format)

 Output: nothing

 Trashes: nothing

 Example: Rotate transformation matrix of 45 counterclockwise
  ```
  moveq #45,d0
  jsr ROTATE
  ```

#### SCALE - Increases or decreases the size of a shape by expanding and contracting vertices

 Input:

- d0.w: x value (Q10,6 format)
- d1.w: y value (Q10,6 format)

 Output: nothing

 Trashes: nothing

 Example: scale 0,5 on Y axis

  ```
 move.w #%0000000001000000,d0
 move.w #%0000000000100000,d1
 jsr    SCALE
  ```
  
 #### SHEAR - Shear a shape by X and Y values

 Input:

- d0.w: x value (Q10,6 format)
- d1.w: y value (Q10,6 format)

 Output: nothing

 Trashes: nothing

 Example: shear 3x and 4y

  ```
 move.w                                        #%0000000011000000,d0
 move.w                                        #%0000000100000000,d1
 bsr.w                                         SHEAR
  ```

### Miscellaneous

- #### MAP -  Re-maps a number from one range to another

  Input:
  - d0.w : Number to remap
  - d1.w : Range 1 start
  - d2.w : Range 1 end
  - d3.w : Range 2 start
  - d4.w : Range 3 end

  Output:
    d4.w will be used to return new number

  Defines: nothing

  Trashes: nothing

  Example: Map 127 from range 0,254 to range 500,5500, result in d4

  ```asm
  move.w #127,d0
  move.w #0,d1
  move.w #254,d2
  move.w #500,d3
  move.w #5500,d4
  jsr MAP
  ```

- #### dec2txt -  Re-maps a number from word integer to string (useful for printing a number on screen)
  Input:
    - d0.w : Number to convert
    - a0.l : Address where to store the converted string (must be at least 5 bytes)
    
  Output: Nothing

  Defines: nothing

  Trashes:
    - d1
    - a0
    
  Example: Convert word 12345 into string

  ```asm
  lea     buffer,a0    ;pointer to the buffer
  move    #12345,d1     ;number to convert
  jsr dec2txt ; after this call buffer will be 01 02 03 04 05
  rts
  buffer: dc.b 0,0,0,0,0,0
  ```
