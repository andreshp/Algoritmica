#!/bin/bash

#################################################
# Algoritmica, Practica 1
# Plot de las comparaciones entre los ordenadores
# de los componentes del equipo.
#################################################

# Script de bash para crear las imagenes entre comparaciones 
mkdir -p ./ImagenesComparacion

chmod a+x ./plot/compararFibonacci.sh
chmod a+x ./plot/compararFloyd.sh
chmod a+x ./plot/compararInsercion.sh
chmod a+x ./plot/compararQuicksort.sh
chmod a+x ./plot/compararHanoi.sh
chmod a+x ./plot/plot_comparacion_ajustes_nlogn.sh
chmod a+x ./plot/plot_comparacion_ajustes_fibonacci.sh
chmod a+x ./plot/plot_comparacion_ajustes_cuadraticos.sh
chmod a+x ./plot/plot_comparacion_ajustes_cubicos.sh

./plot/compararFibonacci.sh 2> salida
./plot/compararFloyd.sh 2> salida
./plot/compararInsercion.sh 2> salida
./plot/compararQuicksort.sh 2> salida
./plot/compararHanoi.sh 2> salida
./plot/plot_comparacion_ajustes_nlogn.sh 2> salida
./plot/plot_comparacion_ajustes_fibonacci.sh 2> salida
./plot/plot_comparacion_ajustes_cubicos.sh 2> salida
./plot/plot_comparacion_ajustes_cuadraticos.sh 2> salida

rm salida
