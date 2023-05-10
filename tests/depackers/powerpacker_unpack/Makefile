all:
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68000 -DSQRT_FAKE -DSQRT_BIG -DUSE_CLIPPING ./powerpacker.s  -o ./powerpacker.o
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68080 -DSQRT_FAKE -DSQRT_BIG -DVAMPIRE -DUSE_CLIPPING ./powerpacker.s  -o ./powerpackervampire.o
	m68k-amigaos-gcc  -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  powerpacker.c -o powerpacker powerpacker.o ../../testlibs/testlib.o 
	m68k-amigaos-gcc  -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  powerpacker.c -o powerpackervampire powerpackervampire.o ../../testlibs/testlib.o 
	chmod 777 powerpacker
	chmod 777 powerpackervampire

test: powerpacker
	vamos -v ./powerpacker 2>>/tmp/vamosinfo

copy: powerpacker
	scp -r ../powerpacker pi@10.0.0.4:/media/MAXTOR/upload/Vampire/

clean:
	rm -f *.o
	rm -f ./powerpacker