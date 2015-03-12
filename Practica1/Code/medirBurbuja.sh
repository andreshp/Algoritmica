#!/bin/bash

#################################################
# Algoritmica, Practica 1
# Medir el tiempo del algoritmo burbuja.
#################################################

# Script de bash que obtiene los datos para el algoritmo burbuja.

# Variables:
PROGRAMA=burbuja
SALIDA=./Datos/tiempo_burbuja.dat
MENSAJE_INICIO="Se inicia la ejecución del algoritmo burbuja:"
MENSAJE_FINAL="Fin de la ejecución. Se ha creado un fichero con los resultados.\n"

# Se genera el ejecutable con el algoritmo de ordenación burbuja:
g++ -o $PROGRAMA $PROGRAMA.cpp

echo "$MENSAJE_INICIO"

# Variables:
INICIO=1000
FIN=25000
INCREMENTO=1000

i=$INICIO
echo > $SALIDA
while [ $i -le $FIN ]
do
    echo Ejecución tam = $i
    echo `./$PROGRAMA $i` >> $SALIDA
    i=$((i+$INCREMENTO))
done

./plot.sh

# Se elimina el ejecutable:
rm $PROGRAMA

echo "$MENSAJE_FINAL"
START=$(date +%s.%N)
command
END=$(date +%s.%N)
DIFF=$(echo "$END - $START" | bc)