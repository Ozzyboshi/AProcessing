all:
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68000 ./fillscanlinenoclip.s  -o ./fillscanlinenoclip.o
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68080 -DVAMPIRE ./fillscanlinenoclip.s  -o ./fillscanlinenoclipvampire.o
	m68k-amigaos-gcc -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  fillscanlinenoclip.c -o fillscanlinenoclip fillscanlinenoclip.o  ../../testlibs/testlib.o 
	m68k-amigaos-gcc -Wall -O1 -noixemul fillscanlinenoclip.c -o fillscanlinenoclipvampire fillscanlinenoclipvampire.o    ../../testlibs/testlib.o 

	chmod 777 fillscanlinenoclip
	chmod 777 fillscanlinenoclipvampire

test: fillscanlinenoclip
	vamos -v ./fillscanlinenoclip 2>>/tmp/vamosinfo

copy: fillscanlinenoclip
	scp -r ../fillscanlinenoclip pi@10.0.0.4:/media/MAXTOR/upload/Vampire/

clean:
	rm -f *.o
	rm -f ./fillscanlinenoclip
