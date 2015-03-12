#!/bin/bash

#################################################
# Algoritmica, Practica 1
# Medir el tiempo del algoritmo fibonacci.
#################################################

# Script de bash que obtiene los datos para el algoritmo fibonacci.

# Variables:
PROGRAMA=fibonacci
SALIDA=./Datos/tiempo_fibonacci.dat
MENSAJE_INICIO="Se inicia la ejecución del algoritmo fibonacci:"
MENSAJE_FINAL="Fin de la ejecución. Se ha creado un fichero con los resultados.\n"

# Se genera el ejecutable con el algoritmo de ordenación fibonacci:
g++ -o $PROGRAMA ../src/$PROGRAMA.cpp

echo "$MENSAJE_INICIO"

# Variables:
INICIO=15
FIN=40
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
