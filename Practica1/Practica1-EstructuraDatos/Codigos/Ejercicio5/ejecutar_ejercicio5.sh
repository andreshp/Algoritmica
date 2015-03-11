#!/bin/bash

#################################################
# Autor: Andrés Herrera Poyatos
# Estructura de Datos, Práctica 1, Ejercicio 5
#################################################

# Script de bash que genera una imagen con los resultados del algoritmo burbuja
# para arrays de diferentes tamaños.

# Variables:
PROGRAMA=ordenacion_burbuja
PROGRAMA1=ordenacion_burbuja1
PROGRAMA2=ordenacion_burbuja2
PROGRAMA3=ordenacion_burbuja3
SALIDA=./Datos/tiempo_burbuja.dat
SALIDA1=./Datos/tiempo_burbuja1.dat
SALIDA2=./Datos/tiempo_burbuja2.dat
SALIDA3=./Datos/tiempo_burbuja3.dat
MENSAJE_INICIO="Se inicia la ejecución del ejercicio 5:"
MENSAJE_FINAL="Fin de la ejecución del ejercicio 5. Se ha creado las imagenes y los ficheros con los resultados correspondientes."

# Se genera el ejecutable con el algoritmo de ordenación burbuja:
g++ -o $PROGRAMA $PROGRAMA.cpp
g++ -o $PROGRAMA1 $PROGRAMA1.cpp
g++ -o $PROGRAMA2 $PROGRAMA2.cpp
g++ -o $PROGRAMA3 $PROGRAMA3.cpp

echo "$MENSAJE_INICIO"

# Se genera un fichero con los datos obtenidos llamando
# al Script ejecuciones.sh con los parámetros oportunos:
./ejecuciones.sh  $PROGRAMA  $SALIDA
./ejecuciones.sh  $PROGRAMA1  $SALIDA1
./ejecuciones.sh  $PROGRAMA2  $SALIDA2
./ejecuciones.sh  $PROGRAMA3  $SALIDA3

# Se elimina el ejecutable:
rm $PROGRAMA
rm $PROGRAMA1
rm $PROGRAMA2
rm $PROGRAMA3

# Se crea un archivo .png con las imágenes resultantes:
./plot.sh

echo "$MENSAJE_FINAL"