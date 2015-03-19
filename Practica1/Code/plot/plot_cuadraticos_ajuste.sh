#!/bin/bash

#################################################
# Algoritmica, Practica 1
# Plot de los algoritmos de cuadraticos
#################################################

# Script de bash para crear una imagen .png con GNU-PLOT

#Variables:
OUTPUT=./Imagenes/cuadraticos_ajuste.png
TITULO="Comparación de diferentes algoritmos O(n^2) y sus ajustes"
XLABEL="Longitud del Vector"
YLABEL="Tiempo (segundos)"
LEYENDA1="Burbuja"
LEYENDA2="Seleccion"
LEYENDA3="Insercion"
FICHERO_DATOS1="./Datos/tiempo_burbuja.dat"
FICHERO_DATOS2="./Datos/tiempo_seleccion.dat"
FICHERO_DATOS3="./Datos/tiempo_insercion.dat"

gnuplot<<FIN
# Ajustes
f(x) = a_f*x*x + b_f*x
fit f(x) "$FICHERO_DATOS1" via a_f, b_f
g(x) = a_g*x*x + b_g*x
fit g(x) "$FICHERO_DATOS2" via a_g, b_g
h(x) = a_h*x*x + b_h*x
fit h(x) "$FICHERO_DATOS3" via a_h, b_h

title(a,b) = sprintf('h(x) = %.10fx^2 + %.10fx', a, b)

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

plot "$FICHERO_DATOS1" title '$LEYENDA1' with points ls 1, "$FICHERO_DATOS2" title '$LEYENDA2' with points ls 2, "$FICHERO_DATOS3" title '$LEYENDA3' with points ls 3, f(x) title title(a_f,b_f) ls 1, g(x) title title(a_g,b_g) ls 2, h(x) title title(a_h,b_h) ls 3
FIN
