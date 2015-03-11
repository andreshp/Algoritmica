#!/bin/bash

#################################################
# Autor: Andrés Herrera Poyatos
# Estructura de Datos, Práctica 1, Ejercicio 1 
#################################################

# Script de bash para crear una imagen .png con GNU-PLOT

#Variables:
OUTPUT=./Imagenes/AlgoritmoBurbuja.png
TITULO="Algoritmo De Ordenación Burbuja: \nComparación entre posibles casos"
XLABEL="Longitud del Array"
YLABEL="Tiempo (segundos)"
LEYENDA1="Algoritmo Burbuja"
LEYENDA2="Algoritmo Burbuja - Mejor Caso"
LEYENDA3="Algoritmo Burbuja - Peor Caso"
FICHERO_DATOS1="./Datos/tiempo_burbuja1.dat"
FICHERO_DATOS2="./Datos/tiempo_burbuja2.dat"
FICHERO_DATOS3="./Datos/tiempo_burbuja3.dat"
COLOR1=royalblue
COLOR2=green
COLOR3=red

gnuplot<<FIN
# Terminal para png:
set terminal pngcairo enhanced font 'Verdana,10'
set border linewidth 1.5

# Estilo de línea y color:
set style line 1 lc rgb '$COLOR1' lt 1 lw 2 pt 7 pi 0 ps 0.5
set style line 2 lc rgb '$COLOR2' lt 1 lw 2 pt 7 pi 0 ps 0.5
set style line 3 lc rgb '$COLOR3' lt 1 lw 2 pt 7 pi 0 ps 0.5
set pointintervalbox 0

# Nombre de la imagen resultante:
set output '$OUTPUT'

# Título y ejes:
set title "$TITULO" enhanced font 'Verdana,14'
set xlabel "$XLABEL"
set ylabel "$YLABEL"

set autoscale

plot "$FICHERO_DATOS1" title '$LEYENDA1' with linespoints ls 1, "$FICHERO_DATOS2" title '$LEYENDA2' with linespoints ls 2, "$FICHERO_DATOS3" title '$LEYENDA3' with linespoints ls 3
FIN
