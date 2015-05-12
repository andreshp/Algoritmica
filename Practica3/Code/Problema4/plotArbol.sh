#!/bin/bash

#################################################
# Algoritmica, Practica 3
# Plot de los algoritmos sobre árboles
#################################################

# Script de bash para crear una imagen .png con GNU-PLOT

#Variables:
OUTPUT1=./Imagenes/ArbolTiempo.png
OUTPUT2=./Imagenes/ArbolRecubrimiento.png
TITULO="Comparación de los algoritmos sobre árboles"
XLABEL="Nodos del árbol"
YLABEL1="Tiempo"
YLABEL2="Nodos del recubrimiento"
LEYENDA1="Algoritmo aleatorio"
LEYENDA2="Algoritmo voraz aleatorio"
LEYENDA3="Algoritmo voraz basado en nodos"
LEYENDA4="Algoritmo óptimo"
FICHERO_DATOS1="./Datos/Arboles/Resultados/AlgoritmoAleatorio.txt"
FICHERO_DATOS2="./Datos/Arboles/Resultados/AlgoritmoVorazAleatorizado.txt"
FICHERO_DATOS3="./Datos/Arboles/Resultados/AlgoritmoVorazNodos.txt"
FICHERO_DATOS4="./Datos/Arboles/Resultados/AlgoritmoOptimoArbol.txt"

gnuplot<<FIN
# Terminal para png:
set terminal pngcairo enhanced font 'Verdana,10'
set border linewidth 1.5

# Estilo de línea y color:
set style line 1 lc rgb "red" lt 1 lw 2 pt 7 pi 0 ps 0.5
set style line 2 lc rgb "blue" lt 1 lw 2 pt 7 pi 0 ps 0.5
set style line 3 lc rgb "green" lt 1 lw 2 pt 7 pi 0 ps 0.5
set style line 4 lc rgb "orange" lt 1 lw 2 pt 7 pi 0 ps 0.5
set pointintervalbox 0

# Nombre de la imagen resultante:
set output '$OUTPUT1'

# Título y ejes:
set title "$TITULO" enhanced font 'Verdana,14'
set xlabel "$XLABEL"
set ylabel "$YLABEL1"

set autoscale

plot "$FICHERO_DATOS1" using 1:2 title '$LEYENDA1' with linespoints ls 1, "$FICHERO_DATOS2" using 1:2 title '$LEYENDA2' with linespoints ls 2, "$FICHERO_DATOS3" using 1:2 title '$LEYENDA3' with linespoints ls 3, "$FICHERO_DATOS4" using 1:2 title '$LEYENDA4' with linespoints ls 4
FIN

gnuplot<<FIN
# Terminal para png:
set terminal pngcairo enhanced font 'Verdana,10'
set border linewidth 1.5

# Estilo de línea y color:
set style line 1 lc rgb "red" lt 1 lw 2 pt 7 pi 0 ps 0.5
set style line 2 lc rgb "blue" lt 1 lw 2 pt 7 pi 0 ps 0.5
set style line 3 lc rgb "green" lt 1 lw 2 pt 7 pi 0 ps 0.5
set style line 4 lc rgb "orange" lt 1 lw 2 pt 7 pi 0 ps 0.5
set pointintervalbox 0

# Nombre de la imagen resultante:
set output '$OUTPUT2'

# Título y ejes:
set title "$TITULO" enhanced font 'Verdana,14'
set xlabel "$XLABEL"
set ylabel "$YLABEL2"

set autoscale

plot "$FICHERO_DATOS1" using 1:3 title '$LEYENDA1' with linespoints ls 1, "$FICHERO_DATOS2" using 1:3 title '$LEYENDA2' with linespoints ls 2, "$FICHERO_DATOS3" using 1:3 title '$LEYENDA3' with linespoints ls 3, "$FICHERO_DATOS4" using 1:3 title '$LEYENDA4' with linespoints ls 4
FIN
