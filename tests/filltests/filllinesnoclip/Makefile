all:
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68000 ./filllinesnoclip.s  -o ./filllinesnoclip.o
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68080 -DVAMPIRE ./filllinesnoclip.s  -o ./filllinesnoclipvampire.o
	m68k-amigaos-gcc  -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  filllinesnoclip.c -o filllinesnoclip filllinesnoclip.o ../../testlibs/testlib.o 
	m68k-amigaos-gcc  -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  filllinesnoclip.c -o filllinesnoclipvampire filllinesnoclipvampire.o ../../testlibs/testlib.o 
	chmod 777 filllinesnoclip
	chmod 777 filllinesnoclipvampire

test: filllinesnoclip
	vamos -v ./filllinesnoclip 2>>/tmp/vamosinfo

copy: filllinesnoclip
	scp -r ../filllinesnoclip pi@10.0.0.4:/media/MAXTOR/upload/Vampire/

clean:
	rm -f *.o
	rm -f ./filllinesnoclip
	rm -f ./filllinesnoclipvampire