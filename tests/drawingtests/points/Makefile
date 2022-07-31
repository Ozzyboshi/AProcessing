all:
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68000 ./drawingtestspoint.s  -o ./drawingtestspoint.o
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68080 -DVAMPIRE ./drawingtestspoint.s  -o ./drawingtestspointvampire.o
	m68k-amigaos-gcc  -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  drawingtestspoint.c -o drawingtestspoint drawingtestspoint.o ../../testlibs/testlib.o 
	m68k-amigaos-gcc  -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  drawingtestspoint.c -o drawingtestspointvampire drawingtestspointvampire.o ../../testlibs/testlib.o 
	chmod 777 drawingtestspoint
	chmod 777 drawingtestspointvampire

test: drawingtestspoint
	vamos -v ./drawingtestspoint 2>>/tmp/vamosinfo

copy: drawingtestspoint
	scp -r ../drawingtestspoint pi@10.0.0.4:/media/MAXTOR/upload/Vampire/

clean:
	rm -f *.o
	rm -f ./drawingtestspoint
	rm -f ./drawingtestspointvampire