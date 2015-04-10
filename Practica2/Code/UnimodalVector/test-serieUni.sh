#!/bin/bash

#################################################
# Algoritmica, Practica 2
# Medir el tiempo del algoritmo del problema 6.
#################################################

# Variables
PROGRAMA1=serieUniTrivial
PROGRAMA2=serieUni

INICIO=10000
FIN=1000000
INCREMENTO=10000
REPETICIONES=10

# Compila el programa
g++ -o ./$PROGRAMA1 ./src/$PROGRAMA1.cpp
g++ -o ./$PROGRAMA2 ./src/$PROGRAMA2.cpp
chmod 777 ./$PROGRAMA1
chmod 777 ./$PROGRAMA2

# Se crean los directorios necesarios
mkdir -p data

i=$INICIO
j=$INICIO

printf "" > ./data/resultTrivial.txt
printf "" > ./data/resultDivide.txt

while [ $i -le $FIN ]
do
    RESULTADO=`./$PROGRAMA2 $i $REPETICIONES` 
    SIZE=`echo $RESULTADO | cut -d':' -f2 | cut -d' ' -f2`
    TIME=`echo $RESULTADO | cut -d':' -f4 | cut -d' ' -f2`
    
    echo "$SIZE $TIME" >> ./data/resultDivide.txt
    i=$((i+$INCREMENTO))    
done           

while [ $j -le $FIN ]
do
    RESULTADO2=`./$PROGRAMA1 $i $REPETICIONES` 
    SIZE2=`echo $RESULTADO2 | cut -d':' -f2 | cut -d' ' -f2`
    TIME2=`echo $RESULTADO2 | cut -d':' -f4 | cut -d' ' -f2`
    
    echo "$SIZE2 $TIME2" >> ./data/resultTrivial.txt
    j=$((j+$INCREMENTO))    
done
           
rm ./$PROGRAMA2 ./$PROGRAMA1

