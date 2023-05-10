all:
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68000 -DSQRT_FAKE -DSQRT_BIG -DUSE_CLIPPING ./shrinkler.s  -o ./shrinkler.o
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68080 -DSQRT_FAKE -DSQRT_BIG -DVAMPIRE -DUSE_CLIPPING ./shrinkler.s  -o ./shrinklervampire.o
	m68k-amigaos-gcc  -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  shrinkler.c -o shrinkler shrinkler.o ../../testlibs/testlib.o 
	m68k-amigaos-gcc  -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  shrinkler.c -o shrinklervampire shrinklervampire.o ../../testlibs/testlib.o 
	chmod 777 shrinkler
	chmod 777 shrinklervampire

test: shrinkler
	vamos -v ./shrinkler 2>>/tmp/vamosinfo

copy: shrinkler
	scp -r ../shrinkler pi@10.0.0.4:/media/MAXTOR/upload/Vampire/

clean:
	rm -f *.o
	rm -f ./shrinkler