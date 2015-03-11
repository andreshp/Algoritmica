#!/bin/bash

#################################################
# Autor: Andrés Herrera Poyatos
# Estructura de Datos, Práctica 1, Ejercicio 6
#################################################

# Script de bash para crear una imagen .png con GNU-PLOT

#Variables:
OUTPUT=./Imagenes/InsercionBurbuja.png
OUTPUT2=./Imagenes/InsercionAjuste.png
TITULO="Algoritmo Inserción vs Algoritmo Burbuja"
TITULO2="Algoritmo Inserción. Ajuste Cuadrático."
XLABEL="Longitud del Vector"
YLABEL="Tiempo (segundos)"
LEYENDA1="Algoritmo Inserción O(n^2)"
LEYENDA2="Algoritmo Burbuja O(n^2)"
FICHERO_DATOS1="./Datos/tiempo_insercion.dat"
FICHERO_DATOS2="./Datos/tiempo_burbuja.dat"
COLOR1=green
COLOR2=royalblue


gnuplot<<FIN
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

plot "$FICHERO_DATOS1" title '$LEYENDA1' with linespoints ls 1, "$FICHERO_DATOS2" title '$LEYENDA2' with linespoints ls 2
FIN

gnuplot<<FIN

f(x) = a*x*x + b*x + c
fit f(x) "$FICHERO_DATOS1" via a, b, c
title_f(a,b,c) = sprintf('f(x) = %.10fx^2 + %.10fx + %.10f', a, b, c)

# Terminal para png:
set terminal pngcairo enhanced font 'Verdana,10'
set border linewidth 1.5

# Estilo de línea y color:
set style line 1 lc rgb '$COLOR1' lt 1 lw 2 pt 7 pi 0 ps 0.5
set style line 2 lc rgb '$COLOR2' lt 1 lw 2 pt 7 pi 0 ps 0.5
set pointintervalbox 0

# Nombre de la imagen resultante:
set output '$OUTPUT2'

# Título y ejes:
set title "$TITULO2" enhanced font 'Verdana,14'
set xlabel "$XLABEL"
set ylabel "$YLABEL"

set autoscale

plot "$FICHERO_DATOS1" title '$LEYENDA1' with points ls 2, f(x) title title_f(a,b,c) ls 1
FIN
