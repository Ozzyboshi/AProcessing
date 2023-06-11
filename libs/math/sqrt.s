; taken from https://loxa.pw/fig/sources/sqrt.s
; SQRT_FIG - Get integer sqrt for integer numbers, radicand = long into d0
; Input: 
;   - d0.l: radicand
; Output:
;   - d1.w: the calculated integer apprximated sqrt
; Trashes:
;   - d2

SQRT_FIG:
    	moveq	#0,d1
		moveq	#31,d2
.blp:	btst	d2,d0
		dbne	d2,.blp
		addq.w	#1,d2
		lsr.w	#1,d2
		lsr.l	d2,d0
		bset	d2,d1
		add.w	d1,d0
		lsr.w	#1,d0
		rts