  XDEF                   _drawing_test3d1
  XDEF                   _drawing_test3d2
  XDEF                   _drawing_test3d3
  XDEF                   _drawing_test3d4
  XDEF                   _drawing_test3d5

  SECTION                PROCESSING,CODE_F

  include                "../../../libs/rasterizers/globaloptions.s"
  include                "../../../libs/ammxmacros.i"
  include                "../../../libs/matrix/matrixcommon.s"
  include                "../../../libs/matrix/matrix.s"
  include                "../../../libs/matrix/scale.s"
  include                "../../../libs/trigtables.i"
  include                "../../../libs/rasterizers/3dglobals.i"
  include                "../../../libs/rasterizers/processing_bitplanes_fast.s"
  include                "../../../libs/rasterizers/processing_table_plotrefs.s"
  include                "../../../libs/rasterizers/processingclearfunctions.s"
  include                "../../../libs/rasterizers/point.s"
  include                "../../../libs/matrix/point.s"
  include                "../../../libs/rasterizers/square.s"
  include                "../../../libs/rasterizers/triangle3d.s"
  include                "../../../libs/rasterizers/foursidepolygon3d.s"
  include                "../../../libs/rasterizers/rectangle.s"
  include                "../../../libs/rasterizers/circle.s"
  include                "../../../libs/rasterizers/processingfill.s"
  include                "../../../libs/rasterizers/clipping.s"

_drawing_test3d1:
	
  CLEARFASTBITPLANES                                                                ; Clear fast bitplanes
  RESETFILLTABLE
  LOADIDENTITY

  VERTEX_INIT            1,#0,#-5,#0
  VERTEX_INIT            2,#10,#10,#-200
  VERTEX_INIT            3,#-10,#10,#0

  bsr.w                  TRIANGLE3D
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  
  rts

_drawing_test3d2:
	
  CLEARFASTBITPLANES                                                                ; Clear fast bitplanes
  RESETFILLTABLE
  LOADIDENTITY

  VERTEX_INIT            1,#0,#-50,#0
  VERTEX_INIT            2,#50,#50,#0
  VERTEX_INIT            3,#-50,#50,#0
  ROTATE_X_INV_Q_5_11    #0

  STROKE                 #1
  bsr.w                  TRIANGLE3D

  STROKE                 #2
  VERTEX_INIT            1,#0,#-50,#0
  VERTEX_INIT            2,#50,#50,#0
  VERTEX_INIT            3,#-50,#50,#0
  ROTATE_X_INV_Q_5_11    #180

  bsr.w                  TRIANGLE3D
  
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  
  rts

_drawing_test3d3:
	
  CLEARFASTBITPLANES                                                                ; Clear fast bitplanes
  RESETFILLTABLE
  LOADIDENTITY

  VERTEX_INIT            1,#-5,#-5,#0
  VERTEX_INIT            2,#5,#-5,#0
  VERTEX_INIT            3,#-5,#5,#0
  VERTEX_INIT            4,#5,#5,#0

  STROKE                 #3

  bsr.w                  FOURSIDEPOLYGON3D
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  
  rts

_drawing_test3d4:
	
  CLEARFASTBITPLANES                                                                ; Clear fast bitplanes
  RESETFILLTABLE
  LOADIDENTITY

  VERTEX_INIT            1,#-5,#-5,#0
  VERTEX_INIT            2,#5,#-5,#0
  VERTEX_INIT            3,#-5,#5,#0
  VERTEX_INIT            4,#5,#5,#0

  STROKE                 #3

  ROTATEX #70

  bsr.w                  FOURSIDEPOLYGON3D
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  
  rts

_drawing_test3d5:
	
  CLEARFASTBITPLANES                                                                ; Clear fast bitplanes
  RESETFILLTABLE
  LOADIDENTITY

  VERTEX_INIT            1,#-5,#-5,#0
  VERTEX_INIT            2,#5,#-5,#0
  VERTEX_INIT            3,#-5,#5,#0
  VERTEX_INIT            4,#5,#5,#0

  STROKE                 #3

  ROTATEY #70

  bsr.w                  FOURSIDEPOLYGON3D
  processing_bitplanes_fast_screen0                          ; returns bitplanes addr in d0
  
  rts