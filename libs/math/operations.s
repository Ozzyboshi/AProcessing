ABS_WORD MACRO
    btst #15,\1
    beq.s .abs_word_nochange
    neg \1
.abs_word_nochange
    ENDM