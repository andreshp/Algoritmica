#!/bin/bash

#################################################
# Algoritmica, Practica 1
# Medir el tiempo del algoritmo seleccion.
#################################################

# Script de bash que obtiene los datos para el algoritmo seleccion.

# Variables:
PROGRAMA=seleccion
SALIDA=./Datos/tiempo_seleccion.dat
MENSAJE_INICIO="Se inicia la ejecución del algoritmo seleccion:"
MENSAJE_FINAL="Fin de la ejecución. Se ha creado un fichero con los resultados.\n"

# Se genera el ejecutable con el algoritmo de ordenación seleccion:
g++ -o $PROGRAMA ./src/$PROGRAMA.cpp

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
    echo "$i `./$PROGRAMA $i`" >> $SALIDA
    i=$((i+$INCREMENTO))
done

# Se elimina el ejecutable:
rm $PROGRAMA

echo "$MENSAJE_FINAL"
