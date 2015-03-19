#!/bin/bash

#################################################
# Algoritmica, Practica 1
# Plot de los algoritmos nlogn
#################################################

# Script de bash para crear una imagen .png con GNU-PLOT

#Variables:
OUTPUT=./Imagenes/nlogn_con_sin_opt.png
TITULO="Comparación de diferentes algoritmos O(n log n)"
XLABEL="Longitud del Vector"
YLABEL="Tiempo (segundos)"
LEYENDA1="Mergesort"
LEYENDA2="Quicksort"
LEYENDA3="Heapsort"
LEYENDA4="Mergesort Optimizado"
LEYENDA5="Quicksort Optimizado"
LEYENDA6="Heapsort Optimizado"
FICHERO_DATOS1="./Datos/tiempo_mergesort_1.dat"
FICHERO_DATOS2="./Datos/tiempo_quicksort_1.dat"
FICHERO_DATOS3="./Datos/tiempo_heapsort_1.dat"
FICHERO_DATOS4="./DatosOpt/tiempo_mergesort_1.dat"
FICHERO_DATOS5="./DatosOpt/tiempo_quicksort_1.dat"
FICHERO_DATOS6="./DatosOpt/tiempo_heapsort_1.dat"

gnuplot<<FIN
# Terminal para png:
set terminal pngcairo enhanced font 'Verdana,10'
set border linewidth 1.5

# Estilo de línea y color:
set style line 1 lc rgb "red" lt 1 lw 2 pt 7 pi 0 ps 0.5
set style line 2 lc rgb "blue" lt 1 lw 2 pt 7 pi 0 ps 0.5
set style line 3 lc rgb "green" lt 1 lw 2 pt 7 pi 0 ps 0.5
set style line 4 lc rgb "orange" lt 1 lw 2 pt 7 pi 0 ps 0.5
set style line 5 lc rgb "royal-blue" lt 1 lw 2 pt 7 pi 0 ps 0.5
set style line 6 lc rgb "brown" lt 1 lw 2 pt 7 pi 0 ps 0.5
set pointintervalbox 0

# Nombre de la imagen resultante:
set output '$OUTPUT'

# Título y ejes:
set title "$TITULO" enhanced font 'Verdana,14'
set xlabel "$XLABEL"
set ylabel "$YLABEL"

set autoscale

plot "$FICHERO_DATOS1" title '$LEYENDA1' with linespoints ls 1, "$FICHERO_DATOS2" title '$LEYENDA2' with linespoints ls 2, "$FICHERO_DATOS3" title '$LEYENDA3' with linespoints ls 3, "$FICHERO_DATOS4" title '$LEYENDA4' with points ls 4, "$FICHERO_DATOS5" title '$LEYENDA5' with points ls 5, "$FICHERO_DATOS6" title '$LEYENDA6' with points ls 6
FIN
