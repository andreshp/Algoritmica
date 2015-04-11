#!/bin/bash

#################################################
# Algoritmica, Practica 2
# Medir el tiempo del algoritmo del problema 6.
#################################################

# Variables
PROGRAMA1=serieUniTrivial
PROGRAMA2=serieUni

INICIO=100000
INICIO2=1000000
FIN=1000000
FIN2=10000000
INCREMENTO=50000
INCREMENTO2=500000
REPETICIONES=1

# Compila el programa
g++ -o ./$PROGRAMA1 ./src/$PROGRAMA1.cpp
g++ -o ./$PROGRAMA2 ./src/$PROGRAMA2.cpp
chmod 777 ./$PROGRAMA1
chmod 777 ./$PROGRAMA2

# Se crean los directorios necesarios
mkdir -p data

i=$INICIO
j=$INICIO
k=$INICIO2

printf "" > ./data/resultTrivial.txt
printf "" > ./data/resultDivide.txt
printf "" > ./data/resultDivide2.txt

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

echo "Algoritmo Divide y Vencerás (mayor ejecución):"
while [ $k -le $FIN2 ]
do
    RESULTADO=`./$PROGRAMA2 $k $REPETICIONES` 
    SIZE=`echo $RESULTADO | cut -d':' -f2 | cut -d' ' -f2`
    TIME=`echo $RESULTADO | cut -d':' -f4 | cut -d' ' -f2`
    
    echo "$SIZE $TIME" >> ./data/resultDivide2.txt
    echo "Ejecución para $SIZE componentes..."
    k=$((k+$INCREMENTO2))    
done           
           
rm ./$PROGRAMA2 ./$PROGRAMA1

