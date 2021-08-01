  XDEF                  _drawing_test3d1


  SECTION               PROCESSING,CODE_F

  include               "../../../libs/rasterizers/globaloptions.s"
  include               "../../../libs/ammxmacros.i"
  include               "../../../libs/matrix/matrix.s"
  include               "../../../libs/matrix/scale.s"
  include               "../../../libs/trigtables.i"
  include               "../../../libs/rasterizers/3dglobals.i"
  include               "../../../libs/rasterizers/processing_bitplanes_fast.s"
  include               "../../../libs/rasterizers/processing_table_plotrefs.s"
  include               "../../../libs/rasterizers/processingclearfunctions.s"
  include               "../../../libs/rasterizers/point.s"
  include               "../../../libs/rasterizers/square.s"
  include               "../../../libs/rasterizers/triangle3d.s"
  include               "../../../libs/rasterizers/rectangle.s"
  include               "../../../libs/rasterizers/circle.s"
  include               "../../../libs/rasterizers/processingfill.s"
  include               "../../../libs/rasterizers/clipping.s"

_drawing_test3d1:
	
  CLEARFASTBITPLANES                                                               ; Clear fast bitplanes
  RESETFILLTABLE
  LOADIDENTITY

  VERTEX_INIT           1,#0,#-5,#0
  VERTEX_INIT           2,#10,#10,#-200
  VERTEX_INIT           3,#-10,#10,#0

  bsr.w                 TRIANGLE3D
  
  bsr.w                 processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  rts
