all:
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68000 -DSQRT_FAKE -DSQRT_BIG -DUSE_CLIPPING ./cranker.s  -o ./cranker.o
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68080 -DSQRT_FAKE -DSQRT_BIG -DVAMPIRE -DUSE_CLIPPING ./cranker.s  -o ./crankervampire.o
	m68k-amigaos-gcc  -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  cranker.c -o cranker cranker.o ../../testlibs/testlib.o 
	m68k-amigaos-gcc  -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  cranker.c -o crankervampire crankervampire.o ../../testlibs/testlib.o 
	chmod 777 cranker
	chmod 777 crankervampire

test: cranker
	vamos -v ./cranker 2>>/tmp/vamosinfo

copy: cranker
	scp -r ../cranker pi@10.0.0.4:/media/MAXTOR/upload/Vampire/

clean:
	rm -f *.o
	rm -f ./cranker