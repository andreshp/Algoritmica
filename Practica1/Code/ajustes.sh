#!/bin/bash

###############################################################
# Algoritmica, Practica 1
# Script que obtiene todos los ajustes
###############################################################

# Permisos
chmod a+x ./plot/plot_cuadraticos_ajuste.sh
chmod a+x ./plot/plot_nlogn_ajuste.sh
chmod a+x ./plot/plot_cubicos_ajuste.sh
chmod a+x ./plot/plot_fibonacci_ajuste.sh
chmod a+x ./plot/plot_hanoi_ajuste.sh
chmod a+x ./plot/plot_ordenacion_ajuste.sh

# Variables
TEMPORAL1=temp1.txt
TEMPORAL2=temp2.txt
TEMPORAL3=temp3.txt
TEMPORAL4=temp4.txt
USER=$1

# Directorios
mv Datos$USER Datos || mkdir -p Datos
mv Imagenes$USER Imagenes || mkdir -p Imagenes
mv Ajustes$USER Ajustes || mkdir -p Ajustes

#------------- OBTENER GRAFICAS -------------#

./plot/plot_cuadraticos_ajuste.sh > Ajustes/cuadraticos.txt
./plot/plot_nlogn_ajuste.sh > Ajustes/nlogn.txt
./plot/plot_cubicos_ajuste.sh > Ajustes/cubicos.txt
./plot/plot_fibonacci_ajuste.sh > Ajustes/fibonacci.txt
./plot/plot_hanoi_ajuste.sh > Ajustes/hanoi.txt
./plot/plot_ordenacion_ajuste.sh > Ajustes/ordenacion.txt
./plot/plot_ordenacion.sh

# Directorios
mv Datos Datos$USER
mv Imagenes Imagenes$USER
mv Ajustes Ajustes$USER
