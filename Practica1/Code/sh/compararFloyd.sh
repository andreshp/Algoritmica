
#!/bin/bash

#################################################
# Algoritmica, Practica 1
# Plot de las comparaciones entre los ordenadores
# de los componentes del equipo.
#################################################

# Script de bash para crear una imagen .png con GNU-PLOT
OUTPUT=./ImagenesComparacion/floyd_comparacion.png

FICHERO_DATOS1="./DatosAndres/tiempo_floyd.dat"
FICHERO_DATOS2="./DatosIvan/tiempo_floyd.dat"
FICHERO_DATOS3="./DatosAntonioMoya/tiempo_floyd.dat"
FICHERO_DATOS4="./DatosJuanLuis/tiempo_floyd.dat"

TITULO="Comparación de floyd entre computadores"

XLABEL="Longitud del Vector"
YLABEL="Tiempo (segundos)"
LEYENDA1="Andres"
LEYENDA2="Ivan"
LEYENDA3="Antonio"
LEYENDA4="Juan Luis"


gnuplot<<FIN
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

plot "$FICHERO_DATOS1" title '$LEYENDA1' with linespoints ls 1, "$FICHERO_DATOS2" title '$LEYENDA2' with linespoints ls 2, "$FICHERO_DATOS3" title '$LEYENDA3' with linespoints ls 3,"$FICHERO_DATOS4" title '$LEYENDA4' with linespoints ls 4
FIN