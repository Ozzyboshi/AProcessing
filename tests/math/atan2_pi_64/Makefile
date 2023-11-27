all:
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68000 -DSQRT_FAKE -DQ10_6_TABLE_LOOKUP -DQ4_12_TABLE_LOOKUP -DSQRT_BIG -DUSE_CLIPPING ./math_atan2_pi_64.s  -o ./math_atan2_pi_64.o
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68080 -DSQRT_FAKE -DQ10_6_TABLE_LOOKUP -DQ4_12_TABLE_LOOKUP -DSQRT_BIG -DVAMPIRE -DUSE_CLIPPING ./math_atan2_pi_64.s  -o ./math_atan2_pi_64vampire.o
	m68k-amigaos-gcc  -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  math_atan2_pi_64.c -o math_atan2_pi_64 math_atan2_pi_64.o ../../testlibs/testlib.o 
	m68k-amigaos-gcc  -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer  -Os -Wall  math_atan2_pi_64.c -o math_atan2_pi_64vampire math_atan2_pi_64vampire.o ../../testlibs/testlib.o 
	chmod 777 math_atan2_pi_64
	chmod 777 math_atan2_pi_64vampire

test: math_atan2_pi_64
	vamos -v ./math_atan2_pi_64 2>>/tmp/vamosinfo

copy: math_atan2_pi_64
	scp -r ../math_atan2_pi_64 pi@10.0.0.4:/media/MAXTOR/upload/Vampire/

clean:
	rm -f *.o
	rm -f ./math_atan2_pi_64