#!/bin/bash

#################################################
# Algoritmica, Practica 1
# Plot de las comparaciones entre los ordenadores
# de los componentes del equipo.
#################################################

# Script de bash para crear las imagenes entre comparaciones 

chmod a+x ./plot/plot_nlogn_ajustes.sh
chmod a+x ./plot/plot_cuadraticos_ajustes.sh

./plot/plot_nlogn_ajustes.sh
./plot/plot_cuadraticos_ajustes.sh

rm salida
