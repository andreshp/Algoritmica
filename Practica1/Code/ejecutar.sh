#!/bin/bash

###############################################################
# Algoritmica, Practica 1
# Script que realiza todas las ejecuciones
###############################################################

# Permisos
chmod a+x medirFibonacci.sh
chmod a+x medirHanoi.sh
chmod a+x medirFloyd.sh
chmod a+x medirOrdenacion.sh

# Directorios
mkdir -p Datos
mkdir -p Imagenes
mkdir -p Tablas

# Variables
TEMPORAL1=temp1.txt
TEMPORAL2=temp2.txt
TEMPORAL3=temp3.txt

#------------- OBTENER DATOS -------------#

# Medir para ordenacion
./medirOrdenacion burbuja
./medirOrdenacion seleccion
./medirOrdenacion insercion
./medirOrdenacion quicksort
./medirOrdenacion mergesort

# Medir otros
./medirFloyd
./medirHanoi
./medirFibonacci

#------------- OBTENER TABLAS -------------#

echo "# Tabla con los algoritmos cuadráticos"                  >  ./Tablas/cuadraticos.md
echo                                                           >> ./Tablas/cuadraticos.md
echo "| Tamaño del Vector | Burbuja | Seleccion | Insercion |" >> ./Tablas/cuadraticos.md
echo "|-------------------|---------|-----------|-----------|" >> ./Tablas/cuadraticos.md

cat ./Datos/tiempo_burbuja.dat | cut -d' ' -f1 > $TEMPORAL1
cat ./Datos/tiempo_burbuja.dat | cut -d' ' -f2 > $TEMPORAL2


