#!/bin/bash

#################################################
# Algoritmica, Practica 1
# Plot de los algoritmos cubicos
#################################################

# Script de bash para crear una imagen .png con GNU-PLOT

#Variables:
OUTPUT=./Imagenes/cubicos_ajuste.png
TITULO="Algoritmo de Floyd O(n^3) con ajuste"
XLABEL="Nodos del Grafo"
YLABEL="Tiempo (segundos)"
LEYENDA1="Floyd"
FICHERO_DATOS1="./Datos/tiempo_floyd.dat"

gnuplot<<FIN
# Ajustes
f(x) = a_f*x*x*x + b_f*x*x + c_f*x + d_f
fit f(x) "$FICHERO_DATOS1" via a_f, b_f, c_f, d_f

title(a,b,c,d) = sprintf('h(x) = %.10fx^3 + %.10fx^2 + %.10fx + %.10f', a, b, c, d)

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

plot "$FICHERO_DATOS1" title '$LEYENDA1' with points ls 1, f(x) title title(a_f,b_f,c_f,d_f) ls 1
FIN