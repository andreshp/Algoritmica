#!/bin/bash

#################################################
# Algoritmica, Practica 1
# Plot para comparar los distintos ajustes.
#################################################

# Script de bash para crear una imagen .png con GNU-PLOT

#Variables:

OUTPUT=./ImagenesComparacion/comparacion_ajustes_fibonacci.png
TITULO="Comparación de diferentes ajustes para fibonacci"
XLABEL="Longitud del Vector"
YLABEL="Tiempo (segundos)"
LEYENDA="Datos de Fibonacci"
LEYENDA1="n**2"
LEYENDA2="n**3"
LEYENDA3="((1+sqrt(5))/2)**n"
FICHERO_DATOS="./DatosAndres/tiempo_fibonacci.dat"


gnuplot<<FIN
# Ajustes
f(x) = a_f*x**2
a_f = 0.002
fit f(x) "$FICHERO_DATOS" via a_f
g(x) = a_g*x**3
a_g = 0.002
fit g(x) "$FICHERO_DATOS" via a_g
h(x) = a_h*((1+sqrt(5))/2)**x
a_h = 0.002
fit h(x) "$FICHERO_DATOS" via a_h

title_2(a) = sprintf('f(x) = %.10fx^2', a)
title_3(a) = sprintf('g(x) = %.10fx^3', a)
title_e(a) = sprintf('h(x) = %.10f * 1.618^x', a)



# Terminal para png:
set terminal pngcairo enhanced font 'Verdana,10'
set border linewidth 1.5

# Estilo de línea y color:
set style line 1 lc rgb "red" lt 1 lw 2 pt 7 pi 0 ps 0.5
set style line 2 lc rgb "blue" lt 1 lw 2 pt 7 pi 0 ps 0.5
set style line 3 lc rgb "green" lt 1 lw 2 pt 7 pi 0 ps 0.5
set style line 4 lc rgb "brown" lt 1 lw 2 pt 7 pi 0 ps 0.5
set pointintervalbox 0

# Nombre de la imagen resultante:
set output '$OUTPUT'

# Título y ejes:
set title "$TITULO" enhanced font 'Verdana,14'
set xlabel "$XLABEL"
set ylabel "$YLABEL"

set autoscale

plot "$FICHERO_DATOS" title '$LEYENDA' with points ls 4, f(x) title title_2(a_f) ls 1, g(x) title title_3(a_g)  ls 2, h(x) title title_e(a_h)  ls 3
FIN
