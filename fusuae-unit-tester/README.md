# FS-UAE unit tester
This directory contains some scripts to ease your FS-UAE testing.
The goal of FS-UAE testing is to run all m68k tests using FS-UAE Amiga emulator.

# Prerequisites
To use this script you will need:
- A Linux machine running docker (tested on version 19.3.2) and docker-compose (tested on version 1.29.2)
- An Amiga Operating system complete with ks image rom
- Linux 64 version of exe2adf by by Bonefish/Reality (https://www.pouet.net/prod.php?which=66640)

### How it works
Unit testing is performed by launching launch_test_a600_nofast.sh bash script.
This script is just a convenience for docker-compose but you can use directly docker-compose if you want.
Docker compose will build an Ubuntu20.04 customized image with fs-uae already installed.
When the container run a boot disk image adf file is built on the fly.
In the startup sequence are injected commands to execute AProcessing/run68fsuae script.
The run68fsuae script will execute all test will output on stdout the result.

### In practice
If you have all the ingredients listed in the prerequisites you can follow this small guide to get up an running.
- create a "shared" directory in your $HOME dir
- copy exe2adf-linux64bit file on it
- copy your ks files into it
- copy the following files taken from the C: partition of your Amiga:
  - assign
  - delete
  - execute
  - avail
  - version

Make sure you have read execute permission for this files.

Next open AProcessing /fusuae-unit-tester/docker-compose.yml file with your favourite text editor.
Inside fsuae-unit-tester: service section tweak your environment variables, this variables will be inkected in the final fs-uae configuration file.
Pay attention to KSROM section, here you must place the exact filename of your kickstart rom file.

Now it's time to build the docker image with

```
docker-compose build --no-cache
```

Once you have the image run it with
```
docker-compose run --rm  fsuae-unit-tester
```

or

```
./launch_test_a600_nofast.sh
```
