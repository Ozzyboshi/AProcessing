all:
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68000 -DEXTRA_BLIT_ALGOS -DUSE_VIDEOCHIP -DUSE_CLIPPING ./blitlines.s  -o ./blitlines.o
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68080 -DEXTRA_BLIT_ALGOS -DUSE_VIDEOCHIP -DVAMPIRE -DUSE_CLIPPING ./blitlines.s  -o ./blitlinesvampire.o
	m68k-amigaos-gcc -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  blitlines.c -o blitlines blitlines.o ../../testlibs/testlib.o 
	m68k-amigaos-gcc -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  blitlines.c -o blitlinesvampire blitlinesvampire.o ../../testlibs/testlib.o 
	chmod 777 blitlines
	chmod 777 blitlinesvampire

test: blitlines
	vamos -v ./blitlines 2>>/tmp/vamosinfo

copy: blitlines
	scp -r ../blitlines pi@10.0.0.4:/media/MAXTOR/upload/Vampire/

clean:
	rm -f *.o
	rm -f ./blitlines