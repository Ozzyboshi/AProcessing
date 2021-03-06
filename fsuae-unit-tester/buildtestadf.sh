#!/bin/bash

ADFDIR=/tmp/adf

mkdir -p "$ADFDIR"
mkdir -p "$ADFDIR"/C
mkdir -p "$ADFDIR"/S

echo "echo start > pc:inizio" > "$ADFDIR"/S/Startup-Sequence
echo "assign tests: pc:AProcessing/tests" >> "$ADFDIR"/S/Startup-Sequence
echo "tests:" >> "$ADFDIR"/S/Startup-Sequence
echo "execute run68fsuae" >> "$ADFDIR"/S/Startup-Sequence
echo "version > pc:testenvironment.txt" >> "$ADFDIR"/S/Startup-Sequence
echo "avail >> pc:testenvironment.txt " >> "$ADFDIR"/S/Startup-Sequence
echo "echo end > pc:fine" >> "$ADFDIR"/S/Startup-Sequence

cp /tmp/shared/dir /tmp/shared/execute /tmp/shared/delete /tmp/shared/assign /tmp/shared/version /tmp/shared/avail "$ADFDIR"/C

/tmp/shared/exe2adf-linux64bit -d "$ADFDIR"/ --label testfloppy -a /tmp/testfloppy.adf