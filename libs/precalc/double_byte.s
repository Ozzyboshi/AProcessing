; this function doubles the byte on the lower part of d0
; for example , if d0 lsb is 10101010 the function stores in
; the lower word of d0 the value 1100110011001100.
; Useful for X scaling an image
; trashes nothing
; output is into d0
DOUBLE_BYTE:
  movem.l          d1/d7,-(sp)
  moveq            #8-1,d7 ; we want to cycle 8 times because we are processing a byte
  andi.l           #$000000FF,d0 ; clean d0
  ror.l            #8,d0 ; put the byte to analyze on the high part
double_byte_loop:
  rol.l            #1,d0
  scs              d1
  andi.w           #1,d1
  lsl.w            #1,d0
  or.b             d1,d0
  dbra             d7,double_byte_loop
  movem.l          (sp)+,d1/d7
  rts