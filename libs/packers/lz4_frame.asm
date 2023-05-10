;---------------------------------------------------------
;
;	LZ4 Frame 68k depacker
;	Written by Arnaud Carré ( @leonard_coder )
;	https://github.com/arnaud-carre/lz4-68k
;
;	LZ4 technology by Yann Collet ( https://lz4.github.io/lz4/ )
;	LZ4 frame description: https://github.com/lz4/lz4/blob/master/doc/lz4_Frame_format.md
;
;---------------------------------------------------------

; input: a0.l : LZ4 frame addr ( 16bits aligned )
;		 a1.l : output buffer
; output: none
;
; Depack data produced by LZ4.exe command line:
; 	lz4.exe -9 --no-frame-crc <input_file> <output_file>
;

lz4_frame_depack:
		cmpi.l	#$04224d18,(a0)+	; LZ4 frame MagicNb
		bne.s	lz4_frame_error

		move.b	(a0),d0
		andi.b	#%11001001,d0		; check version, no depacked size, and no DictID
		cmpi.b	#%01000000,d0
		bne.s	lz4_frame_error

		; read 32bits block size without movep (little endian)
		move.b	4(a0),d0
		swap	d0
		move.b	6(a0),d0
		lsl.l	#8,d0
		move.b	5(a0),d0
		swap	d0
		move.b	3(a0),d0
		lea		7(a0),a0			; skip LZ4 block header + packed data size

		bra.s	lz4_depack

lz4_frame_error:
		illegal
		
;---------------------------------------------------------
;
;	LZ4 block 68k small depacker
;	Written by Arnaud Carré ( @leonard_coder )
;	https://github.com/arnaud-carre/lz4-68k
;
;	LZ4 technology by Yann Collet ( https://lz4.github.io/lz4/ )
;
;---------------------------------------------------------

; Smallest version: depacker is only 72 bytes
;
; input: a0.l : packed buffer
;		 a1.l : output buffer
;		 d0.l : LZ4 packed block size (in bytes)
;
; output: none
;

lz4_depack:
			lea		0(a0,d0.l),a4	; packed buffer end
			moveq	#0,d0
			moveq	#0,d2
			moveq	#15,d4

.tokenLoop:	move.b	(a0)+,d0
			move.l	d0,d1
			lsr.b	#4,d1
			beq.s	.lenOffset

			bsr.s	.readLen

.litcopy:	move.b	(a0)+,(a1)+
			subq.l	#1,d1			; block could be > 64KiB
			bne.s	.litcopy

			; end test is always done just after literals
			cmpa.l	a0,a4
			beq.s	.readEnd

			and.b	d4,d0

.lenOffset:	move.b	(a0)+,d2	; read 16bits offset, little endian, unaligned
			move.b	(a0)+,-(a7)
			move.w	(a7)+,d1
			move.b	d2,d1
			movea.l	a1,a3
			sub.l	d1,a3		; d1 bits 31..16 are always 0 here

			move.w	d0,d1

			bsr.s	.readLen

			addq.l	#4,d1
.copy:		move.b	(a3)+,(a1)+
			subq.l	#1,d1
			bne.s	.copy
			bra.s	.tokenLoop

.readLen:	cmp.b	d1,d4
			bne.s	.readEnd
.readLoop:	move.b	(a0)+,d2
			add.l	d2,d1				; final len could be > 64KiB
			not.b	d2
			beq.s	.readLoop
.readEnd:	rts


