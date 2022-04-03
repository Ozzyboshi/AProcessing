#!/bin/bash

rm -f /tmp/shared/PC/inizio*
rm -f /tmp/shared/PC/fine*
rm -f /tmp/shared/PC/testenvironment*

if [ -z "$MODEL" ]
then
      echo "MODEL is empty"
      exit 1
else
      echo "Amiga model is $MODEL"
fi

if [ -z "$CHIP" ]
then
      echo "CHIP is empty"
      exit 1
else
      echo "Amiga chip ram is $CHIP"
fi

if [ -z "$FAST" ]
then
      echo "FAST is empty"
      exit 1
else
      echo "Amiga fast ram is $FAST"
fi

if [ -z "$KSROM" ]
then
      echo "KSROM is empty"
      exit 1
else
      echo "Amiga kickstart is $KSROM"
fi
/usr/local/bin/buildtestadf.sh 1>/dev/null 2>/dev/null
tpage --define model="$MODEL" --define chip="$CHIP" --define fast="$FAST" --define ksrom="$KSROM" ./fsconf.fs-uae.tt > fsconf"$MODEL".fs-uae
xvfb-run -s '-screen 0 640x480x24' fs-uae ./fsconf"$MODEL".fs-uae 1>/dev/null 2>/dev/null &

until [ -f /tmp/shared/PC/fine ]
do
     echo "waiting for tests to finish..."
     sleep 10
done
echo "Test Configuration:"
cat /tmp/shared/PC/testenvironment.txt
echo
echo "Results:"
cat /tmp/shared/PC/AProcessing/tests/results.txt 
exit