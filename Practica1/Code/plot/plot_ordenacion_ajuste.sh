#!/bin/bash

#################################################
# Algoritmica, Practica 1
# Plot de los algoritmos de ordenacion
#################################################

# Script de bash para crear una imagen .png con GNU-PLOT

#Variables:
OUTPUT=./Imagenes/ordenacion_ajuste.png
TITULO="Comparación de diferentes algoritmos de ordenacion con ajuste"
XLABEL="Longitud del Vector"
YLABEL="Tiempo (segundos)"
LEYENDA1="Burbuja"
LEYENDA2="Seleccion"
LEYENDA3="Insercion"
LEYENDA4="MergeSort"
LEYENDA5="QuickSort"
LEYENDA6="HeapSort"
FICHERO_DATOS1="./Datos/tiempo_burbuja.dat"
FICHERO_DATOS2="./Datos/tiempo_seleccion.dat"
FICHERO_DATOS3="./Datos/tiempo_insercion.dat"
FICHERO_DATOS4="./Datos/tiempo_mergesort.dat"
FICHERO_DATOS5="./Datos/tiempo_quicksort.dat"
FICHERO_DATOS6="./Datos/tiempo_heapsort.dat"

gnuplot<<FIN
# Ajustes
f(x) = a_f*x*x + b_f*x
fit f(x) "$FICHERO_DATOS1" via a_f, b_f
g(x) = a_g*x*x + b_g*x
fit g(x) "$FICHERO_DATOS2" via a_g, b_g
h(x) = a_h*x*x + b_h*x
fit h(x) "$FICHERO_DATOS3" via a_h, b_h

title_c(a,b) = sprintf('h(x) = %.10fx^2 + %.10fx', a, b)

f_2(x) = a_f_2*x*log(x)
a_f_2 = 0.002
fit f_2(x) "$FICHERO_DATOS4" via a_f_2
g_2(x) = a_g_2*x*log(x)
a_g_2 = 0.002
fit g_2(x) "$FICHERO_DATOS5" via a_g_2
h_2(x) = a_h_2*x*log(x)
a_h_2 = 0.002
fit h_2(x) "$FICHERO_DATOS6" via a_h_2

title_l(a) = sprintf('h(x) = %.10f*x*log(x)', a)

# Terminal para png:
set terminal pngcairo enhanced font 'Verdana,10'
set border linewidth 1.5

# Estilo de línea y color:
set style line 1 lc rgb "red" lt 1 lw 2 pt 7 pi 0 ps 0.5
set style line 2 lc rgb "blue" lt 1 lw 2 pt 7 pi 0 ps 0.5
set style line 3 lc rgb "green" lt 1 lw 2 pt 7 pi 0 ps 0.5
set style line 4 lc rgb "yellow" lt 1 lw 2 pt 7 pi 0 ps 0.5
set style line 5 lc rgb "brown" lt 1 lw 2 pt 7 pi 0 ps 0.5
set style line 6 lc rgb "orange" lt 1 lw 2 pt 7 pi 0 ps 0.5
set pointintervalbox 0

# Nombre de la imagen resultante:
set output '$OUTPUT'

# Título y ejes:
set title "$TITULO" enhanced font 'Verdana,14'
set xlabel "$XLABEL"
set ylabel "$YLABEL"

set autoscale

plot "$FICHERO_DATOS1" title '$LEYENDA1' with linespoints ls 1, "$FICHERO_DATOS2" title '$LEYENDA2' with linespoints ls 2, "$FICHERO_DATOS3" title '$LEYENDA3' with linespoints ls 3, "$FICHERO_DATOS4" title '$LEYENDA4' with linespoints ls 4, "$FICHERO_DATOS5" title '$LEYENDA5' with linespoints ls 5, "$FICHERO_DATOS6" title '$LEYENDA6' with linespoints ls 6, f(x) title title_c(a_f, b_f) ls 1, g(x) title title_c(a_g, b_g) ls 2, h(x) title title_c(a_h, b_h) ls 3, f_2(x) title title_l(a_f_2) ls 4, g_2(x) title title_l(a_g_2) ls 5, h_2(x) title title_l(a_h_2) ls 6
FIN