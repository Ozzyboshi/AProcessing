all:
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68000 -DSQRT_FAKE -DQ10_6_TABLE_LOOKUP -DQ4_12_TABLE_LOOKUP -DSQRT_BIG -DUSE_CLIPPING ./angleops.s  -o ./angleops.o
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68080 -DSQRT_FAKE -DQ10_6_TABLE_LOOKUP -DQ4_12_TABLE_LOOKUP -DSQRT_BIG -DVAMPIRE -DUSE_CLIPPING ./angleops.s  -o ./angleopsvampire.o
	m68k-amigaos-gcc  -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  angleops.c -o angleops angleops.o ../../testlibs/testlib.o 
	m68k-amigaos-gcc  -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  angleops.c -o angleopsvampire angleopsvampire.o ../../testlibs/testlib.o 
	chmod 777 angleops
	chmod 777 angleopsvampire

test: angleops
	vamos -v ./angleops 2>>/tmp/vamosinfo

copy: angleops
	scp -r ../angleops pi@10.0.0.4:/media/MAXTOR/upload/Vampire/

clean:
	rm -f *.o
	rm -f ./angleops