#!/bin/bash

# Variables:
INICIO=15
FIN=40
INCREMENTO=1

i=$INICIO

PROGRAMA=genera-unimodal
SALIDA=./Datos
MENSAJE_INICIO="Se inicia la ejecución del generador de modulos:"
MENSAJE_FINAL="Fin de la ejecución. Se han creado los ficheros con los resultados.\n"

# Se genera el ejecutable con el algoritmo de ordenación fibonacci:
g++ -O$2 -o $PROGRAMA ./src/$PROGRAMA.cpp

echo "$MENSAJE_INICIO"

while [ $i -le $FIN ]
do
    printf "" > $SALIDA/$i.txt
    echo $SALIDA/$i.txt
    echo Ejecución tam = $i
    echo "$i `./$PROGRAMA $i`" > $SALIDA/$i.txt
    i=$((i+$INCREMENTO))
    
done

# Se elimina el ejecutable:
rm $PROGRAMA

echo "$MENSAJE_FINAL"
