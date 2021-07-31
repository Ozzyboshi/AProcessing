#!/bin/bash

set -e 

rm -f /tmp/vamosinfo

cd testlibs && make clean && make && cd ..

cd filltests/filllines && make clean && make && make test && cd .. && cd ..
cd filltests/fillscanline && make clean && make && make test && cd .. && cd ..
cd filltests/fillpolygon && make clean && make && make test && cd .. && cd ..
cd filltests/filltransformations && make clean && make && make test && cd .. && cd ..
cd filltests/filltransformations3d && make clean && make && make test && cd .. && cd ..
cd matrixtests/basic && make clean && make && make test && cd .. && cd ..
cd matrixtests/multiplications && make clean && make && make test && cd .. && cd ..
cd drawingtests/points && make clean && make && make test && cd .. && cd ..
cd drawingtests/filledpolygons && make clean && make && make test && cd .. && cd ..

echo "Result total cycles: $(cat /tmp/vamosinfo  | grep cycles | awk '{ print $NF }' | awk '{s+=$1} END {printf "%.0f", s}' )"
