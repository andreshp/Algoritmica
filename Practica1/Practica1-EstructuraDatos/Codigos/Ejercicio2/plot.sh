#!/bin/bash

#################################################
# Autor: Andrés Herrera Poyatos
# Estructura de Datos, Práctica 1, Ejercicio 2 
#################################################

# Script de bash para crear una imagen .png con GNU-PLOT
# Genera una grafica a través de unos datos dados y los aproxima.

#Variables:
OUTPUT=./Imagenes/AlgoritmoBurbuja.png
TITULO="Algoritmo De Ordenación Burbuja: Aproximación Cuadrática"
XLABEL="Longitud del Array"
YLABEL="Tiempo (segundos)"
LEYENDA1="Algoritmo Burbuja"
LEYENDA2="Regresión Cuadrática"
FICHERO_DATOS="./Datos/tiempo_burbuja.dat"
COLOR1=royalblue
COLOR2=green

gnuplot<<FIN
f(x) = a*x*x + b*x + c
fit f(x) "$FICHERO_DATOS" via a, b, c
title_f(a,b,c) = sprintf('f(x) = %.10fx^2 + %.10fx + %.10f', a, b, c)

# Terminal para png:
set terminal pngcairo enhanced font 'Verdana,10'
set border linewidth 1.5

# Estilo de línea y color:
set style line 1 lc rgb '$COLOR1' lt 1 lw 2 pt 7 pi 0 ps 0.5
set style line 2 lc rgb '$COLOR2' lt 1 lw 2 pt 7 pi 0 ps 0.5

set pointintervalbox 0

# Nombre de la imagen resultante:
set output '$OUTPUT'

# Título y ejes:
set title "$TITULO" enhanced font 'Verdana,14'
set xlabel "$XLABEL"
set ylabel "$YLABEL"

set autoscale

plot "$FICHERO_DATOS" title '$LEYENDA1' with points ls 1, f(x) title title_f(a,b,c) ls 2
FIN
