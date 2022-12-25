; dec2txt - Re-maps a number from word integer to string.
; Input:
;	- d0.w : Number to convert
;   - a0.l : Address where to store the converted string (must be at least 5 bytes)
;
; Output:
;   Nothing

; Defines: nothing
;
; Trashes:
; - d1
; - a0
; Inspired by http://wiki.amigaspirit.hu/index.php/Amiga_Machine_Language_(Chapter_4)

dec2txt:
    divu    #10000,d1     ; get thounsand number
    move.b d1,(a0)+
    clr.w d1
    swap d1
    divu    #1000,d1     ; get thounsand number
    move.b d1,(a0)+
    clr.w d1
    swap d1
    divu    #100,d1     ; get thounsand number
    move.b d1,(a0)+
    clr.w d1
    swap d1
    divu    #10,d1     ; get thounsand number
    move.b d1,(a0)+
    swap d1
    move.b d1,(a0)
    rts
