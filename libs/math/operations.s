ABS_WORD MACRO
    btst #15,\1
    beq.s .\@abs_word_nochange
    neg \1
.\@abs_word_nochange
    ENDM

; SQRT_Q16_0 - Get integer sqrt for integer numbers, range 0-262143, sqrts of radicands > 2^16-1 will be approximated
; Input: 
;   - d0.l: radicand (range range 0-262143)
; Output:
;   - d1.w: the calculated approximated sqrt in integer format
; Trashes:
;   - a0
;   - d0
SQRT_Q16_0 MACRO
    lea SQRT_TABLE_Q16_0,a0
    moveq #0,d1
    cmpi.l #65536,d0
    bcc.s .\@sqrt_16_0_overflow
    move.b (a0,d0.l),d1
    bra.s .\@sqrt_16_0_end

.\@sqrt_16_0_overflow
    lsr.l #2,d0
    move.b (a0,d0.l),d1
    lsl.w #1,d1
.\@sqrt_16_0_end
    ENDM

; BETWEEN_UWORD - Check if a data register unsigned word is between 2 values
; Input: 
;   - first parameter.w: number to check
; Output:
;   - fourth parameter.b: 0 if is in range, any other value if it's not
; Trashes:
;   Nothing
BETWEEN_UWORD MACRO
    cmpi.w \2,\1
    scc \4
    ror.l #1,\4
    cmpi.w \3,\1
    sls \4
    rol.l #1,\4
    not.b \4
    ENDM