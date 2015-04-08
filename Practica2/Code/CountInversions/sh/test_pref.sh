#!/bin/bash

g++ -o./preferences ./src/preferences.cpp
g++ -o ./preferencesBuble ./src/preferencesBuble.cpp
g++ -o ./preferencesFor ./src/preferencesFor.cpp

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

./preferencesBuble ./test/easytest.txt           #6
./preferencesBuble ./test/TestCase1.txt          #28
./preferencesBuble ./test/TestCase2.txt          #110          
./preferencesBuble ./test/TestCase3.txt          #606
./preferencesBuble ./test/INPUT500.txt           #62248
./preferencesBuble ./test/INPUT1000.txt          #261237
./preferencesBuble ./test/INPUT2000.txt          #1001782
./preferencesBuble ./test/INPUT5000.txt          #6243161
./preferencesBuble ./test/INPUT10000.txt         #24970965
./preferencesBuble ./test/IntegerArray.txt       #2407905288

./preferencesFor ./test/easytest.txt           #6
./preferencesFor ./test/TestCase1.txt          #28
./preferencesFor ./test/TestCase2.txt          #110          
./preferencesFor ./test/TestCase3.txt          #606
./preferencesFor ./test/INPUT500.txt           #62248
./preferencesFor ./test/INPUT1000.txt          #261237
./preferencesFor ./test/INPUT2000.txt          #1001782
./preferencesFor ./test/INPUT5000.txt          #6243161
./preferencesFor ./test/INPUT10000.txt         #24970965
./preferencesFor ./test/IntegerArray.txt       #2407905288

rm ./preferences ./preferencesFor ./preferencesBuble

