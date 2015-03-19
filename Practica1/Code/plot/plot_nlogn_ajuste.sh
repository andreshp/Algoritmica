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
LEYENDA2="Quicksort"
LEYENDA3="Heapsort"
FICHERO_DATOS1="./Datos/tiempo_mergesort_1.dat"
FICHERO_DATOS2="./Datos/tiempo_quicksort_1.dat"
FICHERO_DATOS3="./Datos/tiempo_heapsort_1.dat"

gnuplot<<FIN
# Ajustes
f(x) = a_f*x*log(x)
a_f = 0.002
fit f(x) "$FICHERO_DATOS1" via a_f
g(x) = a_g*x*log(x)
a_g = 0.002
fit g(x) "$FICHERO_DATOS2" via a_g
h(x) = a_h*x*log(x)
a_h = 0.002
fit h(x) "$FICHERO_DATOS3" via a_h

title(a) = sprintf('h(x) = %.10f*x*log(x)', a)

# Terminal para png:
set terminal pngcairo enhanced font 'Verdana,10'
set border linewidth 1.5

# Estilo de línea y color:
set style line 1 lc rgb "red" lt 1 lw 2 pt 7 pi 0 ps 0.5
set style line 2 lc rgb "blue" lt 1 lw 2 pt 7 pi 0 ps 0.5
set style line 3 lc rgb "green" lt 1 lw 2 pt 7 pi 0 ps 0.5
set pointintervalbox 0

# Nombre de la imagen resultante:
set output '$OUTPUT'

# Título y ejes:
set title "$TITULO" enhanced font 'Verdana,14'
set xlabel "$XLABEL"
set ylabel "$YLABEL"

set autoscale

plot "$FICHERO_DATOS1" title '$LEYENDA1' with points ls 1, "$FICHERO_DATOS2" title '$LEYENDA2' with points ls 2, "$FICHERO_DATOS3" title '$LEYENDA3' with points ls 3, f(x) title title(a_f) ls 1, g(x) title title(a_g) ls 2, h(x) title title(a_h) ls 3
FIN
