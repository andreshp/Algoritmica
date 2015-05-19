#!/bin/bash



#Variables:
OPCION="Trabajadores"
OUTPUT=./Imagenes/grafica_tiempos_todos_constante_$OPCION.png
TITULO="Gráfica de los diferentes algorítmos con 3 trabajadores"
XLABEL="Número de Trabajos"
YLABEL="Tiempo (segundos)"
LEYENDA1="Primero"
LEYENDA2="Segundo"
LEYENDA3="Tercero"
LEYENDA4="Cuarto"
FICHERO_DATOS1="./Datos/tiempo_first_algorithm.py_$OPCION.dat"
FICHERO_DATOS2="./Datos/tiempo_second_algorithm.py_$OPCION.dat"
FICHERO_DATOS3="./Datos/tiempo_third_algorithm.py_$OPCION.dat"
FICHERO_DATOS4="./Datos/tiempo_fourth_algorithm.py_$OPCION.dat"


gnuplot<<FIN
# Terminal para png:
set terminal pngcairo enhanced font 'Verdana,10'
set border linewidth 1.5

# Estilo de línea y color:
set style line 1 lc rgb "red" lt 1 lw 2 pt 7 pi 0 ps 0.5
set style line 2 lc rgb "blue" lt 1 lw 2 pt 7 pi 0 ps 0.5
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

plot "$FICHERO_DATOS1" title '$LEYENDA1' with linespoints ls 1,"$FICHERO_DATOS2" title '$LEYENDA2' with linespoints ls 2,"$FICHERO_DATOS3" title '$LEYENDA3' with linespoints ls 3,"$FICHERO_DATOS4" title '$LEYENDA4' with linespoints ls 4
FIN