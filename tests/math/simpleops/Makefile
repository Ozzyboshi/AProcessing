all:
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68000 -DSQRT_FAKE -DQ10_6_TABLE_LOOKUP -DQ4_12_TABLE_LOOKUP -DSQRT_BIG -DUSE_CLIPPING ./math.s  -o ./math.o
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68080 -DSQRT_FAKE -DQ10_6_TABLE_LOOKUP -DQ4_12_TABLE_LOOKUP -DSQRT_BIG -DVAMPIRE -DUSE_CLIPPING ./math.s  -o ./mathvampire.o
	m68k-amigaos-gcc  -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  math.c -o math math.o ../../testlibs/testlib.o 
	m68k-amigaos-gcc  -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  math.c -o mathvampire mathvampire.o ../../testlibs/testlib.o 
	chmod 777 math
	chmod 777 mathvampire

test: math
	vamos -v ./math 2>>/tmp/vamosinfo

copy: math
	scp -r ../math pi@10.0.0.4:/media/MAXTOR/upload/Vampire/

clean:
	rm -f *.o
	rm -f ./math