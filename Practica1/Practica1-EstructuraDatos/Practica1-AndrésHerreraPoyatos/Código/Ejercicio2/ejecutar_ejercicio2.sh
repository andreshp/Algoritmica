#!/bin/bash

#################################################
# Autor: Andrés Herrera Poyatos
# Estructura de Datos, Práctica 1, Ejercicio 2 
#################################################

# Script de bash que genera una imagen con los resultados del algoritmo burbuja
# para arrays de diferentes tamaños.

# Variables:
PROGRAMA=ordenacion_burbuja
SALIDA=./Datos/tiempo_burbuja.dat
MENSAJE_INICIO="Se inicia la ejecución del ejercicio 2:"
MENSAJE_FINAL="Fin de la ejecución del ejercicio 2. Se ha creado una imagen y un fichero con los resultados.\n"

# Se genera el ejecutable con el algoritmo de ordenación burbuja:
g++ -o $PROGRAMA $PROGRAMA.cpp

echo "$MENSAJE_INICIO"

# Se genera un fichero con los datos obtenidos llamando
# al Script ejecuciones.sh con los parámetros oportunos:
./ejecuciones.sh  $PROGRAMA  $SALIDA

# Se elimina el ejecutable:
rm $PROGRAMA

# Se crea un archivo .png con la imagen resultante:
./plot.sh

echo "$MENSAJE_FINAL"