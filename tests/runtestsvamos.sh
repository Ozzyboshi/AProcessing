#!/bin/bash

cd filltests/filllines && make clean && make && make test && cd .. && cd ..
cd filltests/fillscanline && make clean && make && make test && cd .. && cd ..
cd filltests/fillpolygon && make clean && make && make test && cd .. && cd ..
cd matrixtests/basic && make clean && make && make test && cd .. && cd ..
