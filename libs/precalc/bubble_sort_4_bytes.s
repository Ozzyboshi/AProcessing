; bubble_sort- implementation of bubble sort algo
; Input:
;	- d7.w : how many elements to convert
;   - a0.l : Address of the array to order
;   - a2.l : compare function - must set d5.w to 0 for not swapping, any other value for swapping, input in a5 and a6
;
; Output: nothing
; 
; Defines: nothing
;
; Trashes:
; - d1
; - a0
; Inspired byhttps://gist.github.com/Ozzyboshi/7691cb8cbaeb95c407b29bd08375248a

bubble_sort_4_bytes:
    movem.l d0-d7/a0-a6,-(sp)
    
    ;for (unsigned int step = 0; step < size -1 ; step++)
    moveq   #0,d0
    subq    #2,d7
    
    ; save original element count into d2
    move.w  d7,d2
    
bubble_sort_first_loop:

    ; for (unsigned int i = 0; i < size - step - 1; ++i)
    move.w  d2,d6
    sub.w   d0,d6
    move.l  a0,a5
    move.l  a0,a6
    adda.w  #4,a6
bubble_sort_second_loop:    
    jsr     (a2)
    tst.w   d5
    beq     bubble_sort_do_not_swap
    ; here comes the swap
    move.l (a6),a3
    move.l (a5),(a6)
    move.l a3,(a5)
    
bubble_sort_do_not_swap:
    adda.w  #4,a5
    adda.w  #4,a6

    dbra    d6,bubble_sort_second_loop

    addq    #1,d0
    dbra    d7,bubble_sort_first_loop
    movem.l  (sp)+,d0-d7/a0-a6
    rts
