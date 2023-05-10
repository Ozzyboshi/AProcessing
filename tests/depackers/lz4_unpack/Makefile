all:
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68000 -DSQRT_FAKE -DSQRT_BIG -DUSE_CLIPPING ./lz4.s  -o ./lz4.o
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68080 -DSQRT_FAKE -DSQRT_BIG -DVAMPIRE -DUSE_CLIPPING ./lz4.s  -o ./lz4vampire.o
	m68k-amigaos-gcc  -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  lz4.c -o lz4 lz4.o ../../testlibs/testlib.o 
	m68k-amigaos-gcc  -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  lz4.c -o lz4vampire lz4vampire.o ../../testlibs/testlib.o 
	chmod 777 lz4
	chmod 777 lz4vampire

test: lz4
	vamos -v ./lz4 2>>/tmp/vamosinfo

copy: lz4
	scp -r ../lz4 pi@10.0.0.4:/media/MAXTOR/upload/Vampire/

clean:
	rm -f *.o
	rm -f ./lz4