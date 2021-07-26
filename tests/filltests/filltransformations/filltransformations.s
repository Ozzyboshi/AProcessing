  XDEF                                          _filltransformations_test1
  XDEF                                          _filltransformations_test2
  XDEF                                          _filltransformations_test3
  XDEF                                          _filltransformations_test4


  SECTION                                       PROCESSING,CODE_F
  include                                       "../../../libs/rasterizers/globaloptions.s"
  include                                       "../../../libs/ammxmacros.i"
  include                                       "../../../libs/matrix/matrix.s"
  include                                       "../../../libs/matrix/scale.s"
  include                                       "../../../libs/trigtables.i"
  include                                       "../../../libs/rasterizers/processing_bitplanes_fast.s"
  include                                       "../../../libs/rasterizers/processing_table_plotrefs.s"
  include                                       "../../../libs/rasterizers/processingclearfunctions.s"
  include                                       "../../../libs/rasterizers/point.s"
  include                                       "../../../libs/rasterizers/square.s"
  include                                       "../../../libs/rasterizers/triangle.s"
  include                                       "../../../libs/rasterizers/rectangle.s"
  include                                       "../../../libs/rasterizers/circle.s"
  include                                       "../../../libs/rasterizers/processingfill.s"
  include                                       "../../../libs/rasterizers/clipping.s"



_filltransformations_test1:
  RESETFILLTABLE
  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6
  ENABLE_CLIPPING
  move.w                                        #0,d0
  move.w                                        #0,d1
  jsr                                           TRANSLATE

  ROTATE                                        #45

  move.w                                        #-5,d0
  move.w                                        #-5,d1
  move.w                                        #10,d5

  ; start of square
  lea                                           LINEVERTEX_START_FINAL,a1
    
  ; Start of line 1
  move.w                                        d0,d6
  move.w                                        d1,d7

  bsr.w                                         point_execute_transformation


    ; save transformed values
  move.w                                        d0,(a1)+
  move.w                                        d1,(a1)+

  DISABLE_CLIPPING

  move.l                                        #LINEVERTEX_START_FINAL,d0

  rts

    ; restore first point
  move.w                                        d6,d0
  move.w                                        d7,d1
    ; add width
  add.w                                         d5,d0
  bsr.w                                         point_execute_transformation
    ; save transformed values
  move.w                                        d0,(a1)+
  move.w                                        d1,(a1)+

   


  IFD                                           LOL


  bsr.w                                         ammxlinefill
    ; End of Line 1

    ; Start of line 2
  lea                                           LINEVERTEX_START_FINAL,a1
  addq                                          #4,a1

    ; restore first point
  move.w                                        d6,d0
  move.w                                        d7,d1
    ; add height
  add.w                                         d5,d1

  bsr.w                                         point_execute_transformation
    ; save transformed values
  move.w                                        d0,(a1)
  move.w                                        d1,2(a1)
  bsr.w                                         ammxlinefill
    ; End of line 2

    ; Start of line 3
  lea                                           LINEVERTEX_START_FINAL,a1
    ; restore first point
  move.w                                        d6,d0
  move.w                                        d7,d1
    ; add height and width
  add.w                                         d5,d0
  add.w                                         d5,d1
  bsr.w                                         point_execute_transformation
    ; save transformed values
  move.w                                        d0,(a1)+
  move.w                                        d1,(a1)+
  bsr.w                                         ammxlinefill
    ; ENd of line 3

  lea                                           LINEVERTEX_START_FINAL,a1
  addq                                          #4,a1
    ; restore first point
  move.w                                        d6,d0
  move.w                                        d7,d1
    ; add width
  add.w                                         d5,d0
  bsr.w                                         point_execute_transformation
    ; save transformed values
  move.w                                        d0,(a1)+
  move.w                                        d1,(a1)+
  bsr.w                                         ammxlinefill
  ENDIF

  DISABLE_CLIPPING
  bsr.w                                         processing_fill_table_addr
  rts


_filltransformations_test2                    :
  RESETFILLTABLE
  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6
  ENABLE_CLIPPING
  move.w                                        #0,d0
  move.w                                        #0,d1
  jsr                                           TRANSLATE

  ROTATE                                        #45

  move.w                                        #-5,d0
  move.w                                        #-5,d1
  move.w                                        #10,d5

  ; start of square
  lea                                           LINEVERTEX_START_FINAL,a1
    
  ; Start of line 1
  move.w                                        d0,d6
  move.w                                        d1,d7

  bsr.w                                         point_execute_transformation


    ; save transformed values
  move.w                                        d0,(a1)+
  move.w                                        d1,(a1)+

    ; restore first point
  move.w                                        d6,d0
  move.w                                        d7,d1
    ; add width
  add.w                                         d5,d0
  bsr.w                                         point_execute_transformation
    ; save transformed values
  lea                                           LINEVERTEX_START_FINAL,a1

  move.w                                        d0,(a1)+
  move.w                                        d1,(a1)+


  DISABLE_CLIPPING
  move.l                                        #LINEVERTEX_START_FINAL,d0

  rts


_filltransformations_test3                    :
  RESETFILLTABLE
  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6
  ENABLE_CLIPPING

  ROTATE                                        #292

  move.w                                        #160-10,d0
  move.w                                        #128-10,d1
  move.w                                        #20,d5

  lea                                           LINEVERTEX_START_FINAL,a1
    
    ; Start of line 1
  move.w                                        d0,d6
  move.w                                        d1,d7

  bsr.w                                         point_execute_transformation

    ; save transformed values
  move.w                                        d0,(a1)+
  move.w                                        d1,(a1)+

    ; restore first point
  move.w                                        d6,d0
  move.w                                        d7,d1
    ; add width
  add.w                                         d5,d0
  bsr.w                                         point_execute_transformation
    ; save transformed values
  move.w                                        d0,(a1)+
  move.w                                        d1,(a1)+

  bsr.w                                         ammxlinefill
    ; End of Line 1


    ; Start of line 2
  lea                                           LINEVERTEX_START_FINAL,a1
  addq                                          #4,a1

    ; restore first point
  move.w                                        d6,d0
  move.w                                        d7,d1
    ; add height
  add.w                                         d5,d1

  bsr.w                                         point_execute_transformation
    ; save transformed values
  move.w                                        d0,(a1)
  move.w                                        d1,2(a1)
  bsr.w                                         ammxlinefill
    ; End of line 2

    ; Start of line 3
  lea                                           LINEVERTEX_START_FINAL,a1
    ; restore first point
  move.w                                        d6,d0
  move.w                                        d7,d1
    ; add height and width
  add.w                                         d5,d0
  add.w                                         d5,d1
  bsr.w                                         point_execute_transformation
    ; save transformed values
  move.w                                        d0,(a1)+
  move.w                                        d1,(a1)+
  bsr.w                                         ammxlinefill
    ; ENd of line 3

  lea                                           LINEVERTEX_START_FINAL,a1
  addq                                          #4,a1
    ; restore first point
  move.w                                        d6,d0
  move.w                                        d7,d1
    ; add width
  add.w                                         d5,d0
  bsr.w                                         point_execute_transformation
    ; save transformed values
  move.w                                        d0,(a1)+
  move.w                                        d1,(a1)+
  bsr.w                                         ammxlinefill


  DISABLE_CLIPPING
  move.l                                        #FILL_TABLE,d0

  rts

  _filltransformations_test4                    :
  RESETFILLTABLE
  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6
  ENABLE_CLIPPING

  STROKE                                        #2

  ROTATE                                        #229
  move.w                                        #100,d0
  move.w                                        #18,d1
  jsr                                         TRANSLATE

                 
  ROTATE                                        #322
  move.w                                        #0,d0
  move.w                                        #0,d1
  jsr                                         TRANSLATE


  move.w                                        #0-10,d0
  move.w                                        #0-10,d1
  move.w                                        #20,d5
  bsr.w                                         SQUARE      
  DISABLE_CLIPPING
                  
  STROKE                                        #2

  RESET_CURRENT_TRANSFORMATION_MATRIX_Q_10_6

  move.w                                        #160,d0
  move.w                                        #128,d1
  jsr                                           TRANSLATE

  STROKE                                        #1
  move.w                                        #-15,d0
  move.w                                        #-15,d1
  move.w                                        #30,d5

   lea                                           LINEVERTEX_START_FINAL,a1
    
    ; Start of line 1
  move.w                                        d0,d6
  move.w                                        d1,d7

  bsr.w                                         point_execute_transformation

    ; save transformed values
  move.w                                        d0,(a1)+
  move.w                                        d1,(a1)+

    ; restore first point
  move.w                                        d6,d0
  move.w                                        d7,d1
    ; add width
  add.w                                         d5,d0
  bsr.w                                         point_execute_transformation
    ; save transformed values
  move.w                                        d0,(a1)+
  move.w                                        d1,(a1)+

  bsr.w                                         ammxlinefill
    ; End of Line 1  

  move.l                                        #FILL_TABLE,d0

  rts