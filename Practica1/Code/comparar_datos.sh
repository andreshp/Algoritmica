#!/bin/bash

#################################################
# Algoritmica, Practica 1
# Plot de las comparaciones entre los ordenadores
# de los componentes del equipo.
#################################################

# Script de bash para crear las imagenes entre comparaciones 
mkdir ./ImagenesComparacion

chmod a+x ./plot/compararFibonacci.sh
chmod a+x ./plot/compararFloyd.sh
chmod a+x ./plot/compararInsercion.sh
chmod a+x ./plot/compararQuicksort.sh
chmod a+x ./plot/compararHanoi.sh
chmod a+x ./plot/plot_comparacion_ajustes_nlogn.sh
chmod a+x ./plot/plot_comparacion_ajustes_fibonacci.sh

./plot/compararFibonacci.sh
./plot/compararFloyd.sh
./plot/compararInsercion.sh
./plot/compararQuicksort.sh
./plot/compararHanoi.sh
./plot/plot_comparacion_ajustes_nlogn.sh
./plot/plot_comparacion_ajustes_fibonacci.sh
