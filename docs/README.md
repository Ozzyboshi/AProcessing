# Quick reference guide

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
