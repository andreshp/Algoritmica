#!/bin/bash


PROGRAMA=$1
SALIDA=./Datos/tiempo_$1_Trabajadores.dat
MENSAJE_INICIO="Se inicia la ejecución del algoritmo $1:"
MENSAJE_FINAL="Fin de la ejecución. Se ha creado un fichero con los resultados.\n"
NUM_TRABAJADORES=3

echo "$MENSAJE_INICIO"

# Variables:
INICIO=1
FIN=15
INCREMENTO=1

i=$INICIO
printf "" > $SALIDA
while [ $i -le $FIN ]
do
    echo Ejecución tam = $i
    echo "$i `./$PROGRAMA $i $NUM_TRABAJADORES`" >> $SALIDA
    i=$((i+$INCREMENTO))
done

echo "$MENSAJE_FINAL"