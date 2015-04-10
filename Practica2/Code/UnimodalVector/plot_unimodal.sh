##########################################################
# Algoritmica, Practica 2
# Plot de los algoritmos para resolucion del ejercicio 6
##########################################################

# Script de bash para crear una imagen .png con GNU-PLOT
mkdir -p Images

#Variables:
OUTPUT=./Images/unimodal_ajuste.png
TITULO="Comparación de diferentes algoritmos en el ejercicio 6 y sus ajustes"
XLABEL="Longitud del Vector"
YLABEL="Tiempo (segundos)"
LEYENDA1="Trivial"
LEYENDA2="Divide"
FICHERO_DATOS1="./data/resultTrivial.txt"
FICHERO_DATOS2="./data/resultDivide.txt"

gnuplot<<FIN
# Ajustes
f(x) = a_f*x
fit f(x) "$FICHERO_DATOS1" via a_f
g(x) = a_g*log(x)
fit g(x) "$FICHERO_DATOS2" via a_g

title_1(a) = sprintf('h(x) = %.10f *x', a)
title_2(a) = sprintf('h(x) = %.10f *log(x)', a)

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

plot "$FICHERO_DATOS1" title '$LEYENDA1' with points ls 1, "$FICHERO_DATOS2" title '$LEYENDA2' with points ls 2, f(x) title title_1(a_f) ls 1, g(x) title title_2(a_g) ls 2
FIN