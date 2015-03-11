#!/bin/bash

#################################################
# Autor: Andrés Herrera Poyatos
# Estructura de Datos, Práctica 1, Ejercicio 8
#################################################

# Script de bash para crear una imagen .png con GNU-PLOT

#Variables:
OUTPUT=./Imagenes/MergesortVariacion.png
TITULO="Algoritmo Mergesort. Variación de UMBRAL-MS"
XLABEL="Longitud del Vector"
YLABEL="Tiempo (segundos)"
LEYENDA1="UMBRAL-MS = 2"
LEYENDA2="UMBRAL-MS = 20"
LEYENDA3="UMBRAL-MS = 40"
LEYENDA4="UMBRAL-MS = 60"
LEYENDA5="UMBRAL-MS = 80"
LEYENDA6="UMBRAL-MS = 100"
FICHERO_DATOS1="./Datos/tiempo_mergesort1.dat"
FICHERO_DATOS2="./Datos/tiempo_mergesort2.dat"
FICHERO_DATOS3="./Datos/tiempo_mergesort3.dat"
FICHERO_DATOS4="./Datos/tiempo_mergesort4.dat"
FICHERO_DATOS5="./Datos/tiempo_mergesort5.dat"
FICHERO_DATOS6="./Datos/tiempo_mergesort6.dat"

gnuplot<<FIN
# Terminal para png:
set terminal pngcairo enhanced font 'Verdana,10'
set border linewidth 1.5

# Estilo de línea y color:
set style line 1 lc rgb "red" lt 1 lw 2 pt 7 pi 0 ps 0.5
set style line 2 lc rgb "blue" lt 1 lw 2 pt 7 pi 0 ps 0.5
set style line 3 lc rgb "green" lt 1 lw 2 pt 7 pi 0 ps 0.5
set style line 4 lc rgb "yellow" lt 1 lw 2 pt 7 pi 0 ps 0.5
set style line 5 lc rgb "purple" lt 1 lw 2 pt 7 pi 0 ps 0.5
set style line 6 lc rgb "black" lt 1 lw 2 pt 7 pi 0 ps 0.5
set pointintervalbox 0

# Nombre de la imagen resultante:
set output '$OUTPUT'

# Título y ejes:
set title "$TITULO" enhanced font 'Verdana,14'
set xlabel "$XLABEL"
set ylabel "$YLABEL"

set autoscale

plot "$FICHERO_DATOS1" title '$LEYENDA1' with linespoints ls 1, "$FICHERO_DATOS2" title '$LEYENDA2' with linespoints ls 2, "$FICHERO_DATOS3" title '$LEYENDA3' with linespoints ls 3, "$FICHERO_DATOS4" title '$LEYENDA4' with linespoints ls 4, "$FICHERO_DATOS5" title '$LEYENDA5' with linespoints ls 5, "$FICHERO_DATOS6" title '$LEYENDA6' with linespoints ls 6
FIN