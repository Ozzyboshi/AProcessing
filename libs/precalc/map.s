; map - Re-maps a number from one range to another.
; Input:
;	- d0.w : Number to remap
;	- d1.w : Range 1 start
;   - d2.w : Range 1 end
;   - d3.w : Range 2 start
;   - d4.w : Range 3 end
;
; Output:
;   d4.w will be used to return new number

; Defines: nothing
;
; Trashes: Nothing


MAP:
    movem.l d0/d2,-(sp)
    ;output = output_start + ((output_end - output_start) / (input_end - input_start)) * (input - input_start)
    sub.w d3,d4 ;d4 = output_end - output_start
    sub.w d1,d2 ;d2 = input_end - input_start
    sub.w d1,d0 ; d0 = (input - input_start)

    muls d0,d4
    divs d2,d4

    add.w d3,d4
 
    movem.l (sp)+,d0/d2
    rts
