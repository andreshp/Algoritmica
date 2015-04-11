#!/bin/bash

#################################################
# Algoritmica, Practica 1
# Plot de los algoritmos nlogn
#################################################

# Script de bash para crear una imagen .png con GNU-PLOT

#Variables:
OUTPUT=./Imagenes/cuadraticos_ajuste.png
TITULO="Comparación de diferentes algoritmos O(n^2) con ajuste"
XLABEL="Longitud del Vector"
YLABEL="Tiempo (segundos)"
LEYENDA1="Insercion"
LEYENDA2="Burbuja"
LEYENDA3="Bucle For"
LEYENDA4="Quicksort"
FICHERO_DATOS1="./Datos/tiempo_PreferencesInsertion.dat"
FICHERO_DATOS2="./Datos/tiempo_PreferencesBuble.dat"
FICHERO_DATOS3="./Datos/tiempo_PreferencesFor.dat"
FICHERO_DATOS4="./Datos/tiempo_PreferencesQuicksort.dat"

gnuplot<<FIN
# Ajustes
f(x) = a_f*x**2)
a_f = 0.002
fit f(x) "$FICHERO_DATOS1" via a_f
g(x) = a_g*x**2
a_g = 0.002
fit g(x) "$FICHERO_DATOS2" via a_g
h(x) = a_h*x**2
a_h = 0.002
fit h(x) "$FICHERO_DATOS3" via a_h
t(x) = a_t*x**2
a_t=0.002
fit t(x) "$FICHERO_DATOS4" via a_t

title(a) = sprintf('h(x) = %.10f*x^2', a)

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

plot "$FICHERO_DATOS1" title '$LEYENDA1' with points ls 1, "$FICHERO_DATOS2" title '$LEYENDA2' with points ls 2, "$FICHERO_DATOS3" title '$LEYENDA3' with points ls 3,"$FICHERO_DATOS4" title '$LEYENDA4' with points ls 4, f(x) title title(a_f) ls 1, g(x) title title(a_g) ls 2, h(x) title title(a_h) ls 3,t(x) title title(a_t) ls 4
FIN
