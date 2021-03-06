#!/bin/bash



#Variables:
OPCION="Trabajos"
OUTPUT=./Imagenes/grafica_tiempos_dos_mejores_constante_$OPCION.png
TITULO="Comportamiento de los algoritmos 3 y 4 con 17 trabajos"
XLABEL="Número de Trabajadores"
YLABEL="Tiempo (segundos)"

LEYENDA3="Algoritmo 3"
LEYENDA4="Algoritmo 4"

FICHERO_DATOS3="./Datos/tiempo_third_algorithm.py_Ultimo_$OPCION.dat"
FICHERO_DATOS4="./Datos/tiempo_fourth_algorithm.py_Ultimo_$OPCION.dat"


gnuplot<<FIN
# Terminal para png:
set terminal pngcairo enhanced font 'Verdana,10'
set border linewidth 1.5

# Estilo de línea y color:
set style line 3 lc rgb "yellow" lt 1 lw 2 pt 7 pi 0 ps 0.5
set style line 4 lc rgb "brown" lt 1 lw 2 pt 7 pi 0 ps 0.5
set pointintervalbox 0

# Nombre de la imagen resultante:
set output '$OUTPUT'

# Título y ejes:
set title "$TITULO" enhanced font 'Verdana,14'
set xlabel "$XLABEL"
set ylabel "$YLABEL"

set autoscale

plot "$FICHERO_DATOS3" title '$LEYENDA3' with linespoints ls 3,"$FICHERO_DATOS4" title '$LEYENDA4' with linespoints ls 4
FIN
