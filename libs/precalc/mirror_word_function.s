; MIRROR_WORD_F - Mirrors a word, writes bits in reverse order, useful for mirroring images along Y axys.
; Input:
;	- d0.w : Data to convert
;
; Output:
;   - d1.w: Data converted

; Defines: nothing
;
; Trashes:
;   - d0
;   - d6
;   - d7

MIRROR_WORD_F:
    MIRROR_WORD
    rts