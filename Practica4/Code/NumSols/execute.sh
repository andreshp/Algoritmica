#!/bin/bash

##################################################################
# Algoritmica, Practica 4
# Cálculo del número de soluciones consideradas en los algoritmos
##################################################################

# Script que obtiene el número de soluciones visitadas por el
# algoritmo 3 y crea un archivo de texto comparando dicho valor
# con el número total de soluciones

#----------------- VARIABLES -----------------#

PROGRAMA=computeNumberSolutions.py

M=2

#----------------- PARAMETROS -----------------#

# Se comprueban los parametros.
if [[ $# != 1 ]]; then
    echo "Sintaxis: ./execute.sh <número de trabajos>"
else
    N=$1
    M_FIN=`echo $N / 2 | bc` # Se llega hasta la mitad
fi

mkdir -p ./Resultados

#----------------- EJECUCIÓN -----------------#

echo "Iniciando la ejecucion..."
printf "" > ./Resultados/resultados.txt

while [ $M -le $M_FIN ]
do
    echo "$M `echo print $M**$N | python` `python3 $PROGRAMA $M $N`" >> ./Resultados/resultados.txt
    M=$(($M+1))
done

echo "Fin de la ejecución. Se ha creado un fichero con los resultados."

# Se realiza la imagen
./plot.sh $N
