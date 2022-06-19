; buildcolortable - Fills a table with color fading from one color to another in arbitrary steps
; Input:
;	- d0.w : Color code start
;	- d1.w : Color code end
;   - d7.w : Number of steps -1 (for example if you want 32 steps put 31 in the lower word)
;   - a0.l : Address of the table to fill (WARNING!!!! this table must be zeroed before calling the function)
;
; Output:
;   All output is stored at addr given in a0

; Defines: nothing
;
; Trashes:
;   - d2
;   - d3
;   - d4
;   - d5
;   - d6
;   - d7
;   - a1

buildcolortable:
    move.l a0,a1 ; pointer to the output color table (be sure to allocate enough space)
    move.w d0,d2       ; save start value to d2 to manipulate
    move.w d1,d3       ; save end value to d3 to manupulate
    moveq #1,d6        ; another counter, this will go from 1 to steps
    
    ; save d7 in the high part of itself
    move.w d7,d5
    swap d7
    move.w d5,d7
    
    ; get the BLUE DIFFERENCE
    andi.w #$F,d2
    andi.w #$F,d3
    
    sub.b d3,d2
    
    lsl.w  #8,d2 ; multiply for dividing later
    move.w d7,d5
    addq #1,d5
    ext.l d2
    divs  d5,d2  ; d2 is 1 / steps x 256

; loop start
buildcolortableloopblue:
    move.w d2,d5
    muls  d6,d5
    asr.w #8,d5
    
    move.w d0,d4
    andi.w #$f,d4
    sub.b  d5,d4
    
    or.w d4,(a1)+
    addq #1,d6
    dbra d7,buildcolortableloopblue
    
    ; get the GREEN DIFFERENCE
    move.l a0,a1
    move.w d0,d2
    move.w d1,d3
    moveq #1,d6
    move.l d7,d5
    swap d5
    move.w d5,d7
    
    lsr.w #4,d2
    lsr.w #4,d3
    andi.w #$F,d2
    andi.w #$F,d3
    sub.b d3,d2
    
    lsl.w  #8,d2 ; multiply for dividing later
    move.w d7,d5
    addq #1,d5
    ext.l d2
    divs  d5,d2  ; d2 is 1 / steps x 256

    ; loop start for green
buildcolortableloopgreen:
    move.w d2,d5
    muls  d6,d5
    asr.w #8,d5
    
    move.w d0,d4
    lsr.w #4,d4
    andi.w #$f,d4
    sub.b  d5,d4
    
    lsl.w #4,d4 
    or.w d4,(a1)+
    addq #1,d6
    dbra d7,buildcolortableloopgreen
    
    ; get the RED DIFFERENCE
    move.l a0,a1
    move.w d0,d2
    move.w d1,d3
    moveq #1,d6
    move.l d7,d5
    swap d5
    move.w d5,d7
    
    lsr.w #8,d2
    lsr.w #8,d3
    andi.w #$F,d2
    andi.w #$F,d3
    sub.b d3,d2
    
    lsl.w  #8,d2 ; multiply for dividing later
    move.w d7,d5
    addq #1,d5
    ext.l d2
    divs  d5,d2  ; d2 is 1 / steps x 256

    ; loop start for red
buildcolortableloopred:
    move.w d2,d5
    muls  d6,d5
    asr.w #8,d5
    
    move.w d0,d4
    lsr.w #8,d4
    andi.w #$f,d4
    sub.b  d5,d4
    
    lsl.w #8,d4
    or.w d4,(a1)+

    addq #1,d6
    dbra d7,buildcolortableloopred
    
    rts