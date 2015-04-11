#!/bin/bash

#################################################
# Algoritmica, Practica 1
# Plot de los algoritmos nlogn
#################################################

# Script de bash para crear una imagen .png con GNU-PLOT

#Variables:
OUTPUT=./Imagenes/nlogn_ajuste.png
TITULO="Comparación de diferentes algoritmos O(n log n) con ajuste"
XLABEL="Longitud del Vector"
YLABEL="Tiempo (segundos)"
LEYENDA1="Mergesort"
FICHERO_DATOS1="./Datos/tiempo_Preferences_1.dat"

gnuplot<<FIN
# Ajustes
f(x) = a_f*x*log(x)
a_f = 0.002
fit f(x) "$FICHERO_DATOS1" via a_f

title(a) = sprintf('h(x) = %.10f*x*log(x)', a)

# Terminal para png:
set terminal pngcairo enhanced font 'Verdana,10'
set border linewidth 1.5

# Estilo de línea y color:
set style line 1 lc rgb "red" lt 1 lw 2 pt 7 pi 0 ps 0.5
set pointintervalbox 0

# Nombre de la imagen resultante:
set output '$OUTPUT'

# Título y ejes:
set title "$TITULO" enhanced font 'Verdana,14'
set xlabel "$XLABEL"
set ylabel "$YLABEL"

set autoscale

plot "$FICHERO_DATOS1" title '$LEYENDA1' with points ls 1, f(x) title title(a_f) ls 1
FIN
