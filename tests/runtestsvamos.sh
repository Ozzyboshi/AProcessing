#!/bin/bash

set -e 

rm -f /tmp/vamosinfo

cd testlibs && make clean && make && cd ..

cd filltests/filllines && make clean && make && make test && cd .. && cd ..
cd filltests/filllinesnoclip && make clean && make && make test && cd .. && cd ..
cd filltests/fillscanline && make clean && make && make test && cd .. && cd ..
cd filltests/fillscanlinenoclip && make clean && make && make test && cd .. && cd ..
cd filltests/fillpolygon && make clean && make && make test && cd .. && cd ..
cd filltests/filltransformations && make clean && make && make test && cd .. && cd ..
cd filltests/filltransformations3d && make clean && make && make test && cd .. && cd ..
cd matrixtests/basic && make clean && make && make test && cd .. && cd ..
cd matrixtests/multiplications && make clean && make && make test && cd .. && cd ..
cd drawingtests/points && make clean && make && make test && cd .. && cd ..
cd drawingtests/pointsrtg_640_400_3 && make clean && make && make test && cd .. && cd ..
cd drawingtests/filledpolygons && make clean && make && make test && cd .. && cd ..
cd drawingtests/filledpolygons3d && make clean && make && make test && cd .. && cd ..
cd vectors/simpleops && make clean && make && make test && cd .. && cd ..
cd vectors/angles && make clean && make && make test && cd .. && cd ..
cd precalc/simpleops && make clean && make && make test && cd .. && cd ..
cd blittertests/lines && make clean && make && cd .. && cd ..
cd blittertests/filllines && make clean && make && cd .. && cd ..
cd blittertests/drawpolygon && make clean && make && cd .. && cd ..
cd math/simpleops && make clean && make && make test && cd .. && cd ..
cd depackers/powerpacker_unpack && make clean && make && make test && cd .. && cd ..
cd depackers/shrinkler_unpack && make clean && make && make test && cd .. && cd ..
cd depackers/lz4_unpack && make clean && make && make test && cd .. && cd ..
cd depackers/cranker_unpack && make clean && make && make test && cd .. && cd ..

echo "Result total cycles: $(cat /tmp/vamosinfo  | grep cycles | awk '{ print $NF }' | awk '{s+=$1} END {printf "%.0f", s}' )"
