# AProcessing

AProcessing is a set of routines meant for drawing on a Classic Amiga
AProcessing is a mixed C/Asm code, the C part is only for unit testing, all the actual libraries are 100% M68K ASM code for max performance.
Right know only planar drawing is supported but in the future I am planning to also support Chunky RTG modes with lib CyberGraphix.

### Structure of the repository
The repository contains the following directorties:
- docs : documentation docs: see [docs/README](docs/README.md) for instructions documentation.
- fusuae-unit-tester : this is meant for unit testing with fs uae, you could achieve the same results just copying the whole test directory into your real amiga. Inside this directory you will find a docker-compose.yml file that will build a docker image with fs uae and all the thing you need to run the tests. Of course you will have to add your own kickstart and SO files, more details about this in the [README](https://github.com/Ozzyboshi/AProcessing/blob/main/fusuae-unit-tester/README.md "README") file.
- libs : where all the libs are located, you will have to include them in your project. Tested with vasm and Devpac.
- tests : all the automated tests categorized by topic. Each subdirectory contains an "expected" subdirectory with contains the binary ram representation that each test is supposed to produce. The tests/testlibs is a special directory that contains the program to run the test.

### How to compile the tests
In order to compile the whole prokect you will need [Bebbo gcc](https://github.com/bebbo/amiga-gcc), [vasm](http://sun.hasenbraten.de/vasm/) and [vamos](https://github.com/cnvogelg/amitools/blob/master/docs/vamos.md) installed and in path on your GNU/Linux machine.
If you dont have it you can use my Docker image:

```
git clone https://github.com/Ozzyboshi/bebbo-amiga-gcc
cd bebbo-amiga-gcc/
docker build . --tag bebbo-amiga-gcc
```

now clone the AProcessing repo somewhere, if you used the docker image link it with -v docker option, for example:
```
docker run -v /home/ozzy/AProcessing:/data  -it --name AProcessing bebbo-amiga-gcc /bin/bash
```
At this point just cd into tests directory and run ./runtestsvamos.sh, this script will execute the make in all subdirectories, compile the unit tester software, create the test executables and run vamos to compare the results with the expected files.

if you prefer the docker version:
```
docker run --rm  -v /home/ozzy/AProcessing:/data -w /data/tests  -it --name AProcessing bebbo-amiga-gcc ./runtestsvamos.sh
```

The runtestsvamos will go also into test/blittertest directory to produce the test executables but wont run the test with vamos since vamos is unable to emulate Amiga blitter co-processor. If you want to run this type of test you will have to use fs-uae (see fusuae-unit-tester directory) or a real Amiga.

Once the runtestsvamos is done you can just copy all the test directory into your real Amigas and run "run68" and "runvampire" executable.
The first one is meant for 68k Amigas, the second one used the AMMX instructions that are ONLY available for the Apollo Team cards, if you try to run elsewhere it will crash.

