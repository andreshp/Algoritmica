#!/bin/bash

#################################################
# Algoritmica, Practica 2
# Medir el tiempo del algoritmo del problema 6.
#################################################

# Variables
PROGRAMA1=serieUniTrivial
PROGRAMA2=serieUni

INICIO=100000
FIN=1000000
INCREMENTO=50000
REPETICIONES=10000

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

echo "Algoritmo Lineal:"
while [ $j -le $FIN ]
do
    RESULTADO=`./$PROGRAMA1 $j $REPETICIONES` 
    SIZE=`echo $RESULTADO | cut -d':' -f2 | cut -d' ' -f2`
    TIME=`echo $RESULTADO | cut -d':' -f4 | cut -d' ' -f2`
    
    echo "$SIZE $TIME" >> ./data/resultTrivial.txt
    echo "Ejecución para $SIZE componentes..."
    j=$((j+$INCREMENTO))    
done

echo "Algoritmo Divide y Vencerás:"
while [ $i -le $FIN ]
do
    RESULTADO=`./$PROGRAMA2 $i $REPETICIONES` 
    SIZE=`echo $RESULTADO | cut -d':' -f2 | cut -d' ' -f2`
    TIME=`echo $RESULTADO | cut -d':' -f4 | cut -d' ' -f2`
    
    echo "$SIZE $TIME" >> ./data/resultDivide.txt
    echo "Ejecución para $SIZE componentes..."
    i=$((i+$INCREMENTO))    
done           
           
rm ./$PROGRAMA2 ./$PROGRAMA1

