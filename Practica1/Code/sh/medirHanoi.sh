#!/bin/bash

#################################################
# Algoritmica, Practica 1
# Medir el tiempo del algoritmo hanoi.
#################################################

# Script de bash que obtiene los datos para el algoritmo hanoi.

# Variables:
PROGRAMA=hanoi
SALIDA=./Datos/tiempo_hanoi.dat
MENSAJE_INICIO="Se inicia la ejecución del algoritmo hanoi:"
MENSAJE_FINAL="Fin de la ejecución. Se ha creado un fichero con los resultados.\n"

# Se genera el ejecutable con el algoritmo de ordenación hanoi:
g++ -O$2 -o $PROGRAMA ./src/$PROGRAMA.cpp

echo "$MENSAJE_INICIO"

# Variables:
INICIO=5
FIN=30
INCREMENTO=1

i=$INICIO
printf "" > $SALIDA
while [ $i -le $FIN ]
do
    echo Ejecución tam = $i
    echo "$i `./$PROGRAMA $i`" >> $SALIDA
    i=$((i+$INCREMENTO))
done

# Se elimina el ejecutable:
rm $PROGRAMA

echo "$MENSAJE_FINAL"