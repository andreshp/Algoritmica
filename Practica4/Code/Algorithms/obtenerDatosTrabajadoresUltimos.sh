#!/bin/bash


PROGRAMA=$1
SALIDA=./Datos/tiempo_$1_Ultimo_Trabajadores.dat
MENSAJE_INICIO="Se inicia la ejecución del algoritmo $1:"
MENSAJE_FINAL="Fin de la ejecución. Se ha creado un fichero con los resultados."
NUM_TRABAJADORES=10

echo "$MENSAJE_INICIO"

# Variables:
INICIO=10
FIN=22
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