all:
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68000 -DINTERLACE=0 ./processingfill.s  -o ./processingfill.o -I/usr/local/amiga/os-include
	vasmm68k_mot -devpac -Fhunk -quiet -esc -m68080 -DVAMPIRE ./processingfill.s  -o ./processingfillvampire.o -I/usr/local/amiga/os-include
	