  XDEF                  _blitfillline_test1
  XDEF                  _blitfillline_test2
  XDEF                  _blitfillline_test3
  XDEF                  _blitfillline_test4


  include               "../../../libs/rasterizers/processing_bitplanes_fast.s"
  ;include               "../../../libs/rasterizers/globaloptions.s"
  include               "../../../libs/ammxmacros.i"
  include               "../../../libs/matrix/matrix.s"
  include               "../../../libs/rasterizers/point.s"
  include               "../../../libs/trigtables.i"
  include               "../../../libs/rasterizers/processing_table_plotrefs.s"
  include               "../../../libs/rasterizers/processingclearfunctions.s"
  ;include               "../../../libs/rasterizers/clipping.s"
  include               "../../../libs/blitter/lines.s"

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

_blitfillline_test2:
  move.l                d2,-(sp)
  CLEARFASTBITPLANES 
         
  lea                   $dff000,a5
  jsr                   InitLine                                                   ; inizializza line-mode

  move.w                #$ffff,d0                                                  ; linea continua
  jsr                   SetPattern                                                 ; definisce pattern

  MOVE.W                #%1000001111000000,$96(a5)

  move.w                #0,d0                                                      ; x1
  move.w                #5,d1                                                      ; y1
  move.w                #30,d2                                                      ; x2
  move.w                #5,d3                                                      ; y2
  lea                   SCREEN_0,a0

  bsr.w                 DrawlineFill

  bsr.w                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                (sp)+,d2
  rts

_blitfillline_test3:
  move.l                d2,-(sp)
  CLEARFASTBITPLANES 
         
  lea                   $dff000,a5
  jsr                   InitLine                                                   ; inizializza line-mode

  move.w                #$ffff,d0                                                  ; linea continua
  jsr                   SetPattern                                                 ; definisce pattern

  MOVE.W                #%1000001111000000,$96(a5)

  move.w                #5,d0                                                      ; x1
  move.w                #0,d1                                                      ; y1
  move.w                #0,d2                                                      ; x2
  move.w                #5,d3                                                      ; y2
  lea                   SCREEN_0,a0

  bsr.w                 DrawlineFill


  move.w                #5,d0                                                      ; x1
  move.w                #0,d1                                                      ; y1
  move.w                #10,d2                                                      ; x2
  move.w                #5,d3                                                      ; y2
  lea                   SCREEN_0,a0

  bsr.w                 DrawlineFill


  move.w                #0,d0                                                      ; x1
  move.w                #5,d1                                                      ; y1
  move.w                #10,d2                                                      ; x2
  move.w                #5,d3                                                      ; y2
  lea                   SCREEN_0,a0
  bsr.w                 DrawlineFill

  WAITBLITTER

  move.w                #5,d0                                                      ; x1
  move.w                #0,d1                                                      ; y1
  lea                   SCREEN_0,a0
  ;PLOTPOINT

  move.w                #0,d0                                                      ; x1
  move.w                #5,d1                                                      ; y1
  ;PLOTPOINT

  move.w                #10,d0                                                      ; x1
  move.w                #5,d1                                                      ; y1
  ;PLOTPOINT

  bsr.w                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  move.l                (sp)+,d2
  rts


_blitfillline_test4:
  move.l                d2,-(sp)
  CLEARFASTBITPLANES 
         
  lea                   $dff000,a5
  jsr                   InitLine                                                   ; inizializza line-mode

  move.w                #$ffff,d0                                                  ; linea continua
  jsr                   SetPattern                                                 ; definisce pattern

  MOVE.W                #%1000001111000000,$96(a5)

  move.w                #15,d0                                                      ; x1
  move.w                #0,d1                                                      ; y1
  move.w                #0,d2                                                      ; x2
  move.w                #5,d3                                                      ; y2
  lea                   SCREEN_0,a0

  bsr.w                 DrawlineFill


  move.w                #15,d0                                                      ; x1
  move.w                #0,d1                                                      ; y1
  move.w                #30,d2                                                      ; x2
  move.w                #5,d3                                                      ; y2
  lea                   SCREEN_0,a0

  bsr.w                 DrawlineFill


  move.w                #0,d0                                                      ; x1
  move.w                #5,d1                                                      ; y1
  move.w                #30,d2                                                      ; x2
  move.w                #5,d3                                                      ; y2
  lea                   SCREEN_0,a0
  ;bsr.w                 DrawlineFill

  WAITBLITTER
  move.w                #15,d0                                                      ; x1
  move.w                #0,d1                                                      ; y1
  lea                   SCREEN_0,a0
  ;PLOTPOINT

  move.w                #0,d0                                                      ; x1
  move.w                #5,d1                                                      ; y1
  ;PLOTPOINT

  move.w                #30,d0                                                      ; x1
  move.w                #5,d1                                                      ; y1
  ;PLOTPOINT

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

