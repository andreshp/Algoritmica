#!/bin/bash

#################################################
# Algoritmica, Practica 3
# Plot de los algoritmos de grafos
#################################################

# Script de bash para crear una imagen .png con GNU-PLOT

#Variables:
OUTPUT1=./Imagenes/GrafoArbitrarioTiempo.png
OUTPUT2=./Imagenes/GrafoArbitrarioRecubrimiento.png
TITULO="Comparación de los algoritmos sobre grafos aleatorios"
XLABEL="Nodos del grafo"
YLABEL1="Tiempo"
YLABEL2="Nodos del recubrimiento"
LEYENDA1="Algoritmo aleatorio"
LEYENDA2="Algoritmo voraz aleatorio"
LEYENDA3="Algoritmo voraz basado en nodos"
FICHERO_DATOS1="./Datos/Grafos/Resultados/AlgoritmoAleatorio.txt"
FICHERO_DATOS2="./Datos/Grafos/Resultados/AlgoritmoVorazAleatorizado.txt"
FICHERO_DATOS3="./Datos/Grafos/Resultados/AlgoritmoVorazNodos.txt"

gnuplot<<FIN
# Terminal para png:
set terminal pngcairo enhanced font 'Verdana,10'
set border linewidth 1.5

# Estilo de línea y color:
set style line 1 lc rgb "red" lt 1 lw 2 pt 7 pi 0 ps 0.5
set style line 2 lc rgb "blue" lt 1 lw 2 pt 7 pi 0 ps 0.5
set style line 3 lc rgb "green" lt 1 lw 2 pt 7 pi 0 ps 0.5
set pointintervalbox 0

# Nombre de la imagen resultante:
set output '$OUTPUT1'

# Título y ejes:
set title "$TITULO" enhanced font 'Verdana,14'
set xlabel "$XLABEL"
set ylabel "$YLABEL1"

set autoscale

plot "$FICHERO_DATOS1" using 1:2 title '$LEYENDA1' with linespoints ls 1, "$FICHERO_DATOS2" using 1:2 title '$LEYENDA2' with linespoints ls 2, "$FICHERO_DATOS3" using 1:2 title '$LEYENDA3' with linespoints ls 3
FIN

gnuplot<<FIN
# Terminal para png:
set terminal pngcairo enhanced font 'Verdana,10'
set border linewidth 1.5

# Estilo de línea y color:
set style line 1 lc rgb "red" lt 1 lw 2 pt 7 pi 0 ps 0.5
set style line 2 lc rgb "blue" lt 1 lw 2 pt 7 pi 0 ps 0.5
set style line 3 lc rgb "green" lt 1 lw 2 pt 7 pi 0 ps 0.5
set pointintervalbox 0

# Nombre de la imagen resultante:
set output '$OUTPUT2'

# Título y ejes:
set title "$TITULO" enhanced font 'Verdana,14'
set xlabel "$XLABEL"
set ylabel "$YLABEL2"

set autoscale

plot "$FICHERO_DATOS1" using 1:3 title '$LEYENDA1' with linespoints ls 1, "$FICHERO_DATOS2" using 1:3 title '$LEYENDA2' with linespoints ls 2, "$FICHERO_DATOS3" using 1:3 title '$LEYENDA3' with linespoints ls 3
FIN
