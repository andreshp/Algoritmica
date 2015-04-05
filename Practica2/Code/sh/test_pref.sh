#!/bin/bash

g++ -o./preferences ./src/preferences.cpp

./preferences ./test/easytest.txt           #6
./preferences ./test/TestCase1.txt          #28
./preferences ./test/TestCase2.txt          #110          
./preferences ./test/TestCase3.txt          #606
./preferences ./test/INPUT500.txt           #62248
./preferences ./test/INPUT1000.txt          #261237
./preferences ./test/INPUT2000.txt          #1001782
./preferences ./test/INPUT5000.txt          #6243161
./preferences ./test/INPUT10000.txt         #24970965
./preferences ./test/IntegerArray.txt       #2407905288

rm ./preferences

