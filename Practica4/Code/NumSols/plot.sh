#!/bin/bash

#################################################
# Algoritmica, Practica 4
# Plot del número de soluciones recorridas por
# cada algoritmo
#################################################

# Script de bash para crear una imagen .png con GNU-PLOT

# Se comprueban los parametros.
if [[ $# != 1 ]]; then
    echo "Sintaxis: ./plot.sh <número de trabajos>"
fi

#Variables:
OUTPUT=./Imagenes/ComparacionNumSoluciones.png
TITULO="Soluciones recorridas por cada algoritmo para $1 trabajos"
XLABEL="Número de máquinas"
YLABEL="Soluciones recorridas"
LEYENDA1="Algoritmo 1"
LEYENDA2="Algoritmo 3"
FICHERO_DATOS="./Resultados/resultados.txt"

mkdir -p Imagenes

gnuplot<<FIN
# Terminal para png:
set terminal pngcairo enhanced font 'Verdana,10'
set border linewidth 1.5

# Estilo de línea y color:
set style line 1 lc rgb "red" lt 1 lw 2 pt 7 pi 0 ps 0.5
set style line 2 lc rgb "blue" lt 1 lw 2 pt 7 pi 0 ps 0.5
set pointintervalbox 0

# Nombre de la imagen resultante:
set output '$OUTPUT'

# Título y ejes:
set title "$TITULO" enhanced font 'Verdana,14'
set xlabel "$XLABEL"
set ylabel "$YLABEL"

set autoscale

plot "$FICHERO_DATOS" using 1:2 title '$LEYENDA1' with linespoints ls 1, "$FICHERO_DATOS" using 1:3 title '$LEYENDA2' with linespoints ls 2
FIN
