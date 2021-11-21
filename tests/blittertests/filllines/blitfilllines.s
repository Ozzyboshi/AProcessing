  XDEF                  _blitfillline_test1

  include               "../../../libs/rasterizers/processing_bitplanes_fast.s"
  ;include               "../../../libs/rasterizers/globaloptions.s"
  include               "../../../libs/ammxmacros.i"
  ;include               "../../../libs/rasterizers/processingfill.s"
  include               "../../../libs/matrix/matrix.s"
  include               "../../../libs/trigtables.i"
  include               "../../../libs/rasterizers/processing_table_plotrefs.s"
  include               "../../../libs/rasterizers/processingclearfunctions.s"
  ;include               "../../../libs/rasterizers/clipping.s"
  ;include               "../../../libs/blitter/lines.s"

_blitfillline_test1:
  move.l                d2,-(sp)
  CLEARFASTBITPLANES 
         
  lea                   $dff000,a5
  jsr                   InitLine                                                   ; inizializza line-mode

  move.w                #$ffff,d0                                                  ; linea continua
  jsr                   SetPattern                                                 ; definisce pattern

  MOVE.W                #%1000001111000000,$96(a5)

  move.w                #0,d0                                                      ; x1
  move.w                #0,d1                                                      ; y1
  move.w                #0,d2                                                      ; x2
  move.w                #5,d3                                                      ; y2
;	lea	bitplane,a0
  lea                   SCREEN_0,a0

  bsr.w                 DrawlineFill

	
  bsr.w                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                (sp)+,d2
  rts



; Lezione10s.s	Riempimento corretto di un poligono chiuso
;		tasto destro per blittare, sinistro per uscire

;	SECTION	CiriCop,CODE

;	Include	"DaWorkBench.s"	; togliere il ; prima di salvare con "WO"

*****************************************************************************
;	include	"startup1.s"	; Salva Copperlist Etc.
*****************************************************************************

		;5432109876543210
;DMASET	EQU	%1000001111000000	; copper,bitplane,blitter DMA


;START:
;	Puntiamo la PIC "vuota"

;	MOVE.L	#BITPLANE,d0	; dove puntare
;	LEA	BPLPOINTERS,A1	; puntatori COP
;	move.w	d0,6(a1)
;	swap	d0
;	move.w	d0,2(a1)

;	lea	$dff000,a5		; CUSTOM REGISTER in a5
;	MOVE.W	#DMASET,$96(a5)		; DMACON - abilita bitplane, copper
;	move.l	#COPPERLIST,$80(a5)	; Puntiamo la nostra COP
;	move.w	d0,$88(a5)		; Facciamo partire la COP
;	move.w	#0,$1fc(a5)		; Disattiva l'AGA
;	move.w	#$c00,$106(a5)		; Disattiva l'AGA
;	move.w	#$11,$10c(a5)		; Disattiva l'AGA

;	bsr.w	InitLine	; inizializza line-mode

;	move.w	#$ffff,d0	; linea continua
;	bsr.w	SetPattern	; definisce pattern

;	move.w	#30,d0		; x1
;	move.w	#125,d1		; y1
;	move.w	#130,d2		; x2
;	move.w	#180,d3		; y2
;	lea	bitplane,a0
;	bsr.w	DrawlineFill

;	move.w	#220,d0		; x1
;	move.w	#105,d1		; y1
;	move.w	#130,d2		; x2
;	move.w	#180,d3		; y2
;	lea	bitplane,a0
;	bsr.w	DrawlineFill

;	move.w	#220,d0		; x1
;	move.w	#105,d1		; y1
;	move.w	#150,d2		; x2
;	move.w	#60,d3		; y2
;	lea	bitplane,a0
;	bsr.w	DrawlineFill

;	move.w	#30,d0		; x1
;	move.w	#125,d1		; y1
;	move.w	#150,d2		; x2
;	move.w	#60,d3		; y2
;	lea	bitplane,a0
;	bsr.s	DrawlineFill

;mouse1:
;	btst	#2,$dff016	; tasto destro del mouse premuto?
;	bne.s	mouse1

;	move.w	#0,d0			; inclusivo
;	move.w	#0,d1			; CARRYIN = 0
;	lea	bitplane+180*40+28,a0
;	bsr.s	Fill

;mouse2:
;	btst	#6,$bfe001	; mouse premuto?
;	bne.s	mouse2


;	rts


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

;Fill:
;	btst	#6,2(a5) ; dmaconr
;WBlit1:
;	btst	#6,2(a5) ; dmaconr - attendi che il blitter abbia finito
;	bne.s	wblit1

;	move.w	#$09f0,$40(a5)		; BLTCON0 copia normale

;	tst.w	d0			; testa D0 per decidere il tipo di fill
;	bne.s	fill_esclusivo
;	move.w	#$000a,d2		; valore di BLTCON1: settati i bit del
					; fill inclusivo e del modo discendente
;	bra.s	test_fill_carry

;fill_esclusivo:
;	move.w	#$0012,d2		; valore di BLTCON1: settati i bit del
					; fill esclusivo e del modo discendente

;test_fill_carry:
;	tst.w	d1			; testa D1 per vedere se deve settare
					; il bit FILL_CARRYIN

;	beq.s	fatto_bltcon1		; se D1=0 salta..
;	bset	#2,d2			; altrimenti setta il bit 2 di D2

;fatto_bltcon1:
;	move.w	d2,$42(a5)		; BLTCON1

;	move.w	#12,$64(a5)		; BLTAMOD larghezza 14 words (40-28=12)
;	move.w	#12,$66(a5)		; BLTDMOD (40-28=12)

;	move.l	#bitplane+180*40+28,$50(a5)
					; BLTAPT (fisso al rettangolo sorgente)
					; il rettangolo sorgente racchiude
					; interamente le 2 linee.
					; puntiamo l'ultima word del rettangolo
					; per via del modo discendente

;	move.l	a0,$54(a5)		; BLTDPT  carica il parametro
;	move.w	#(64*121)+14,$58(a5)	; BLTSIZE (via al blitter !)
					; larghezza 14 words
					; altezza 121 righe (1 plane)
;	rts


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
  cmp.w                 d1,d3                                                      ; se D3>D1 i punti sono gia` nell'ordine giusto
  bge.w                 Ordinati
  exg.l                 d1,d3                                                      ; altrimenti scambiali
  exg.l                 d0,d2

Ordinati:
  sub.w                 d1,d3                                                      ; D3=DiffY  (e` sicuramente positivo)

* scelta ottante

  sub.w                 d0,d2                                                      ; D2=X2-X1
  bmi.s                 DRAW4                                                      ; se negativo salta, altrimenti D2=DiffX
  cmp.w                 d3,d2                                                      ; confronta DiffX e DiffY
  bmi.s                 DRAW1                                                      ; se D2<D3 salta..
				; .. altrimenti D3=DY e D2=DX
  moveq                 #$10,d5                                                    ; codice ottante
  bra.s                 DRAWL
DRAW1:
  exg.l                 d2,d3                                                      ; scambia D2 e D3, in modo che D3=DY e D2=DX
  moveq                 #$00,d5                                                    ; codice ottante
  bra.s                 DRAWL
DRAW4:
  neg.w                 d2                                                         ; rende D2 positivo
  cmp.w                 d3,d2                                                      ; confronta DiffX e DiffY
  bmi.s                 DRAW5                                                      ; se D2<D3 salta..
				; .. altrimenti D3=DY e D2=DX
  moveq                 #$14,d5                                                    ; codice ottante
  bra.s                 DRAWL
DRAW5:
  exg.l                 d2,d3                                                      ; scambia D2 e D3, in modo che D3=DY e D2=DX
  moveq                 #$08,d5                                                    ; codice ottante
  bra.w                 DRAWL

; Quando l'esecuzione raggiunge questo punto, abbiamo:
; D2 = DX
; D3 = DY
; D5 = codice ottante

DRAWL:
  mulu.w                #40,d1                                                     ; offset Y
  add.l                 d1,a0                                                      ; aggiunge l'offset Y all'indirizzo

  move.w                d0,d1                                                      ; copia la coordinata X
  lsr.w                 #4,d1                                                      ; cancella i 4 bit bassi della X
  add.w                 d1,d1                                                      ; ottiene l'offset X in bytes
  add.w                 d1,a0                                                      ; aggiunge l'offset X all'indirizzo

  and.w                 #$000F,d0                                                  ; seleziona i 4 bit piu` bassi della X..
  move.w                d0,d1                                                      ; .. li copia in D1..
  ror.w                 #4,d0                                                      ; .. e li sposta nei bit da 12 a 15
  or.w                  #$0B4A,d0                                                  ; con un OR ottengo il valore da scrivere
				; in BLTCON0. Con questo valore di LF ($4A)
				; si disegnano linee in EOR con lo sfondo.

  move.l                a0,a1                                                      ; copia l'indirizzo
  cmp.w                 #7,d1                                                      ; il numero del bit e` > 7 ?
  ble.s                 NonCorreggi                                                ; se no salta

  addq.w                #1,a1                                                      ; ..altrimenti punta al prossimo byte
  subq.w                #8,d1                                                      ; e rendi il numero del bit < 7
NonCorreggi:
  not.b                 d1                                                         ; inverti la numerazione dei bit
				; questa istruzione e` necessaria perche`
				; all'interno del byte i bit sono numerati 
				; da destra a sinistra, mentre le coordinate
				; dei pixel vanno da sinistra a destra
  bchg                  d1,(a1)                                                    ; inverti il primo pixel della linea

  move.w                d2,d1                                                      ; copia DX in D1
  addq.w                #1,d1                                                      ; D1=DX+1
  lsl.w                 #$06,d1                                                    ; calcola in D1 il valore da mettere in BLTSIZE
  addq.w                #2,d1                                                      ; aggiunge la larghezza, pari a 2 words

  lsl.w                 #$02,d3                                                    ; D3=4*DY
  add.w                 d2,d2                                                      ; D2=2*DX

  btst                  #$06,$02(a5)
WaitLine:
  btst                  #$06,$02(a5)                                               ; aspetta blitter fermo
  bne.s                 WaitLine

  move.w                d3,$62(a5)                                                 ; BLTBMOD=4*DY
  sub.w                 d2,d3                                                      ; D3=4*DY-2*DX
  move.w                d3,$52(a5)                                                 ; BLTAPTL=4*DY-2*DX

				; prepara valore da scrivere in BLTCON1
  or.w                  #$0003,d5                                                  ; setta bit 0 (attiva line-mode), e
				; il bit 1 (linee speciali per fill)

  tst.w                 d3
  bpl.s                 OK1                                                        ; se 4*DY-2*DX>0 salta..
  or.w                  #$0040,d5                                                  ; altrimenti setta il bit SIGN
OK1:
  move.w                d0,$40(a5)                                                 ; BLTCON0
  move.w                d5,$42(a5)                                                 ; BLTCON1
  sub.w                 d2,d3                                                      ; D3=4*DY-4*DX
  move.w                d3,$64(a5)                                                 ; BLTAMOD=4*DY-4*DX
  move.l                a0,$48(a5)                                                 ; BLTCPT - indirizzo schermo
  move.l                a0,$54(a5)                                                 ; BLTDPT - indirizzo schermo
  move.w                d1,$58(a5)                                                 ; BLTSIZE
  rts
	

;******************************************************************************
; Questa routine setta i registri del blitter che non devono essere
; cambiati tra una line e l'altra
;******************************************************************************

InitLine:
  WAITBLITTER

  moveq                 #-1,d5
  move.l                d5,$44(a5)                                                 ; BLTAFWM/BLTALWM = $FFFF
  move.w                #$8000,$74(a5)                                             ; BLTADAT = $8000
  move.w                #40,$60(a5)                                                ; BLTCMOD = 40
  move.w                #40,$66(a5)                                                ; BLTDMOD = 40
  rts

;******************************************************************************
; Questa routine definisce il pattern che deve essere usato per disegnare
; le linee. In pratica si limita a settare il registro BLTBDAT.
; D0 - contiene il pattern della linea 
;******************************************************************************

SetPattern:
  WAITBLITTER

  move.w                d0,$72(a5)                                                 ; BLTBDAT = pattern della linea
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

