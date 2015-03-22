#!/bin/bash

#################################################
# Algoritmica, Practica 1
# Plot de los algoritmos nlogn
#################################################

# Script de bash para crear una imagen .png con GNU-PLOT

#Variables:

OUTPUT=./ImagenesComparacion/comparacion_ajustes_nlogn.png
TITULO="Comparación de diferentes ajustes para el quicksort"
XLABEL="Longitud del Vector"
YLABEL="Tiempo (segundos)"
LEYENDA1="nlogn"
LEYENDA2="n"
LEYENDA3="nlogn + n"
FICHERO_DATOS="./DatosAndres/tiempo_quicksort.dat"


gnuplot<<FIN
# Ajustes
f(x) = a_f*x*log(x)
a_f = 0.002
fit f(x) "$FICHERO_DATOS" via a_f
g(x) = a_g*x
a_g = 0.002
fit g(x) "$FICHERO_DATOS" via a_g
h(x) = a1_h*x*log(x) + a2_h*x
a1_h = 0.002
a2_h = 0.002
fit h(x) "$FICHERO_DATOS" via a1_h,a2_h


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

plot "$FICHERO_DATOS" title '$LEYENDA1' with points ls 1, "$FICHERO_DATOS" title '$LEYENDA2' with points ls 2, "$FICHERO_DATOS" title '$LEYENDA3' with points ls 3, f(x) title sprintf('f(x) = %.10f*x*log(x)', a_f) ls 1, g(x) title sprintf('g(x) = %.10f*x', a_g) ls 2, h(x) title sprintf('h(x) = %.10f*x*log(x)+%.10f*x', a1_h,a2_h) ls 3
FIN
