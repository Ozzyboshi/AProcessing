
;; 16-bit fixedpoint sinetable generator
;
; This routine creates 5kb 450 degree sinetable
; (360 degrees + 90 degrees of cosine).
;
; input : A0 - location to store sinus data

make_sinus:     movem.l d0-a6,-(sp)
                move.l a0,a2
                lea 1024(a2),a0
                lea 2048(a2),a3
                lea 4096(a2),a5         ; cosine
                move.l a3,a4            ; q2+q3
                move.l a5,a6            ; q4+q5 (cos)
                moveq #-1,d0            ; cos(0) = 1
                lsr.l #1,d0             ; = $7fffffff
            
                moveq #0,d1             ; sin(0) = 0

                move.l #13176774,d6
                move.w #511,d7
.genlp:         move.l d1,d2
                swap d2
                move.w d2,(a2)+
                move.w d2,-(a3)
                move.w d2,(a6)+
                neg.w d2
                move.w d2,(a4)+
                move.w d2,-(a5)
                move.l d0,a0
                move.l d1,a1
                move.l d1,d4
                move.l d0,d5
                move.l d1,d2
                move.l d0,d3
                move.l d6,d0
                bsr mulu32
                move.l d1,a1
                move.l d0,d3
                move.l a0,d1
                move.l #4294947083,d0
                bsr mulu32
                move.l d0,d2
                move.l d1,a0
                move.l d5,d1
                move.l d6,d0
                bsr mulu32
                move.l d0,a1
                move.l d1,d5
                move.l #4294947083,d0
                move.l d4,d1
                bsr mulu32
                move.l d1,d4
                sub.l d3,d2
                move.l a1,d1
                add.l d0,d1
                move.l d2,d0
                dbf d7,.genlp
                movem.l (sp)+,d0-a6
                rts

;; Multiply 32-bit multiplicand by 32-bit multiplier
;
; in:     d0 = 32-bit multiplier
;         d1 = 32-bit multiplicand
; out: d0:d1 = 64-bit product (d0 = msl)

mulu32:         movem.l d2-d4,-(sp)
                move.l d1,d2    ; d1,d2,d3,d4 = T2
                move.l d1,d3    ; d1,d3 = <T2
                swap d2
                move.l d2,d4    ; d2,d4 = >T2
                mulu.w d0,d1    ; d0 = <T1 , d1 = <T1 * <T2 = AAaa
                mulu.w d0,d2    ; d2 = <T1 * >T2 = BBbb
                swap d0
                mulu.w d0,d3    ; d0 = >T1 , d3 = >T1 * <T2 = CCcc
                mulu.w d4,d0    ; d4 = >T2 , d0 = >T2 * >T1 = DDdd
                swap d1         ; d1 = aaAA
                add.w d2,d1     ; AA+bb
                addx.w d3,d1    ; AA+bb+cc
                swap d1
                clr.w d2
                swap d2
                clr.w d3
                swap d3
                addx.l d2,d0
                addx.l d3,d0
                movem.l (sp)+,d2-d4
                rts

