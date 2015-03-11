#!/bin/bash

#################################################
# Autor: Andrés Herrera Poyatos
# Estructura de Datos, Práctica 1, Ejercicio 1 
#################################################

# Script de bash para crear una imagen .png de la eficiencia teórica con GNU-PLOT

#Variables:
OUTPUT=./Imagenes/EficienciaTeorica.png
TITULO="Algoritmo De Ordenación Burbuja: Eficiencia Teórica"
XLABEL="Longitud del Array"
YLABEL="Número de Operaciones"
LEYENDA="T(n) = 1 + 393.75n + 7.5 n^2"
COLOR=brown

gnuplot<<FIN
# Terminal para png:
set terminal pngcairo enhanced font 'Verdana,10'
set border linewidth 1.5

# Estilo de línea y color:
set style line 1 lc rgb '$COLOR' lt 1 lw 2 pt 7 pi 0 ps 0.5
set pointintervalbox 0

# Nombre de la imagen resultante:
set output '$OUTPUT'

# Título y ejes:
set title "$TITULO" enhanced font 'Verdana,14'
set xlabel "$XLABEL"
set ylabel "$YLABEL"

set xrange [0 : 30000]

set autoscale

plot 1+393.75*x+7.5*x**2 title '$LEYENDA' with lines ls 1
FIN
