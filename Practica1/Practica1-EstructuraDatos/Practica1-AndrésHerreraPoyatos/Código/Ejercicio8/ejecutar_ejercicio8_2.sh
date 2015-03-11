#!/bin/bash

#################################################
# Autor: Andrés Herrera Poyatos
# Estructura de Datos, Práctica 1, Ejercicio 8
#################################################

# Script de bash que genera imágenes con los resultados de diversos
# valores de UMBRAL_MS para el mergesort.

# Variables:
PROGRAMA1=mergesort
SALIDA1=./Datos/tiempo_mergesort1.dat
SALIDA2=./Datos/tiempo_mergesort2.dat
SALIDA3=./Datos/tiempo_mergesort3.dat
SALIDA4=./Datos/tiempo_mergesort4.dat
SALIDA5=./Datos/tiempo_mergesort5.dat
SALIDA6=./Datos/tiempo_mergesort6.dat

MENSAJE_INICIO="Se inicia la ejecución del ejercicio 8, apartado c):"
MENSAJE_FINAL="Fin de la ejecución del ejercicio 8, apartado c). Se ha creado las imagenes y los ficheros con los resultados correspondientes."

# Se genera el ejecutable con el algoritmo de ordenación burbuja:
g++ -o $PROGRAMA1 $PROGRAMA1.cpp

echo "$MENSAJE_INICIO"

# Se genera un fichero con los datos obtenidos llamando
# al Script ejecuciones.sh con los parámetros oportunos:
./ejecuciones_2.sh  $PROGRAMA1  $SALIDA1  "2"
./ejecuciones_2.sh  $PROGRAMA1  $SALIDA2  "20"
./ejecuciones_2.sh  $PROGRAMA1  $SALIDA3  "40"
./ejecuciones_2.sh  $PROGRAMA1  $SALIDA4  "60"
./ejecuciones_2.sh  $PROGRAMA1  $SALIDA5  "80"
./ejecuciones_2.sh  $PROGRAMA1  $SALIDA6  "100"


# Se elimina el ejecutable:
rm $PROGRAMA1

# Se crea un archivo .png con las imágenes resultantes:
./plot_2.sh

echo "$MENSAJE_FINAL"