all:
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68000 -DSQRT_FAKE -DSQRT_BIG -DUSE_CLIPPING ./precalcsimpleops.s  -o ./precalcsimpleops.o
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68080 -DSQRT_FAKE -DSQRT_BIG -DVAMPIRE -DUSE_CLIPPING ./precalcsimpleops.s  -o ./precalcsimpleopsvampire.o
	m68k-amigaos-gcc  -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  precalcsimpleops.c -o precalcsimpleops precalcsimpleops.o ../../testlibs/testlib.o 
	m68k-amigaos-gcc  -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  precalcsimpleops.c -o precalcsimpleopsvampire precalcsimpleopsvampire.o ../../testlibs/testlib.o 
	chmod 777 precalcsimpleops
	chmod 777 precalcsimpleopsvampire

test: precalcsimpleops
	vamos -v ./precalcsimpleops 2>>/tmp/vamosinfo

copy: precalcsimpleops
	scp -r ../precalcsimpleops pi@10.0.0.4:/media/MAXTOR/upload/Vampire/

clean:
	rm -f *.o
	rm -f ./precalcsimpleops