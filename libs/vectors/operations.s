XVECTOR EQU 0
YVECTOR EQU 2

; CREATE2DVECTOR - Create (or better, initializes) a 2d vector
; Input: 
;   - d0.w: x value
;   - d1.w: y value
;   - address of the vector as first arg of the macro, can be a LABEL or register, in the latter case pass without brackets
; Output: nothing
; Trashes: nothing
CREATE2DVECTOR MACRO
  IFC '','\1'
  fail missing parameter!
  MEXIT
  ENDC
  IFC 'a0','\1'
    move.w    d0,(\1)
    move.w    d1,2(\1)
    MEXIT
  ENDC
  IFC  'a1','\1'
    move.w    d0,(\1)
    move.w    d1,2(\1)
    MEXIT
  ENDC
  IFC  'a2','\1'
    move.w    d0,(\1)
    move.w    d1,2(\1)
    MEXIT
  ENDC
  IFC  'a3','\1'
    move.w    d0,(\1)
    move.w    d1,2(\1)
    MEXIT
  ENDC
  IFC  'a4','\1'
    move.w    d0,(\1)
    move.w    d1,2(\1)
    MEXIT
  ENDC
  IFC  'a5','\1'
    move.w    d0,(\1)
    move.w    d1,2(\1)
    MEXIT
  ENDC
  IFC  'a6','\1'
    move.w    d0,(\1)
    move.w    d1,2(\1)
    MEXIT
  ENDC
  move.w    d0,\1
  move.w    d1,2+\1
  ENDM

; ADD2DVECTOR - add 2 2d vector and place the result in the second vector
; Input: 
;   - a0.l: address of first vector
;   - a1.l: address of second vector
;   - address of the result vector as first arg of the macro
; Output: nothing
; Trashes:
;   - d0 (only on m68k mode)
;   - d1
ADD2DVECTOR MACRO
  IFD       VAMPIRE
  LOAD      -4(a1),d1
  paddw     -4(a0),d1,d1
  move.l    d1,(a1)
  ELSE
  move.w    (a0),d0
  move.w    2(a0),d1
  add.w     d0,(a1)
  add.w     d1,2(a1)
  ENDC
  ENDM

; ADD2DVECTORSTATIC - add 2 2d vector and place the result in a third vector
; Input: 
;   - a0.l: address of first vector
;   - a1.l: address of second vector
;   - address of the result vector as first arg of the macro
; Output: nothing
; Trashes:
;   - d0 (only on m68k mode)
;   - d1
ADD2DVECTORSTATIC MACRO
  IFD       VAMPIRE
  LOAD      -4(a1),d1
  paddw     -4(a0),d1,d1
  move.l    d1,\1
  ELSE
  move.w    (a0),d0
  move.w    2(a0),d1
  add.w     (a1),d0
  add.w     2(a1),d1
  move.w    d0,\1
  move.w    d1,2+\1
  ENDC
  ENDM

; SUB2DVECTOR - subtract 2 2d vector and place the result in the second vector
; Input: 
;   - a0.l: address of first vector
;   - a1.l: address of second vector
;   - address of the result vector as first arg of the macro
; Output: nothing
; Trashes:
;   - d0
;   - d1 (only on m68k mode)
SUB2DVECTOR MACRO
  IFD       VAMPIRE
  LOAD      -4(a0),d0
  psubw     -4(a1),d0,d0
  move.l    d0,(a1)
  ELSE
  move.w    (a0),d0
  move.w    2(a0),d1
  sub.w     (a1),d0
  sub.w     2(a1),d1
  move.w    d0,(a1)
  move.w    d1,2(a1)
  ENDC
  ENDM

; SUB2DVECTORSTATIC - subtract 2 2d vector and place the result in a third vector
; Input: 
;   - a0.l: address of first vector
;   - a1.l: address of second vector
;   - address of the result vector as first arg of the macro
; Output: nothing
; Trashes:
;   - d0
;   - d1 (only on m68k mode)
SUB2DVECTORSTATIC MACRO
  IFD       VAMPIRE
  LOAD      -4(a0),d0
  psubw     -4(a1),d0,d0
  move.l    d0,\1
  ELSE
  move.w    (a0),d0
  move.w    2(a0),d1
  sub.w     (a1),d0
  sub.w     2(a1),d1
  move.w    d0,\1
  move.w    d1,2+\1
  ENDC
  ENDM

; MUL2DVECTOR - multiply 2 2d vector and place the result in the second vector
; Input: 
;   - a0.l: address of first vector
;   - a1.l: address of second vector
;   - address of the result vector as first arg of the macro
; Output: nothing
; Trashes:
;   - d0 (only on m68k mode)
;   - d1
MUL2DVECTOR MACRO
  IFD       VAMPIRE
  LOAD      -4(a1),d1
  pmull     -4(a0),d1,d1
  move.l    d1,(a1)
  ELSE
  move.w    (a0),d0
  move.w    2(a0),d1
  muls.w    (a1),d0
  muls.w    2(a1),d1
  move.w    d0,(a1)
  move.w    d1,2(a1)
  ENDC
  ENDM

; DIV2DVECTOR - divide 2 2d vectors and place the result in the second vector
; Input: 
;   - a0.l: address of first vector
;   - a1.l: address of second vector
;   - address of the result vector as first arg of the macro
; Output: nothing
; Trashes:
;   - d0
;   - d1
DIV2DVECTOR MACRO
  move.w    (a0),d0
  move.w    2(a0),d1
  ext.l     d0
  ext.l     d1
  divs      (a1),d0
  divs      2(a1),d1
  move.w    d0,(a1)
  move.w    d1,2(a1)
  ENDM

; MUL2DVECTORSTATIC - multiply 2 2d vectors and place the result in a third vector
; Input: 
;   - a0.l: address of first vector
;   - a1.l: address of second vector
;   - address of the result vector as first arg of the macro
; Output: nothing
; Trashes:
;   - d0
;   - d1 (only on m68k mode)
MUL2DVECTORSTATIC MACRO
  IFD       VAMPIRE
  LOAD      -4(a0),d0
  pmull     -4(a1),d0,d0
  move.l    d0,\1
  ELSE
  move.w    (a0),d0
  move.w    2(a0),d1
  muls.w    (a1),d0
  muls.w    2(a1),d1
  move.w    d0,\1
  move.w    d1,2+\1
  ENDC
  ENDM

; DIV2DVECTORSTATIC - divide 2 2d vectors and place the result in a third vector
; Input: 
;   - a0.l: address of first vector
;   - a1.l: address of second vector
;   - address of the result vector as first arg of the macro
; Output: nothing
; Trashes:
;   - d0
;   - d1
DIV2DVECTORSTATIC MACRO
  move.w    (a0),d0
  move.w    2(a0),d1
  ext.l     d0
  ext.l     d1
  divs      (a1),d0
  divs      2(a1),d1
  move.w    d0,\1
  move.w    d1,2+\1
  ENDM

; GET2DMAGNITUDE - get magnitude of 2d vector
; Input: 
;   - a0.l: address of vector
; Output:
;   - d0.w: magnitude of the vector (rounded to integer)
; Trashes:
;   - d0
;   - d1
  IFD SQRT_SMALL
GET2DMAGNITUDE MACRO
	move.w    (a0),d0
  muls.w     d0,d0
  move.w    2(a0),d1
  muls.w     d1,d1
  add.w      d1,d0
	jsr       sqrt_1
  ENDM

  ; set2dmagnitude
; a0 pointer to vector
; d7 magnitude
SET2DMAGNITUDE:
  GET2DMAGNITUDE
SET2DMAGNITUDE_NOGET:

  tst.w     d0
  bne.s     GET2DMAGNITUDE_NODIV
  move.l    #0,(a0)
  rts
GET2DMAGNITUDE_NODIV:

  move.w    (a0),d1
  move.w    2(a0),d2

  muls      d7,d1
  muls      d7,d2

  divs d0,d1
  divs d0,d2

  move.w d1,(a0)
  move.w d2,2(a0)
  rts 



*************************************************************************
*                                                                       *
*       Faster Integer Square Root (16 to 8 bit).  For small arguments. *
*                                                                       *
*       (Exact method, not approximate).                                *
*                                                                       *
*       Call with:                                                      *
*               D0.W = Unsigned number.                                 *
*                                                                       *
*       Returns:                                                        *
*               D0.W - SQRT(D0.W)                                       *
*                                                                       *
*       Notes:  Result fits in D0.B, but is valid in word.              *
*               Takes from 72 (d0=1) to 504 cycles (d0=625) cycles      *
*               (including rts).                                        *
*                                                                       *
*       Algorithm supplied by Motorola.                                 *
*                                                                       *
*************************************************************************

* Use the theorem that a perfect square is the sum of the first
* sqrt(arg) number of odd integers.
 
*                       Cycles
sqrt_1:
        move.w d1,-(sp)
        move.w #-1,d1
qsqrt1  addq.w #2,d1
        sub.w d1,d0
        bpl.s  qsqrt1
        asr.w #1,d1
        move.w d1,d0
        move.w (sp)+,d1
        rts
  ENDC

  IFD SQRT_MEDIUM
GET2DMAGNITUDE MACRO

	move.w    (a0),d0
  muls     d0,d0
  move.w    2(a0),d1
  muls     d1,d1
  add.w      d1,d0
	jsr       gsqrt
  ENDM

  ; set2dmagnitude
; a0 pointer to vector
; d7 magnitude
SET2DMAGNITUDE:
  GET2DMAGNITUDE
SET2DMAGNITUDE_NOGET:
  tst.w     d0
  bne.s     GET2DMAGNITUDE_NODIV
  move.l    #0,(a0)
  rts
GET2DMAGNITUDE_NODIV:

  move.w    (a0),d1
  move.w    2(a0),d2

  muls      d7,d1
  muls      d7,d2

  divs d0,d1
  divs d0,d2

  move.w d1,(a0)
  move.w d2,2(a0)
  rts 



*************************************************************************
*                                                                       *
*       Integer Square Root (16 to 8 bit).                              *
*                                                                       *
*       (Exact method, not approximate).                                *
*                                                                       *
*       Call with:                                                      *
*               D0.W = Unsigned number.                                 *
*                                                                       *
*       Returns:                                                        *
*               D0.L - SQRT(D0.W)                                       *
*                                                                       *
*       Uses:   D1-D4 as temporaries --                                 *
*               D1 = Error term;                                        *
*               D2 = Running estimate;                                  *
*               D3 = High bracket;                                      *
*               D4 = Loop counter.                                      *
*                                                                       *
*       Notes:  Result fits in D0.B, but is valid in word.              *    
*                                                                       *
*               Takes from 512 to 592 cycles (including rts).           *
*                                                                       *
*               Instruction times for branch-type instructions          *
*               listed as (X/Y) are for (taken/not taken).              *
*                                                                       *
*************************************************************************

*                       Cycles
gsqrt   movem.l d1-d4,-(sp) (24)
        move.w #7,d4    (8)     ; Loop count (bits-1 of result).
        clr.w d1        (4)     ; Error term in D1.
        clr.w d2        (4)
sqrt1   add.w d0,d0     (4)     ; Get 2 leading bits a time and add
        addx.w d1,d1    (4)     ; into Error term for interpolation.
        add.w d0,d0     (4)     ; (Classical method, easy in binary).
        addx.w d1,d1    (4)
        add.w d2,d2     (4)     ; Running estimate *2.
        move.w d2,d3    (4)
        add.w d3,d3     (4)
        cmp.w d3,d1     (4)
        bls.s sqrt2     (10/8)  ; New Error term > 2* Running estimate?
        addq.w #1,d2    (4)     ; Yes, we want a '1' bit then.
        addq.w #1,d3    (4)     ; Fix up new Error term.
        sub.w d3,d1     (4)
sqrt2   dbra d4,sqrt1   (10/14) ; Do all 8 bit-pairs.
        move.w d2,d0    (4)
        movem.l (sp)+,d1-d4 (28)
        rts             (16)
  ENDC



  IFD SQRT_BIG
GET2DMAGNITUDE MACRO
	move.w    (a0),d0
  muls     d0,d0
  move.w    2(a0),d1
  muls     d1,d1
  add.l      d1,d0
	jsr       glsqrt
  ENDM

; set2dmagnitude
; a0 pointer to vector
; d7 magnitude
SET2DMAGNITUDE:
  GET2DMAGNITUDE
SET2DMAGNITUDE_NOGET:
  tst.w     d0
  bne.s     GET2DMAGNITUDE_NODIV
  move.l    #0,(a0)
  rts
GET2DMAGNITUDE_NODIV:

  move.w    (a0),d1
  move.w    2(a0),d2

  muls      d7,d1
  muls      d7,d2

  divs d0,d1
  divs d0,d2

  move.w d1,(a0)
  move.w d2,2(a0)
  rts 

  *************************************************************************
*                                                                       *
*       Integer Square Root (32 to 16 bit).                             *
*                                                                       *
*       (Exact method, not approximate).                                *
*                                                                       *
*       Call with:                                                      *
*               D0.L = Unsigned number.                                 *
*                                                                       *
*       Returns:                                                        *
*               D0.L - SQRT(D0.L)                                       *
*                                                                       *
*       Uses:   D1-D4 as temporaries --                                 *
*               D1 = Error term;                                        *
*               D2 = Running estimate;                                  *
*               D3 = High bracket;                                      *
*               D4 = Loop counter.                                      *
*                                                                       *
*       Notes:  Result fits in D0.W, but is valid in longword.          *    
*                                                                       *
*               Takes from 1080 to 1236 cycles (including rts).         *
*                                                                       *
*               Two of the 16 passes are unrolled from the loop so that *
*               quicker instructions may be used where there is no      *
*               danger of overflow (in the early passes).               *
*                                                                       *
*               Instruction times for branch-type instructions          *
*               listed as (X/Y) are for (taken/not taken).              *
*                                                                       *
*************************************************************************

*                       Cycles
glsqrt  movem.l d1-d4,-(sp) (40)
        moveq #13,d4    (4)     ; Loop count (bits-1 of result).
        moveq #0,d1     (4)     ; Error term in D1.
        moveq #0,d2     (4)
lsqrt1  add.l d0,d0     (8)     ; Get 2 leading bits a time and add
        addx.w d1,d1    (4)     ; into Error term for interpolation.
        add.l d0,d0     (8)     ; (Classical method, easy in binary).
        addx.w d1,d1    (4)
        add.w d2,d2     (4)     ; Running estimate * 2.
        move.w d2,d3    (4)
        add.w d3,d3     (4)
        cmp.w d3,d1     (4)
        bls.s lsqrt2    (10/8)  ; New Error term > 2* Running estimate?
        addq.w #1,d2    (4)     ; Yes, we want a '1' bit then.
        addq.w #1,d3    (4)     ; Fix up new Error term.
        sub.w d3,d1     (4)
lsqrt2  dbra d4,lsqrt1  (10/14) ; Do first 14 bit-pairs.
        add.l d0,d0     (8)     ; Do 15-th bit-pair.
        addx.w d1,d1    (4)
        add.l d0,d0     (8)
        addx.l d1,d1    (8)
        add.w d2,d2     (4)
        move.l d2,d3    (4)
        add.w d3,d3     (4)
        cmp.l d3,d1     (6)
        bls.s lsqrt3    (10/8)
        addq.w #1,d2    (4)
        addq.w #1,d3    (3)
        sub.l d3,d1     (8)

lsqrt3  add.l d0,d0     (8)     ; Do 16-th bit-pair.
        addx.l d1,d1    (8)
        add.l d0,d0     (8)
        addx.l d1,d1    (8)
        add.w d2,d2     (4)
        move.l d2,d3    (4)
        add.l d3,d3     (8)
        cmp.l d3,d1     (6)
        bls.s lsqrt4    (10/8)
        addq.w #1,d2    (4)
lsqrt4  move.w d2,d0    (4)
        movem.l (sp)+,d1-d4 (44)
        rts             (16)
  ENDC

  ; Set2dmagnitude_fake
  ; Does not perform pitagora for normalizing
  ; instead it assume ipotenusa = cateto1+cateto2
  ; load vector addr in a0
  ; set magnitude in d7 as integer
  ; Warning!!!!!!! input & result will use least significant 6 digits for decimal part
  ; so if you need only the integer part right shift each vector component to the
  ; right by 6
  IFD SQRT_FAKE
  
SET2DMAGNITUDE_FAKE:
  moveq #0,d1
  moveq #0,d2
  move.w (a0),d1
  move.w 2(a0),d2

  move.w d1,d5
  bpl.s SET2DMAGNITUDE_FAKE_ABS_1
  neg.w d5
SET2DMAGNITUDE_FAKE_ABS_1:
  move.w d2,d6
  bpl.s SET2DMAGNITUDE_FAKE_ABS_2
  neg.w d6
SET2DMAGNITUDE_FAKE_ABS_2:
  
  asr.w #6,d5
  asr.w #6,d6

  add.w d5,d6
  beq.s SET2DMAGNITUDE_FAKE_RET_ZERO

  ; Normalize
  ext.l d1
  divs.w d6,d1
  ext.l d2
  divs.w d6,d2

  muls.w d7,d1
  muls.w d7,d2
  asr.l #6,d1
  asr.l #6,d2

  move.w d1,(a0)
  move.w d2,2(a0)

  rts
SET2DMAGNITUDE_FAKE_RET_ZERO:
  move.l #0,(a0)
  rts
  ENDC

; LIMIT2DVECTOR - Limit the magnitude of this vector to the value used for the max parameter
; Input: 
;   - a0.l: address of the vector to check agains the limit
;   - d7.w: the maximum magnitude for the vector
; Output: nothing
; Trashes:
;   - d0
;   - d1
;   - d7
LIMIT2DVECTOR:
	GET2DMAGNITUDE
	cmp.w     d0,d7
	bgt.s     limit2dvector_nochange
	jsr       SET2DMAGNITUDE_NOGET
limit2dvector_nochange:
	rts

; CREATE2DVECTORFROMANGLE - Create a new vector using an angle
; Input: 
;   - a0.l: address of the vector to initialize
;   - d7.w: angle in degrees (range 0-359)
; Output: nothing
; Trashes:
;   - a0
;   - d7
CREATE2DVECTORFROMANGLE MACRO
	lea VECTOR_TRIGTABLE,a1
  lsl.w #2,d7
  move.l (a1,d7.w),(a0)
	ENDM

; MUL2DVECTOR1X2 - multiply a scalar value with a 2d vector and place the result in the 2d vector
; Input: 
;   - a0.l: address of first monodimentional vector
;   - a1.l: address of second 2d vector vector
; Output: nothing
; Trashes:
;   - d0
;   - d1
MUL2DVECTOR1X2 MACRO
    move.w   (a1),d0
    move.w    2(a1),d1
    muls.w    (a0),d0
    muls.w    (a0),d1
    move.w    d0,(a1)
    move.w    d1,2(a1)
    ENDM