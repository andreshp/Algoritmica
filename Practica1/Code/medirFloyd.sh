#!/bin/bash

#################################################
# Algoritmica, Practica 1
# Medir el tiempo del algoritmo floyd.
#################################################

# Script de bash que obtiene los datos para el algoritmo floyd.

# Variables:
PROGRAMA=floyd
SALIDA=./Datos/tiempo_floyd.dat
MENSAJE_INICIO="Se inicia la ejecución del algoritmo floyd:"
MENSAJE_FINAL="Fin de la ejecución. Se ha creado un fichero con los resultados.\n"

# Se genera el ejecutable con el algoritmo de ordenación floyd:
g++ -o $PROGRAMA ./src/$PROGRAMA.cpp

echo "$MENSAJE_INICIO"

# Variables:
INICIO=32
FIN=800
INCREMENTO=32

i=$INICIO
echo > $SALIDA
while [ $i -le $FIN ]
do
    echo Ejecución tam = $i
    echo "$i `./$PROGRAMA $i`" >> $SALIDA
    i=$((i+$INCREMENTO))
done

# Se elimina el ejecutable:
rm $PROGRAMA

echo "$MENSAJE_FINAL"