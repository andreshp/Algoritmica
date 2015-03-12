#!/bin/bash

#################################################
# Algoritmica, Practica 1
# Plot de los algoritmos de ordenacion
#################################################

# Script de bash para crear una imagen .png con GNU-PLOT

#Variables:
OUTPUT=./Imagenes/Comparacion.png
OUTPUT2=./Imagenes/MergeSortAjuste.png
TITULO="Comparación de diferentes algoritmos O(n log_2 n)"
TITULO2="Algoritmo MergeSort. Ajuste nlogn"
XLABEL="Longitud del Vector"
YLABEL="Tiempo (segundos)"
LEYENDA1="MergeSort"
LEYENDA2="QuickSort"
LEYENDA3="HeapSort"
LEYENDA4="Sort (STL algorithm)"
FICHERO_DATOS1="./Datos/tiempo_mergesort.dat"
FICHERO_DATOS2="./Datos/tiempo_quicksort.dat"
FICHERO_DATOS3="./Datos/tiempo_heapsort.dat"
FICHERO_DATOS4="./Datos/tiempo_sort.dat"


gnuplot<<FIN
# Terminal para png:
set terminal pngcairo enhanced font 'Verdana,10'
set border linewidth 1.5

# Estilo de línea y color:
set style line 1 lc rgb "red" lt 1 lw 2 pt 7 pi 0 ps 0.5
set style line 2 lc rgb "blue" lt 1 lw 2 pt 7 pi 0 ps 0.5
set style line 3 lc rgb "green" lt 1 lw 2 pt 7 pi 0 ps 0.5
set style line 4 lc rgb "yellow" lt 1 lw 2 pt 7 pi 0 ps 0.5
set pointintervalbox 0

# Nombre de la imagen resultante:
set output '$OUTPUT'

# Título y ejes:
set title "$TITULO" enhanced font 'Verdana,14'
set xlabel "$XLABEL"
set ylabel "$YLABEL"

set autoscale

plot "$FICHERO_DATOS1" title '$LEYENDA1' with linespoints ls 1, "$FICHERO_DATOS2" title '$LEYENDA2' with linespoints ls 2, "$FICHERO_DATOS3" title '$LEYENDA3' with linespoints ls 3, "$FICHERO_DATOS4" title '$LEYENDA4' with linespoints ls 4
FIN

gnuplot<<FIN

f(x) = a*x*x + b*x + c
fit f(x) "$FICHERO_DATOS1" via a, b, c
title_f(a,b,c) = sprintf('f(x) =%.10fx*log(x) + %.10f', a, b, c)

# Terminal para png:
set terminal pngcairo enhanced font 'Verdana,10'
set border linewidth 1.5

# Estilo de línea y color:
set style line 1 lc rgb 'green' lt 1 lw 2 pt 7 pi 0 ps 0.5
set style line 2 lc rgb 'royalblue' lt 1 lw 2 pt 7 pi 0 ps 0.5
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
