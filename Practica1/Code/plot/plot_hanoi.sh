#!/bin/bash

#################################################
# Algoritmica, Practica 1
# Plot del algoritmo exponencial de Hanoi
#################################################

# Script de bash para crear una imagen .png con GNU-PLOT

#Variables:
OUTPUT=../Imagenes/hanoi.png
TITULO="Algoritmo de las torres de Hanoi"
XLABEL="Numero de discos"
YLABEL="Tiempo (segundos)"
LEYENDA1="Hanoi"
FICHERO_DATOS1="../Datos/tiempo_hanoi.dat"

gnuplot<<FIN
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

plot "$FICHERO_DATOS1" title '$LEYENDA1' with linespoints ls 1
FIN
