#!/bin/bash

#################################################
# Autor: Andrés Herrera Poyatos
# Estructura de Datos, Práctica 1, Ejercicio 8
#################################################

# Script de bash que genera imágenes con los resultados de diversos
# algoritmos de ordenación de tiempo n lg n para arrays de diferentes tamaños.

# Variables:
PROGRAMA1=mergesort
PROGRAMA2=quicksort
PROGRAMA3=heapsort
PROGRAMA4=sort
SALIDA1=./Datos/tiempo_mergesort.dat
SALIDA2=./Datos/tiempo_quicksort.dat
SALIDA3=./Datos/tiempo_heapsort.dat
SALIDA4=./Datos/tiempo_sort.dat

MENSAJE_INICIO="Se inicia la ejecución del ejercicio 8, apartado c):"
MENSAJE_FINAL="Fin de la ejecución del ejercicio 8, apartado c). Se ha creado las imagenes y los ficheros con los resultados correspondientes."

# Se genera el ejecutable con el algoritmo de ordenación burbuja:
g++ -o $PROGRAMA1 $PROGRAMA1.cpp
g++ -o $PROGRAMA2 $PROGRAMA2.cpp
g++ -o $PROGRAMA3 $PROGRAMA3.cpp
g++ -o $PROGRAMA4 $PROGRAMA4.cpp

echo "$MENSAJE_INICIO"

# Se genera un fichero con los datos obtenidos llamando
# al Script ejecuciones.sh con los parámetros oportunos:
#./ejecuciones.sh  $PROGRAMA1  $SALIDA1
./ejecuciones_2.sh  $PROGRAMA1  $SALIDA1 "20"
./ejecuciones_1.sh  $PROGRAMA2  $SALIDA2
./ejecuciones_1.sh  $PROGRAMA3  $SALIDA3
./ejecuciones_1.sh  $PROGRAMA4  $SALIDA4


# Se elimina el ejecutable:
rm $PROGRAMA1
rm $PROGRAMA2
rm $PROGRAMA3
rm $PROGRAMA4

# Se crea un archivo .png con las imágenes resultantes:
./plot_3.sh

echo "$MENSAJE_FINAL"