all:
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68020 -DRTG -DRTG_640_300_3 ./drawingtestspointrtg.s  -o ./drawingtestspointrtg.o
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68080 -DRTG -DRTG_640_300_3 -DVAMPIRE ./drawingtestspointrtg.s  -o ./drawingtestspointrtgvampire.o
	m68k-amigaos-gcc -DRTG -DRTG_640_300_3 -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  drawingtestspointrtg.c -o drawingtestspointrtg drawingtestspointrtg.o ../../testlibs/testlib.o 
	m68k-amigaos-gcc -DRTG -DRTG_640_300_3 -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  drawingtestspointrtg.c -o drawingtestspointrtgvampire drawingtestspointrtgvampire.o ../../testlibs/testlib.o 
	chmod 777 drawingtestspointrtg
	chmod 777 drawingtestspointrtgvampire

test: drawingtestspointrtg
	vamos -v ./drawingtestspointrtg 2>>/tmp/vamosinfo

copy: drawingtestspointrtg
	scp -r ../drawingtestspointrtg pi@10.0.0.4:/media/MAXTOR/upload/Vampire/

clean:
	rm -f *.o
	rm -f ./drawingtestspointrtg
	rm -f ./drawingtestspointrtgvampire