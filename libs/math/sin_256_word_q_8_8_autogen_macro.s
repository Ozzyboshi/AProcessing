PROTON_SINUS MACRO
                lea sinus+512(pc),a0
                move.l a0,a3
                lea 1026(a3),a1
                move.l a1,a2
                move.w #255,d0
.gen:           move.w d0,d1 
                move.w d0,d2
                add.w d1,d1 
                mulu d2,d2 
                lsr.w #8,d2 
                sub.w d2,d1 
                move.w d1,-(a3)
                move.w d1,(a0)+
                neg.w d1
                move.w d1,-(a1)
                move.w d1,(a2)+
                dbf d0,.gen
  ENDM

PROTON_COS_BY_SIN MACRO
                MEMCPY4				sinus,sinus+256*4*2,256*2/4
  ENDM