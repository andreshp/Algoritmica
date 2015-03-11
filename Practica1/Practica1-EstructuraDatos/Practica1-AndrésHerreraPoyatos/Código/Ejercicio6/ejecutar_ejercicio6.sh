#!/bin/bash

#################################################
# Autor: Andrés Herrera Poyatos
# Estructura de Datos, Práctica 1, Ejercicio 6
#################################################

# Script de bash que genera una imagen con los resultados del algoritmo burbuja
# para arrays de diferentes tamaños.

# Variables:
PROGRAMA1=ordenacion_burbuja1
PROGRAMA2=ordenacion_burbuja2
SALIDA1=./Datos/tiempo_burbuja1.dat
SALIDA2=./Datos/tiempo_burbuja2.dat
MENSAJE_INICIO="Se inicia la ejecución del ejercicio 6:"
MENSAJE_FINAL="Fin de la ejecución del ejercicio 6. Se ha creado las imagenes y los ficheros con los resultados correspondientes."

# Se genera el ejecutable con el algoritmo de ordenación burbuja:
g++ -o $PROGRAMA1 $PROGRAMA1.cpp
g++ -O3 -o $PROGRAMA2 $PROGRAMA2.cpp

echo "$MENSAJE_INICIO"

# Se genera un fichero con los datos obtenidos llamando
# al Script ejecuciones.sh con los parámetros oportunos:
./ejecuciones.sh  $PROGRAMA1  $SALIDA1
./ejecuciones.sh  $PROGRAMA2  $SALIDA2

# Se elimina el ejecutable:
rm $PROGRAMA1
rm $PROGRAMA2

# Se crea un archivo .png con las imágenes resultantes:
./plot.sh

echo "$MENSAJE_FINAL"