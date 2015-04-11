#!/bin/bash

#################################################
# Algoritmica, Practica 2
# Generar tests para el problema 6
#################################################

# Variables:
INICIO=100000
FIN=10000000
INCREMENTO=100000

PROGRAMA=genera-unimodal
SALIDA=./Datos
MENSAJE_INICIO="Se inicia la ejecución del generador de modulos:"
MENSAJE_FINAL="Fin de la ejecución. Se han creado los ficheros con los resultados.\n"

# Se crea la carpeta test en caso de ser necesario
mkdir -p test

# Se genera el ejecutable con el algoritmo de ordenación fibonacci:
g++ -O$2 -o $PROGRAMA ./src/$PROGRAMA.cpp

echo "$MENSAJE_INICIO"

i=$INICIO
while [ $i -le $FIN ]
do
    printf "" > $SALIDA/$i.txt
    echo $SALIDA/$i.txt
    echo Ejecución tam = $i
    echo "`./$PROGRAMA $i`" > $SALIDA/$i.txt
    i=$((i+$INCREMENTO))
    
done

# Se elimina el ejecutable:
rm $PROGRAMA

echo "$MENSAJE_FINAL"
