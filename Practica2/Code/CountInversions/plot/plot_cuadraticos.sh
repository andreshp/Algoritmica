#!/bin/bash

#################################################
# Algoritmica, Practica 1
# Plot de los algoritmos de cuadraticos
#################################################

# Script de bash para crear una imagen .png con GNU-PLOT

#Variables:
OUTPUT=./Imagenes/cuadraticos.png
TITULO="Comparación de diferentes algoritmos O(n^2)"
XLABEL="Longitud del Vector"
YLABEL="Tiempo (segundos)"
LEYENDA1="Burbuja"
LEYENDA2="Solucion trivial"
LEYENDA3="Insercion"
LEYENDA4="Quicksort"
FICHERO_DATOS1="./Datos/tiempo_PreferencesBuble.dat"
FICHERO_DATOS2="./Datos/tiempo_PreferencesFor.dat"
FICHERO_DATOS3="./Datos/tiempo_PreferencesInsertion.dat"
FICHERO_DATOS4="./Datos/tiempo_PreferencesQuicksort.dat"

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
