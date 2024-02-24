ASM = vasmm68k_mot
CC = m68k-amigaos-gcc
ASMFLAGS = -devpac -Fhunk -quiet -esc -m68000
ASMFLAGSVAMPIRE = -devpac -Fhunk -quiet -esc -m68080 -DVAMPIRE 
CFLAGS = -ffast-math -m68000 -msoft-float -noixemul -fomit-frame-pointer
CFLAGSVAMPIRE = -ffast-math -m68080 -mhard-float -noixemul -fomit-frame-pointer
LIBS = ../../testlibs/testlib.o
SRC = math_sin_256.s
CSRC = $(SRC:.s=.c)
OBJ = $(SRC:.s=.o)
EXEC = $(SRC:.s=)
EXECVAMPIRE = $(SRC:.s=vampire)
OBJVAMPIRE = $(SRC:.s=vampire.o)


all: 
	$(ASM) $(ASMFLAGS) $(SRC) -o $(OBJ)
	$(ASM) $(ASMFLAGSVAMPIRE) $(SRC) -o $(OBJVAMPIRE)
	$(CC) $(CFLAGS) $(CSRC) -o $(EXEC) $(OBJ) $(LIBS)
	$(CC) $(CFLAGSVAMPIRE) $(CSRC) -o $(EXECVAMPIRE) $(OBJVAMPIRE) $(LIBS)

test:
	vamos -v $(EXEC) 2>>/tmp/vamosinfo

copy:
	scp -r ..$(EXEC) pi@10.0.0.4:/media/MAXTOR/upload/Vampire/

clean:
	rm -f *.o
	rm -f ./$(EXEC)
	rm -f ./$(EXECVAMPIRE)