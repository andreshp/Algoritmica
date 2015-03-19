#!/bin/bash

#################################################
# Algoritmica, Practica 1
# Plot de las comparaciones entre los ordenadores
# de los componentes del equipo.
#################################################

# Script de bash para crear las imagenes entre comparaciones 
mkdir ./ImagenesComparacion

chmod a+x ./sh/compararFibonacci.sh
chmod a+x ./sh/compararFloyd.sh
chmod a+x ./sh/compararInsercion.sh
chmod a+x ./sh/compararQuicksort.sh
chmod a+x ./sh/compararHanoi.sh

./sh/compararFibonacci.sh
./sh/compararFloyd.sh
./sh/compararInsercion.sh
./sh/compararQuicksort.sh
./sh/compararHanoi.sh
