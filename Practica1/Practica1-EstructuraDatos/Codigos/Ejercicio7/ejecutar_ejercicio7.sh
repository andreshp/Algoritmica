#!/bin/bash

#################################################
# Autor: Andrés Herrera Poyatos
# Estructura de Datos, Práctica 1, Ejercicio 7
#################################################

# Script de bash que genera una imagen con los resultados del algoritmo 
# clásico del producto de matrices así como  el algoritmo de Strassen.

# Variables:
PROGRAMA1=algoritmo_clasico
PROGRAMA2=algoritmo_strassen
SALIDA1=./Datos/tiempo_clasico.dat
SALIDA2=./Datos/tiempo_strassen.dat
MENSAJE_INICIO="Se inicia la ejecución del ejercicio 7:"
MENSAJE_FINAL="Fin de la ejecución del ejercicio 7. Se ha creado las imagenes y los ficheros con los resultados correspondientes."

# Se genera el ejecutable con el algoritmo de ordenación burbuja:
g++ -o $PROGRAMA1 $PROGRAMA1.cpp
g++ -o $PROGRAMA2 $PROGRAMA2.cpp

echo "$MENSAJE_INICIO"

# Se genera un fichero con los datos obtenidos llamando
# al Script ejecuciones.sh con los parámetros oportunos:
./ejecuciones.sh  $PROGRAMA2  $SALIDA2

# Se elimina el ejecutable:
rm $PROGRAMA1
rm $PROGRAMA2

# Se crea un archivo .png con las imágenes resultantes:
./plot.sh

echo "$MENSAJE_FINAL"