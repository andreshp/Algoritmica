#!/bin/bash

#################################################
# Autor: Andrés Herrera Poyatos
# Estructura de Datos, Práctica 1, Ejercicio 3
#################################################

# Script de bash que genera una imagen con los resultados del algoritmo búsqueda binaria
# dado en ejercicio_desc.cpp y otra imagen para el mismo algoritmo pero calculando el
# tiempo como la media de 1000 ejecuciones para un tamaño de array dado. 

# Variables:
PROGRAMA1=ejercicio_desc
SALIDA1=./Datos/tiempo_ejercicio_desc.dat
PROGRAMA2=busqueda_binaria
SALIDA2=./Datos/tiempo_busqueda_binaria.dat
MENSAJE_INICIO="Se inicia la ejecución del ejercicio 3:"
MENSAJE_FINAL="Fin de la ejecución del ejercicio 3. Se han creado imagenes y ficheros con los resultados.\n"

# Se genera el ejecutable con el algoritmo de busqueda binaria de ejercicio_desc.cpp:
g++ -o $PROGRAMA1 $PROGRAMA1.cpp
# Se genera el ejecutable con el algoritmo de busqueda binaria de busqueda_binaria.cpp:
g++ -o $PROGRAMA2 $PROGRAMA2.cpp

echo "$MENSAJE_INICIO"

# Se genera un fichero con los datos obtenidos llamando
# al Script ejecuciones.sh con los parámetros oportunos:
./ejecuciones.sh  $PROGRAMA1  $SALIDA1

# Se genera un fichero con los datos obtenidos llamando
# al Script ejecuciones.sh con los parámetros oportunos:
./ejecuciones.sh  $PROGRAMA2  $SALIDA2

# Se eliminan los ejecutables:
rm $PROGRAMA1
rm $PROGRAMA2

# Se crea un archivo .png con las imágenes resultantes:
./plot.sh

mv fit.log ./Datos

echo "$MENSAJE_FINAL"
