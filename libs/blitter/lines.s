VERTEX_LIST_2D:
VERTEX_LIST_2D_1:   dcb.b 4,0
VERTEX_LIST_2D_2:   dcb.b 4,0
VERTEX_LIST_2D_3:   dcb.b 4,0
VERTEX_LIST_2D_4:   dcb.b 4,0

VERTEX2D_INIT MACRO
    move.w \2,VERTEX_LIST_2D_\1
    move.w \3,VERTEX_LIST_2D_\1+2
    ENDM

BLITTRIANGLE MACRO
  move.w VERTEX_LIST_2D_1,d0 ; x1
  move.w VERTEX_LIST_2D_1+2,d1 ; y1
  move.w VERTEX_LIST_2D_2,d2                                                      ; x2
  move.w VERTEX_LIST_2D_2+2,d3                                                      ; y2
  
 ; START COMPARISON

  ; d6 will hold the mins (format YYXX)
    ; d7 will hold the maxs (format YYXX)
    
    ; assume first point is min and max
    
    ; y
    move.w d1,d6
    move.w d1,d7
    
    ; x
    swap d6
    swap d7
    move.w d0,d6
    move.w d0,d7
    
    ; update xmin
    cmp.w d2,d6
    bls.s .xgreaterequaltthan
    move.w d2,d6
    bra.s .blittrigxdone
.xgreaterequaltthan:
    ; update xmax
    bcc.s .blittrigxdone
    move.w d2,d7
.blittrigxdone:
    ; start comparing y
    swap d6
    swap d7
     ; update ymin
    cmp.w d3,d6
    bls.s .ygreaterequaltthan
    move.w d3,d6
    bra.s .blittrigxdone2
.ygreaterequaltthan:
    ; update xmax
    bcc.s .blittrigxdone2
    move.w d3,d7
.blittrigxdone2
    swap d6
    swap d7
  ; END COMPARISON
  lea                   \1,a0
  bsr.w                 DrawlineFill ; first line
  
  ; start of second line
  move.w                VERTEX_LIST_2D_1,d0                                                     ; x1
  move.w                VERTEX_LIST_2D_1+2,d1                                                      ; y1
  move.w                VERTEX_LIST_2D_3,d2                                                     ; x2
  move.w                VERTEX_LIST_2D_3+2,d3                                                      ; y2
  
; START COMPARISON
; update xmin
    cmp.w d2,d6
    bls.s .xgreaterequaltthan2
    move.w d2,d6
    bra.s .xblittrigdone
.xgreaterequaltthan2:
    ; update xmax
    bcc.s .xblittrigdone
    move.w d2,d7
.xblittrigdone:
    ; start comparing y
    swap d6
    swap d7
     ; update ymin
    cmp.w d3,d6
    bls.s .ygreaterequaltthan2
    move.w d3,d6
    bra.s .xblittrigdone2
.ygreaterequaltthan2:
    ; update xmax
    bcc.s .xblittrigdone2
    move.w d3,d7
.xblittrigdone2
    swap d6
    swap d7
; END COMPARISON
  
  lea                   \1,a0
  bsr.w                 DrawlineFill ; second line

  ; start of third line

  move.w                VERTEX_LIST_2D_2,d0                                                      ; x1
  move.w                VERTEX_LIST_2D_2+2,d1                                                      ; y1
  move.w                VERTEX_LIST_2D_3,d2                                                     ; x2
  move.w                VERTEX_LIST_2D_3+2,d3                                                      ; y2
  lea                   \1,a0
  bsr.w                 DrawlineFill ; third line

  move.w                #0,d0                                                      ; inclusivo
  move.w                #0,d1                                                      ; CARRYIN = 0

  ; top left point into d3 and d4
  move.w                d6,d3
  move.l                d6,d4
  swap d4

    ; bottom right pointo into d5 and d6
  move.w                d7,d5
  move.l                d7,d6
  swap d6

  ; source is SCREEN_0
  lea                   \1,a0
  ; destination is SCREEN_1
  lea                   \2,a1

  ;we need a5
  lea                   $dff000,a5

  ;move.w d3,SCREEN_0
  ;move.w d4,2+SCREEN_0
  ;move.w d5,4+SCREEN_0
  ;move.w d6,6+SCREEN_0
  jsr                   Fill_From_A_to_B

  lea                   $dff000,a5
  jsr                   InitLine                                                   ; inizializza line-mode

  move.w                #$ffff,d0                                                  ; linea continua
  jsr                   SetPattern  

  lea                   \2,a0
   move.w                VERTEX_LIST_2D_1,d0                                                     ; x1
  move.w                VERTEX_LIST_2D_1+2,d1       
  move.w                VERTEX_LIST_2D_2,d2                                                    ; x1
  move.w                VERTEX_LIST_2D_2+2,d3
  jsr DrawlineOr

  lea                   \2,a0
   move.w                VERTEX_LIST_2D_1,d0                                                     ; x1
  move.w                VERTEX_LIST_2D_1+2,d1       
  move.w                VERTEX_LIST_2D_3,d2                                                     ; x1
  move.w                VERTEX_LIST_2D_3+2,d3
  jsr DrawlineOr

  lea                   \2,a0
  move.w                VERTEX_LIST_2D_2,d0                                                     ; x1
  move.w                VERTEX_LIST_2D_2+2,d1       
  move.w                VERTEX_LIST_2D_3,d2                                                     ; x1
  move.w                VERTEX_LIST_2D_3+2,d3
  jsr DrawlineOr

  jsr                   Fill_From_A_to_B_Clear

  ENDM

;******************************************************************************
; Questa routine setta i registri del blitter che non devono essere
; cambiati tra una line e l'altra
;******************************************************************************

InitLine:
          WAITBLITTER

          moveq.l        #-1,d5
          move.l         d5,$44(a5)              ; BLTAFWM/BLTALWM = $FFFF
          move.w         #$8000,$74(a5)          ; BLTADAT = $8000
          move.w         #40,$60(a5)             ; BLTCMOD = 40
          move.w         #40,$66(a5)             ; BLTDMOD = 40
          rts









;******************************************************************************
; Questa routine effettua il disegno della linea. prende come parametri gli
; estremi della linea P1 e P2, e l'indirizzo del bitplane su cui disegnarla.
; D0 - X1 (coord. X di P1)
; D1 - Y1 (coord. Y di P1)
; D2 - X2 (coord. X di P2)
; D3 - Y2 (coord. Y di P2)
; A0 - indirizzo bitplane
;******************************************************************************

;           ("`-/")_.-'"``-._
;            . . `; -._    )-;-,_`)
;       FL  (v_,)'  _  )`-.\  ``-'
;          _.- _..-_/ / ((.'
;        ((,.-'   ((,/

Drawline:

* scelta ottante

          sub.w          d0,d2                   ; D2=X2-X1
          bmi.s          DRAW4                   ; se negativo salta, altrimenti D2=DiffX
          sub.w          d1,d3                   ; D3=Y2-Y1
          bmi.s          DRAW2                   ; se negativo salta, altrimenti D3=DiffY
          cmp.w          d3,d2                   ; confronta DiffX e DiffY
          bmi.s          DRAW1                   ; se D2<D3 salta..
                                ; .. altrimenti D3=DY e D2=DX
          moveq          #$10,d5                 ; codice ottante
          bra.s          DRAWL
DRAW1:
          exg.l          d2,d3                   ; scambia D2 e D3, in modo che D3=DY e D2=DX
          moveq          #0,d5                   ; codice ottante
          bra.s          DRAWL
DRAW2:
          neg.w          d3                      ; rende D3 positivo
          cmp.w          d3,d2                   ; confronta DiffX e DiffY
          bmi.s          DRAW3                   ; se D2<D3 salta..
                                ; .. altrimenti D3=DY e D2=DX
          moveq          #$18,d5                 ; codice ottante
          bra.s          DRAWL
DRAW3:
          exg.l          d2,d3                   ; scambia D2 e D3, in modo che D3=DY e D2=DX
          moveq          #$04,d5                 ; codice ottante
          bra.s          DRAWL
DRAW4:
          neg.w          d2                      ; rende D2 positivo
          sub.w          d1,d3                   ; D3=Y2-Y1
          bmi.s          DRAW6                   ; se negativo salta, altrimenti D3=DiffY
          cmp.w          d3,d2                   ; confronta DiffX e DiffY
          bmi.s          DRAW5                   ; se D2<D3 salta..
                                ; .. altrimenti D3=DY e D2=DX
          moveq          #$14,d5                 ; codice ottante
          bra.s          DRAWL
DRAW5:
          exg.l          d2,d3                   ; scambia D2 e D3, in modo che D3=DY e D2=DX
          moveq          #$08,d5                 ; codice ottante
          bra.s          DRAWL
DRAW6:
          neg.w          d3                      ; rende D3 positivo
          cmp.w          d3,d2                   ; confronta DiffX e DiffY
          bmi.s          DRAW7                   ; se D2<D3 salta..
                                ; .. altrimenti D3=DY e D2=DX
          moveq          #$1c,d5                 ; codice ottante
          bra.s          DRAWL
DRAW7:
          exg.l          d2,d3                   ; scambia D2 e D3, in modo che D3=DY e D2=DX
          moveq          #$0c,d5                 ; codice ottante

; Quando l'esecuzione raggiunge questo punto, abbiamo:
; D2 = DX
; D3 = DY
; D5 = codice ottante

DRAWL:
          mulu.w         #40,d1                  ; offset Y
          add.l          d1,a0                   ; aggiunge l'offset Y all'indirizzo

          move.w         d0,d1                   ; copia la coordinata X
          and.w          #$000F,d0               ; seleziona i 4 bit piu` bassi della X..
          ror.w          #4,d0                   ; .. e li sposta nei bit da 12 a 15
          or.w           #$0B4A,d0               ; con un OR ottengo il valore da scrivere
                                ; in BLTCON0. Con questo valore di LF ($4A)
                                ; si disegnano linee in EOR con lo sfondo.

          lsr.w          #4,d1                   ; cancella i 4 bit bassi della X
          add.w          d1,d1                   ; ottiene l'offset X in bytes
          add.w          d1,a0                   ; aggiunge l'offset X all'indirizzo

          move.w         d2,d1                   ; copia DX in D1
          addq.w         #1,d1                   ; D1=DX+1
          lsl.w          #$06,d1                 ; calcola in D1 il valore da mettere in BLTSIZE
          addq.w         #$0002,d1               ; aggiunge la larghezza, pari a 2 words

          lsl.w          #$02,d3                 ; D3=4*DY
          add.w          d2,d2                   ; D2=2*DX

          btst           #6,2(a5)
WaitLine:
          btst           #6,2(a5)                ; aspetta blitter fermo
          bne            WaitLine

          move.w         d3,$62(a5)              ; BLTBMOD=4*DY
          sub.w          d2,d3                   ; D3=4*DY-2*DX
          move.w         d3,$52(a5)              ; BLTAPTL=4*DY-2*DX

                                ; prepara valore da scrivere in BLTCON1
          or.w           #$0001,d5               ; setta bit 0 (attiva line-mode)
          tst.w          d3
          bpl.s          OK1                     ; se 4*DY-2*DX>0 salta..
          or.w           #$0040,d5               ; altrimenti setta il bit SIGN
OK1:
          move.w         d0,$40(a5)              ; BLTCON0
          move.w         d5,$42(a5)              ; BLTCON1
          sub.w          d2,d3                   ; D3=4*DY-4*DX
          move.w         d3,$64(a5)              ; BLTAMOD=4*DY-4*DX
          move.l         a0,$48(a5)              ; BLTCPT - indirizzo schermo
          move.l         a0,$54(a5)              ; BLTDPT - indirizzo schermo
          move.w         d1,$58(a5)              ; BLTSIZE                                             ; BLTSIZE
  ;lea SCREEN_0,A4
  ;move.l $dff048,(a4)+
  ;move.l #SCREEN_0,(a4)+
  ;move.w $dff058,(a4)+
          rts

;******************************************************************************
; Questa routine definisce il pattern che deve essere usato per disegnare
; le linee. In pratica si limita a settare il registro BLTBDAT.
; D0 - contiene il pattern della linea 
;******************************************************************************

SetPattern:
          WAITBLITTER

          move.w         d0,$72(a5)              ; BLTBDAT = pattern della linea!
          rts










*******************************************************************************
*									      *
*			'DrawLine V1.01' By TIP/SPREADPOINT		      *
*			­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­		      *
*									      *
*******************************************************************************

DL_Width    = 40
DL_Fill     = 0                                  ; 0=NOFILL / 1=FILL
          IFEQ           DL_Fill
DL_MInterns = $CA
          ELSE
DL_MInterns = $4A
          ENDC

;­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­
;	A0 = PlanePtr, A6 = $DFF002, D0/D1 = X0/Y0, D2/D3 = X1/Y1
;	D4 = PlaneWidth > Kills: D0-D4/A0-A1 (+D5 in Fill Mode)

DrawLine2:  
          cmp.w          d1,d3                   ; Drawing only from Top to Bottom is
          bge.s          .y1ly2                  ; necessary for:
          exg            d0,d2                   ; 1) Up-down Differences (same coords)
          exg            d1,d3                   ; 2) Blitter Invert Bit (only at top of
					;    line)
.y1ly2:   sub.w          d1,d3                   ; D3 = yd

; Here we could do an Optimization with Special Shifts
; depending on the DL_Width value... I know it, but please, let it be.

          mulu           d4,d1                   ; Use muls for neg Y-Vals
          add.l          d1,a0                   ; Please don't use add.w here !!!
          moveq          #0,d1                   ; D1 = Quant-Counter
          sub.w          d0,d2                   ; D2 = xd
          bge.s          .xdpos
          addq.w         #2,d1                   ; Set Bit 1 of Quant-Counter (here it
					; could be a moveq)
          neg.w          d2
.xdpos:   moveq          #$f,d4                  ; D4 full cleaned (for later oktants
					; move.b)
          and.w          d0,d4
          IFNE           DL_Fill
          move.b         d4,d5                   ; D5 = Special Fill Bit
          not.b          d5
          ENDC
          lsr.w          #3,d0                   ; Yeah, on byte (necessary for bchg)...
          add.w          d0,a0                   ; ...Blitter ands automagically
          ror.w          #4,d4                   ; D4 = Shift
          or.w           #$B00+DL_MInterns,d4    ; BLTCON0-codes
          swap           d4
          cmp.w          d2,d3                   ; Which Delta is the Biggest ?
          bge.s          .dygdx
          addq.w         #1,d1                   ; Set Bit 0 of Quant-Counter
          exg            d2,d3                   ; Exchange xd with yd
.dygdx:   add.w          d2,d2                   ; D2 = xd*2
          move.w         d2,d0                   ; D0 = Save for $52(a6)
          sub.w          d3,d0                   ; D0 = xd*2-yd
          addx.w         d1,d1                   ; Bit0 = Sign-Bit
          move.b         Oktants(PC,d1.w),d4     ; In Low Byte of d4
						; (upper byte cleaned above)
          swap           d2
          move.w         d0,d2
          sub.w          d3,d2                   ; D2 = 2*(xd-yd)
          moveq          #6,d1                   ; D1 = ShiftVal (not necessary) 
					; + TestVal for the Blitter
          lsl.w          d1,d3                   ; D3 = BLTSIZE
          add.w          #$42,d3
          lea            $52-2(a6),a1            ; A1 = CUSTOM+$52

; WARNING : If you use FastMem and an extreme DMA-Access (e.g. 6
; Planes and Copper), you should Insert a tst.b (a6) here (for the
; shitty AGNUS-BUG)

.wb:      btst           d1,(a6)                 ; Waiting for the Blitter...
          bne.s          .wb
          IFNE           DL_Fill
          bchg           d5,(a0)                 ; Inverting the First Bit of Line
          ENDC
;-------------- Not necessary, only for testing purposes ! (Cf Init Part...)
;		move.w	#$8000,$74-2(a6)
;		move.w	#-1,$44-2(a6)
;		move.w	#-1,$72-2(a6)
;		move.w	#DL_Width,$60-2(a6)
;		move.w	#DL_Width,$66-2(a6)
;--------------
          move.l         d4,$40-2(a6)            ; Writing to the Blitter Regs as fast
          move.l         d2,$62-2(a6)            ; as possible
          move.l         a0,$48-2(a6)
          move.w         d0,(a1)+
          move.l         a0,(a1)+                ; Shit-Word Buffer Ptr...
          move.w         d3,(a1)
          rts
;­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­
          IFNE           DL_Fill
SML         = 2
          ELSE
SML         = 0
          ENDC

Oktants:  dc.b           SML+1,SML+1+$40
          dc.b           SML+17,SML+17+$40
          dc.b           SML+9,SML+9+$40
          dc.b           SML+21,SML+21+$40
;­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­
;		Optimized Init Part... A6 = $DFF000 > Kills : D0-D2

DL_Init:  addq.w         #2,a6                   ; A6 = $DFF002 for DrawLine !
          moveq          #-1,d1
          IFGT           DL_Width-127
          move.w         #DL_Width,d0
          ELSE
          moveq          #DL_Width,d0
          ENDC
          moveq          #6,d2
.wb:      btst           d2,(a6)
          bne.s          .wb
          move.w         d1,$44-2(a6)
          move.w         d1,$72-2(a6)
          move.w         #$8000,$74-2(a6)
          move.w         d0,$60-2(a6)
          move.w         d0,$66-2(a6)
          rts

DL_Exit:  subq.w         #2,a6                   ; A6 = $DFF000
          rts


; van oosterkamp implementation
; D0 - X1 (coord. X di P1)
; D1 - Y1 (coord. Y di P1)
; D2 - X2 (coord. X di P2)
; D3 - Y2 (coord. Y di P2)
DrawLine3:
          sub.w          d0,d2
          bmi.b          .Oct2345
          sub.w          d1,d3
          bmi.b          .Oct01
          cmp.w          d3,d2
          bmi.b          .Oct6
          moveq          #$0011,d4
          bra.b          .DoneOctant

.Oct6
          exg            d2,d3
          moveq          #$0001,d4
          bra.b          .DoneOctant

.Oct2345:
          neg.w          d2
          sub.w          d1,d3
          bmi.s          .Oct23
          cmp            d3,d2
          bmi.s          .Oct5
          moveq          #$0015,d4
          bra.b          .DoneOctant

.Oct5:
          exg            d2,d3
          moveq          #$0009,d4
          bra.b          .DoneOctant

.Oct23:
          neg.w          d3
          cmp.w          d3,D2
          bmi.s          .Oct2
          moveq          #$001D,d4
          bra.b          .DoneOctant

.Oct2:
          exg            d2,d3
          moveq          #$000D,d4
          bra.b          .DoneOctant

.Oct01:
          neg.w          d3
          cmp.w          d3,d2
          bmi.s          .Oct1
          moveq          #$0019,d4
          bra.b          .DoneOctant

.Oct1:
          exg            d2,d3
          moveq          #$0005,d4

; at this point:
; D2 = Dmax
; D3 = Dmin
; D4 = bit combination for the octant and LINE bit (to be copied on BLTCON1)
; D0 and D1 still contains coordinates of line

; now Calculate 2 X Dmax and 4 X Dmin
.DoneOctant:
          add.w          d2,d2
          asl.w          #2,d3

; Calculate blitter pointers
          lea            SCREEN_0,a0             ; aptr bitplane to write on
          mulu           #40,d1                  ; this can be optimized with a lookup table - convert Y1 position into an offset
          add.l          d1,a0                   ; add offset to bitplane pointer
          ext.l          d0                      ; clear top bits of d0
          ror.l          #4,d0                   ; rol shift bits to top word
          add.w          d0,d0                   ; bottom word convert to byte offset
          adda.w         d0,a0                   ; add byte offset to bitplane pointer
          swap           d0                      ; move shift value to bottom word
          or.w           #$0B5A,d0               ; useA, C and D, Minterm $5A, D=A/C+/AC

          move.w         d2,d1
          lsl.w          #5,d1
          add.w          #$0042,d1

; start writing into blitter registers
          btst.b         #14-8,$DFF002
.BlitBusy:
          btst.b         #14-8,$DFF002
          bne.b          .BlitBusy

          move.w         #$FFFF,$DFF044          ; no masking
          move.w         #$FFFF,$DFF046          ; no masking
          move.w         #40,$DFF060             ; blt is 40 bytes wide
          move.w         #40,$DFF066             ; blt is 40 bytes wide
          move.l         a0,$DFF048
          move.l         a0,$DFF054
          move.w         d0,$DFF040
          move.w         d3,$DFF062
          move.w         #$8000,$DFF074


          sub.w          d2,d3
          ext.l          d3
          move.l         d3,$DFF052
          bpl.b          .NotNeg
          or.w           #$0040,d4
.NotNeg:
          move.w         d4,$DFF042

; size calculation
          sub.w          d2,d3
          move.w         d3,$DFF064
          move.w         d1,$DFF058

          rts




;******************************************************************************
; Questa routine effettua il disegno di una linea, usando la speciale modalita`
; che consente di effettuare correttamente il fill. Inoltre la linea e`
; disegnata dall'alto verso il basso e il primo bit viene lasciato immutato.
; Prende come parametri gli estremi della linea P1 e P2, e l'indirizzo del
; bitplane su cui disegnarla.
; D0 - X1 (coord. X di P1)
; D1 - Y1 (coord. Y di P1)
; D2 - X2 (coord. X di P2)
; D3 - Y2 (coord. Y di P2)
; A0 - indirizzo bitplane
;******************************************************************************

;	   ("`-/")_.-'"``-._
;	    . . `; -._    )-;-,_`)
;	   (v_,)'  _  )`-.\  ``-'
;	  _.- _..-_/ / ((.'
;	((,.-'   ((,/

DrawlineFill:
          cmp.w          d1,d3                   ; se D3>D1 i punti sono gia` nell'ordine giusto
          bge.w          Ordinati
          exg.l          d1,d3                   ; altrimenti scambiali
          exg.l          d0,d2

Ordinati:
          sub.w          d1,d3                   ; D3=DiffY  (e` sicuramente positivo)

* scelta ottante

          sub.w          d0,d2                   ; D2=X2-X1
          bmi.s          DRAW4_FILL              ; se negativo salta, altrimenti D2=DiffX
          cmp.w          d3,d2                   ; confronta DiffX e DiffY
          bmi.s          DRAW1_FILL              ; se D2<D3 salta..
				; .. altrimenti D3=DY e D2=DX
          moveq          #$10,d5                 ; codice ottante
          bra.s          DRAWL_FILL
DRAW1_FILL:
          exg.l          d2,d3                   ; scambia D2 e D3, in modo che D3=DY e D2=DX
          moveq          #$00,d5                 ; codice ottante
          bra.s          DRAWL_FILL
DRAW4_FILL:
          neg.w          d2                      ; rende D2 positivo
          cmp.w          d3,d2                   ; confronta DiffX e DiffY
          bmi.s          DRAW5_FILL              ; se D2<D3 salta..
				; .. altrimenti D3=DY e D2=DX
          moveq          #$14,d5                 ; codice ottante
          bra.s          DRAWL_FILL
DRAW5_FILL:
          exg.l          d2,d3                   ; scambia D2 e D3, in modo che D3=DY e D2=DX
          moveq          #$08,d5                 ; codice ottante
          bra.w          DRAWL_FILL

; Quando l'esecuzione raggiunge questo punto, abbiamo:
; D2 = DX
; D3 = DY
; D5 = codice ottante

DRAWL_FILL:
          mulu.w         #40,d1                  ; offset Y
          add.l          d1,a0                   ; aggiunge l'offset Y all'indirizzo

          move.w         d0,d1                   ; copia la coordinata X
          lsr.w          #4,d1                   ; cancella i 4 bit bassi della X
          add.w          d1,d1                   ; ottiene l'offset X in bytes
          add.w          d1,a0                   ; aggiunge l'offset X all'indirizzo

          and.w          #$000F,d0               ; seleziona i 4 bit piu` bassi della X..
          move.w         d0,d1                   ; .. li copia in D1..
          ror.w          #4,d0                   ; .. e li sposta nei bit da 12 a 15
          or.w           #$0B4A,d0               ; con un OR ottengo il valore da scrivere
				; in BLTCON0. Con questo valore di LF ($4A)
				; si disegnano linee in EOR con lo sfondo.

          move.l         a0,a1                   ; copia l'indirizzo
          cmp.w          #7,d1                   ; il numero del bit e` > 7 ?
          ble.s          NonCorreggi             ; se no salta

          addq.w         #1,a1                   ; ..altrimenti punta al prossimo byte
          subq.w         #8,d1                   ; e rendi il numero del bit < 7
NonCorreggi:
          not.b          d1                      ; inverti la numerazione dei bit
				; questa istruzione e` necessaria perche`
				; all'interno del byte i bit sono numerati 
				; da destra a sinistra, mentre le coordinate
				; dei pixel vanno da sinistra a destra
          bchg           d1,(a1)                 ; inverti il primo pixel della linea

          move.w         d2,d1                   ; copia DX in D1
          addq.w         #1,d1                   ; D1=DX+1
          lsl.w          #$06,d1                 ; calcola in D1 il valore da mettere in BLTSIZE
          addq.w         #2,d1                   ; aggiunge la larghezza, pari a 2 words

          lsl.w          #$02,d3                 ; D3=4*DY
          add.w          d2,d2                   ; D2=2*DX

          WAITBLITTER

          move.w         d3,$62(a5)              ; BLTBMOD=4*DY
          sub.w          d2,d3                   ; D3=4*DY-2*DX
          move.w         d3,$52(a5)              ; BLTAPTL=4*DY-2*DX

				; prepara valore da scrivere in BLTCON1
          or.w           #$0003,d5               ; setta bit 0 (attiva line-mode), e
				; il bit 1 (linee speciali per fill)

          tst.w          d3
          bpl.s          OK1_FILL                ; se 4*DY-2*DX>0 salta..
          or.w           #$0040,d5               ; altrimenti setta il bit SIGN
OK1_FILL:
          move.w         d0,$40(a5)              ; BLTCON0
          move.w         d5,$42(a5)              ; BLTCON1
          sub.w          d2,d3                   ; D3=4*DY-4*DX
          move.w         d3,$64(a5)              ; BLTAMOD=4*DY-4*DX
          move.l         a0,$48(a5)              ; BLTCPT - indirizzo schermo
          move.l         a0,$54(a5)              ; BLTDPT - indirizzo schermo
          move.w         d1,$58(a5)              ; BLTSIZE
          rts
	
  ;****************************************************************************
; Questa routine copia un rettangolo di schermo da una posizione fissa
; ad un indirizzo specificato come parametro. Il rettangolo di schermo che
; viene copiato racchiude interamente le 2 linee.
; Durante la copia viene effettuato anche il riempmento. Il tipo di riempimento
; e` specificato tramite i parametri.
; I parametri sono:
; A0 - indirizzo destinazione
; D0 - se vale 0 allora effettua fill inclusivo, altrimenti fa fill esclusivo
; D1 - se vale 0 allora effettua FILL_CARRYIN=0, altrimenti FILL_CARRYIN=1
;****************************************************************************

Fill_From_A_to_B:
  WAITBLITTER


  move.w                #$09f0,$40(a5)                                             ; BLTCON0 copia normale

  tst.w                 d0                                                         ; testa D0 per decidere il tipo di fill
  bne.s                 Fill_From_A_to_B_fill_esclusivo
  move.w                #$000a,d2                                                  ; valore di BLTCON1: settati i bit del
					; fill inclusivo e del modo discendente
  bra.s                 Fill_From_A_to_B_test_fill_carry

Fill_From_A_to_B_fill_esclusivo:
  move.w                #$0012,d2                                                  ; valore di BLTCON1: settati i bit del
					; fill esclusivo e del modo discendente

Fill_From_A_to_B_test_fill_carry:
  tst.w                 d1                                                         ; testa D1 per vedere se deve settare
					; il bit FILL_CARRYIN

  beq.s                 Fill_From_A_to_B_fatto_bltcon1                                              ; se D1=0 salta..
  bset                  #2,d2                                                      ; altrimenti setta il bit 2 di D2

Fill_From_A_to_B_fatto_bltcon1:
  move.w                d2,$42(a5)                                                 ; BLTCON1


  ; start experimeng
      swap     d6
    lsr.w #4,d3 ; calculate start word for left
    lsr.w #4,d5 ; calculate start word for right
    
    ; at this point d5 must be >= 0, if not something wrong happened before
    ; now i need the difference +1
    move.w d5,d7
    addq #1,d7
    ; now d7 contains the number of words we need to blit for each line
    
    ; since bplmod work on bytes we have to calculate 2*d7 an put into registers
    move.w d7,d6
    add.w d6,d6
    sub.w #40,d6
    neg d6
    
    move.w d6,FILL_ADDR_DMOD
    move.w                d6,$64(a5)                                                 ; BLTAMOD larghezza 2 words (40-4=36)
    move.w                d6,$66(a5)                                                 ; BLTAMOD larghezza 2 words (40-4=36)
    
    
    swap     d6
    sub.w                 d4,d6
    move.w d6,d4 ; save the Y difference into d4
    muls.w                #40,d6
    move.l a0,a3
    adda.w d6,a3
    add.w d5,d5
    adda.w d5,a3
    move.l                a3,FILL_ADDR_CACHE
    move.l                a3,$50(a5)
    
    move.l a1,a3
    adda.w d6,a3
    adda.w d5,a3
    move.l                a3,$54(a5)
    
    ;start bltsize calc
    moveq.l #0,d6
    move.w d4,d6
    lsl.l #6,d6
    or.w                  d7,d6
    move.w                d6,$58(a5)
    move.w                d6,FILL_ADDR_SIZE
    rts
  ;end experiment



   ; calculate mod based on width
    sub.w                 d3,d5
    move.w                d5,d7                                                     ; d7 here contains the horizontal lenght
    asr.w                 #4,d7

    andi.b                #$0F,d5
    beq.s                 .Fill_From_A_to_B_notadd1
    addq                  #1,d7
.Fill_From_A_to_B_notadd1
    move.w                d7,d5                                                      ; save how many words is the width of the figure for later blitsize
    add.w d7,d7                                                                      ; d7 will go into bplmod and must be expressed in bytes
    move.w                d7,d3                                                      ; here d7 contains how many bytes is the width of the figure, save it to d3 for pointer calculation
    subq.w                  #2,d3                                                      ; d3 now contains how many bytes is the width of the figure -2 (previous word)
    neg.w                 d7
    add.w                 #40,d7                                                     ; d7 contains the modulo for a 40 byte width screen


  move.w                d7,$64(a5)                                                 ; BLTAMOD larghezza 2 words (40-4=36)
  move.w                d7,$66(a5)                                                 ; BLTDMOD (40-4=36)
  move.w d7,FILL_ADDR_DMOD
  ;move.w	#36,$64(a5)		; BLTAMOD larghezza 2 words (40-4=36)
	;move.w	#36,$66(a5)		; BLTDMOD (40-4=36)

  sub.w                 d4,d6
  move.w d6,d4 ; save the Y difference into d4
  muls.w                #40,d6
  move.l a0,a3
  adda.w                 d6,a3
  adda.w                 d3,a3
  move.l                a3,$50(a5)
  move.l                a3,FILL_ADDR_CACHE
  ;move.l	#SCREEN_0+255*40+40-2,$50(a5)
					; BLTAPT (fisso al rettangolo sorgente)
					; il rettangolo sorgente racchiude
					; interamente le 2 linee.
					; puntiamo l'ultima word del rettangolo
					; per via del modo discendente

  move.l a1,a3
  adda.w                 d6,a3
  adda.w                 d3,a3

  move.l                a3,$54(a5)
  ;move.l		#SCREEN_1+255*40+4-2,$54(a5)		; BLTDPT  carica il parametro
  ;move.w                #(64*6),d7
  moveq #0,d7
  move.w d4,d7
  lsl.l #6,d7
  or.w                  d5,d7
  
  move.w                d7,$58(a5)
  move.w                d7,FILL_ADDR_SIZE
  
  
  ; move.l #SCREEN_0,SCREEN_0
  ;move.l a0,SCREEN_0+4
  ;move.w FILL_ADDR_DMOD,SCREEN_0+8
  
  ;move.w	#(64*6)+2,$58(a5)	; BLTSIZE (via al blitter !)
					; larghezza 2 words
					; altezza 6 righe (1 plane)
  rts



;In questo esempio vediamo come risolvere il problema delle linee chiuse.
;Come abbiamo spiegato nella lezione, modifichiamo la routine di tracciamento
;linee in modo che essa disegni dall'alto in basso. Per questo all'inizio
;vengono confrontate le coordinate Y dei 2 punti, e se necessario i 2 punti
;vengono scambiati. In questo modo tra l'altro si semplifica il calcolo
;dell'ottante in quanto siamo limitati a 4 sole possibilita`.
;Inoltre il primo punto della linea viene invertito mediante una BCHG in
;modo da annullare l'effetto del tracciamento. Per questo scopo sono necessari
;un po' di calcoli in piu` al fine di determinare il numero del bit e il
;giusto indirizzo. Infatti, a differenza del blitter, la BCHG opera un byte
;alla volta, quindi se necessario bisogna puntare il byte basso della word
;puntata dall'indirizzo. Inoltre bisogna anche invertire (con la NOT) la
;numerazione dei bit perche` la BCHG numera i bit da destra a sinistra e
;invece le coordinate sono numerate da sinistra a destra.
;Le altre routines sono identiche.



FILL_ADDR_CACHE:
  dc.l                  0
FILL_ADDR_SIZE:
  dc.w                  0
FILL_ADDR_DMOD:
  dc.w                  0
Fill_From_A_to_B_Clear:
  WAITBLITTER
  move.w                #$0100,$dff040
  move.w                #$0002,$dff042
  move.w FILL_ADDR_DMOD,$DFF066    
  move.l                FILL_ADDR_CACHE,$dff054
  move.w                FILL_ADDR_SIZE,$dff058
  ;move.w FILL_ADDR_DMOD,SCREEN_0
  ;move.w FILL_ADDR_SIZE,SCREEN_0+2
  ;move.l #SCREEN_0,SCREEN_0+4
  ;move.l FILL_ADDR_CACHE,SCREEN_0+8
  rts



DrawlineOr:
        ;move.l  mt_data,A0

        ;move.l 4(sp),a0
        ;move.l 8(sp),d0
        ;move.l 12(sp),d1
        
        ;move.l 16(sp),d2
        ;move.l 20(sp),d3

* scelta ottante

        sub.w   d0,d2           ; D2=X2-X1
        bmi.s   DRAW4OR           ; se negativo salta, altrimenti D2=DiffX
        sub.w   d1,d3           ; D3=Y2-Y1
        bmi.s   DRAW2OR           ; se negativo salta, altrimenti D3=DiffY
        cmp.w   d3,d2           ; confronta DiffX e DiffY
        bmi.s   DRAW1OR           ; se D2<D3 salta..
                                ; .. altrimenti D3=DY e D2=DX
        moveq   #$10,d5         ; codice ottante
        bra.s   DRAWLOR
DRAW1OR:
        exg.l   d2,d3           ; scambia D2 e D3, in modo che D3=DY e D2=DX
        moveq   #0,d5           ; codice ottante
        bra.s   DRAWLOR
DRAW2OR:
        neg.w   d3              ; rende D3 positivo
        cmp.w   d3,d2           ; confronta DiffX e DiffY
        bmi.s   DRAW3OR           ; se D2<D3 salta..
                                ; .. altrimenti D3=DY e D2=DX
        moveq   #$18,d5         ; codice ottante
        bra.s   DRAWLOR
DRAW3OR:
        exg.l   d2,d3           ; scambia D2 e D3, in modo che D3=DY e D2=DX
        moveq   #$04,d5         ; codice ottante
        bra.s   DRAWLOR
DRAW4OR:
        neg.w   d2              ; rende D2 positivo
        sub.w   d1,d3           ; D3=Y2-Y1
        bmi.s   DRAW6OR           ; se negativo salta, altrimenti D3=DiffY
        cmp.w   d3,d2           ; confronta DiffX e DiffY
        bmi.s   DRAW5OR           ; se D2<D3 salta..
                                ; .. altrimenti D3=DY e D2=DX
        moveq   #$14,d5         ; codice ottante
        bra.s   DRAWLOR
DRAW5OR:
        exg.l   d2,d3           ; scambia D2 e D3, in modo che D3=DY e D2=DX
        moveq   #$08,d5         ; codice ottante
        bra.s   DRAWLOR
DRAW6OR:
        neg.w   d3              ; rende D3 positivo
        cmp.w   d3,d2           ; confronta DiffX e DiffY
        bmi.s   DRAW7OR           ; se D2<D3 salta..
                                ; .. altrimenti D3=DY e D2=DX
        moveq   #$1c,d5         ; codice ottante
        bra.s   DRAWLOR
DRAW7OR:
        exg.l   d2,d3           ; scambia D2 e D3, in modo che D3=DY e D2=DX
        moveq   #$0c,d5         ; codice ottante

; Quando l'esecuzione raggiunge questo punto, abbiamo:
; D2 = DX
; D3 = DY
; D5 = codice ottante

DRAWLOR:
        mulu.w  #40,d1          ; offset Y
        add.l   d1,a0           ; aggiunge l'offset Y all'indirizzo

        move.w  d0,d1           ; copia la coordinata X
        and.w   #$000F,d0       ; seleziona i 4 bit piu` bassi della X..
        ror.w   #4,d0           ; .. e li sposta nei bit da 12 a 15
        or.w    #$0BCA,d0       ; con un OR ottengo il valore da scrivere
                                ; in BLTCON0. Con questo valore di LF ($CA)
                                ; si disegnano linee in EOR con lo sfondo. 

        lsr.w   #4,d1           ; cancella i 4 bit bassi della X
        add.w   d1,d1           ; ottiene l'offset X in bytes   
        add.w   d1,a0           ; aggiunge l'offset X all'indirizzo

        move.w  d2,d1           ; copia DX in D1
        addq.w  #1,d1           ; D1=DX+1
        lsl.w   #$06,d1         ; calcola in D1 il valore da mettere in BLTSIZE
        addq.w  #$0002,d1       ; aggiunge la larghezza, pari a 2 words

        lsl.w   #$02,d3         ; D3=4*DY
        add.w   d2,d2           ; D2=2*DX

        btst    #6,$dff002
WaitLineOR:
        btst    #6,$dff002        ; aspetta blitter fermo
        bne     WaitLineOR

        move.w  d3,$dff062      ; BLTBMOD=4*DY
        sub.w   d2,d3           ; D3=4*DY-2*DX
        move.w  d3,$dff052      ; BLTAPTL=4*DY-2*DX

                                ; prepara valore da scrivere in BLTCON1
        or.w    #$0001,d5       ; setta bit 0 (attiva line-mode)
        tst.w   d3
        bpl.s   OK1OR             ; se 4*DY-2*DX>0 salta..
        or.w    #$0040,d5       ; altrimenti setta il bit SIGN
OK1OR:
        move.w  d0,$dff040      ; BLTCON0
        move.w  d5,$dff042      ; BLTCON1
        sub.w   d2,d3           ; D3=4*DY-4*DX
        move.w  d3,$dff064      ; BLTAMOD=4*DY-4*DX
        move.l  a0,$dff048      ; BLTCPT - indirizzo schermo
        move.l  a0,$dff054      ; BLTDPT - indirizzo schermo
        move.w  d1,$dff058      ; BLTSIZE
        rts