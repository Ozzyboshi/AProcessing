
	XDEF _filline_test1
	XDEF _filline_test2
	XDEF _filline_test3
	XDEF _filline_test4
	XDEF _filline_test5
	XDEF _filline_test6
	XDEF _filline_test7
	XDEF _filline_test8
	XDEF _filline_test9
	XDEF _filline_test10
	
	SECTION PROCESSING,CODE_F

	include "../../../libs/rasterizers/processing_bitplanes_fast.s"
	include "../../../libs/rasterizers/processing_table_plotrefs.s"
	include "../../../libs/rasterizers/processingfill.s"
	include "../../../libs/rasterizers/processingclearfunctions.s"
	include "../../../libs/rasterizers/globaloptions.s"

_filline_test1:

	RESETFILLTABLE

	lea LINEVERTEX_START_FINAL,a1
	move.w #1,(a1)+
	move.w #1,(a1)+
	move.w #8,(a1)+
	move.w #5,(a1)+
	bsr.w ammxlinefill
	
	lea LINEVERTEX_START_FINAL,a1
	move.w #10,(a1)+
	move.w #1,(a1)+
	move.w #18,(a1)+
	move.w #5,(a1)+
	bsr.w ammxlinefill
    

	bsr.w processing_fill_table_addr ; fill table addr in d0
	rts

_filline_test2:

	RESETFILLTABLE

	lea LINEVERTEX_START_FINAL,a1
	move.w #8,(a1)+
	move.w #5,(a1)+
	move.w #1,(a1)+
	move.w #1,(a1)+
	bsr.w ammxlinefill
	
	lea LINEVERTEX_START_FINAL,a1
	move.w #18,(a1)+
	move.w #5,(a1)+
	move.w #10,(a1)+
	move.w #1,(a1)+
	bsr.w ammxlinefill
    

	bsr.w processing_fill_table_addr ; fill table addr in d0
	rts

_filline_test3:

	RESETFILLTABLE

	lea LINEVERTEX_START_FINAL,a1
	move.w #10,(a1)+
	move.w #1,(a1)+
	move.w #18,(a1)+
	move.w #5,(a1)+
	bsr.w ammxlinefill

	lea LINEVERTEX_START_FINAL,a1
	move.w #1,(a1)+
	move.w #1,(a1)+
	move.w #8,(a1)+
	move.w #5,(a1)+
	bsr.w ammxlinefill
    

	bsr.w processing_fill_table_addr ; fill table addr in d0
	rts

_filline_test4:

	RESETFILLTABLE

	lea LINEVERTEX_START_FINAL,a1
	move.w #1,(a1)+
	move.w #1,(a1)+
	move.w #8,(a1)+
	move.w #5,(a1)+
	bsr.w ammxlinefill
	
	lea LINEVERTEX_START_FINAL,a1
	move.w #18,(a1)+
	move.w #5,(a1)+
	move.w #10,(a1)+
	move.w #1,(a1)+
	bsr.w ammxlinefill
    

	bsr.w processing_fill_table_addr ; fill table addr in d0
	rts

_filline_test5:

	RESETFILLTABLE

	lea LINEVERTEX_START_FINAL,a1
	move.w #8,(a1)+
	move.w #5,(a1)+
	move.w #1,(a1)+
	move.w #1,(a1)+
	bsr.w ammxlinefill
	
	lea LINEVERTEX_START_FINAL,a1
	move.w #10,(a1)+
	move.w #1,(a1)+
	move.w #18,(a1)+
	move.w #5,(a1)+
	bsr.w ammxlinefill
    

	bsr.w processing_fill_table_addr ; fill table addr in d0
	rts

_filline_test6:

	RESETFILLTABLE
	
	lea LINEVERTEX_START_FINAL,a1
	move.w #1,(a1)+
	move.w #1,(a1)+
	move.w #3,(a1)+
	move.w #2,(a1)+
	bsr.w ammxlinefill
	
	lea LINEVERTEX_START_FINAL,a1
	move.w #150,(a1)+
	move.w #1,(a1)+
	move.w #155,(a1)+
	move.w #5,(a1)+
	bsr.w ammxlinefill

	lea LINEVERTEX_START_FINAL,a1
	move.w #3,(a1)+
	move.w #2,(a1)+
	move.w #155,(a1)+
	move.w #5,(a1)+
	bsr.w ammxlinefill

	bsr.w processing_fill_table_addr ; fill table addr in d0
	rts

_filline_test7:

	RESETFILLTABLE

	lea LINEVERTEX_START_FINAL,a1
	move.w #1,(a1)+
	move.w #1,(a1)+
	move.w #1,(a1)+
	move.w #2,(a1)+
	bsr.w ammxlinefill

	bsr.w processing_fill_table_addr ; fill table addr in d0
	rts

_filline_test8:
	RESETFILLTABLE
	lea LINEVERTEX_START_FINAL,a1
	move.w #0,(a1)+
	move.w #0,(a1)+
	move.w #1,(a1)+
	move.w #7,(a1)+
	bsr.w ammxlinefill

	bsr.w processing_fill_table_addr ; fill table addr in d0
	rts

_filline_test9:
	RESETFILLTABLE
	lea LINEVERTEX_START_FINAL,a1
	move.w #0,(a1)+
	move.w #0,(a1)+
	move.w #8,(a1)+
	move.w #18,(a1)+
	bsr.w ammxlinefill

	bsr.w processing_fill_table_addr ; fill table addr in d0
	rts

_filline_test10:
	RESETFILLTABLE
	lea LINEVERTEX_START_FINAL,a1
	move.w #0,(a1)+
	move.w #0,(a1)+
	move.w #0,(a1)+
	move.w #1,(a1)+
	bsr.w ammxlinefill

	lea LINEVERTEX_START_FINAL,a1
	move.w #319,(a1)+
	move.w #0,(a1)+
	move.w #319,(a1)+
	move.w #1,(a1)+
	bsr.w ammxlinefill

	bsr.w processing_fill_table_addr ; fill table addr in d0
	rts