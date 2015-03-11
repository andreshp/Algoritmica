#!/bin/bash

#################################################
# Autor: Andrés Herrera Poyatos
# Estructura de Datos, Práctica 1, Ejercicio 2 
#################################################

# Script de bash para crear una imagen .png con GNU-PLOT
# Genera una grafica a través de unos datos dados y los aproxima.

#Variables:
OUTPUT1=./Imagenes/BusquedaBinaria1.png
OUTPUT2=./Imagenes/BusquedaBinaria2.png
OUTPUT3=./Imagenes/BusquedaBinariaAjuste.png

TITULO1="Algoritmo De Búsqueda Binaria: \n ejercicio-desc.cpp"
TITULO2="Algoritmo De Búsqueda Binaria"
TITULO3="Algoritmo De Búsqueda Binaria: \n Regresión Logarítmica"
XLABEL="Longitud del Array"
YLABEL="Tiempo (segundos)"
LEYENDA1="Búsqueda Binaria"
LEYENDA2="Regresión Logarítmica"
FICHERO_DATOS1="./Datos/tiempo_ejercicio_desc.dat"
FICHERO_DATOS2="./Datos/tiempo_busqueda_binaria.dat"
COLOR1=royalblue
COLOR2=green

# Se crea la imagen para ejercicio_desc:
gnuplot<<FIN
# Terminal para png:
set terminal pngcairo enhanced font 'Verdana,10'
set border linewidth 1.5

# Estilo de línea y color:
set style line 1 lc rgb '$COLOR1' lt 1 lw 2 pt 7 pi 0 ps 0.5
set pointintervalbox 0

# Nombre de la imagen resultante:
set output '$OUTPUT1'

# Título y ejes:
set title "$TITULO1" enhanced font 'Verdana,14'
set xlabel "$XLABEL"
set ylabel "$YLABEL"

set autoscale

plot "$FICHERO_DATOS1" title '$LEYENDA1' with points ls 1
FIN

# Se crea la imagen para busqueda_binaria.cpp
gnuplot<<FIN
# Terminal para png:
set terminal pngcairo enhanced font 'Verdana,10'
set border linewidth 1.5

# Estilo de línea y color:
set style line 1 lc rgb '$COLOR1' lt 1 lw 2 pt 7 pi 0 ps 0.5
set pointintervalbox 0

# Nombre de la imagen resultante:
set output '$OUTPUT2'

# Título y ejes:
set title "$TITULO2" enhanced font 'Verdana,14'
set xlabel "$XLABEL"
set ylabel "$YLABEL"
set key right bottom

set autoscale

plot "$FICHERO_DATOS2" title '$LEYENDA1' with linespoints ls 1
FIN

# Se crea la imagen para busqueda_binaria.cpp con un ajuste logarítmico
gnuplot<<FIN
# Ajuste logarítmico: 
f(x) =  a*log(x) + b
fit f(x) "$FICHERO_DATOS2" via a, b
title_f(a,b) = sprintf('f(x) = %.10flog(x) + %.10f', a, b)

# Terminal para png:
set terminal pngcairo enhanced font 'Verdana,10'
set border linewidth 1.5

# Estilo de línea y color:
set style line 1 lc rgb '$COLOR1' lt 1 lw 2 pt 7 pi 0 ps 0.5
set style line 2 lc rgb '$COLOR2' lt 1 lw 2 pt 7 pi 0 ps 0.5

set pointintervalbox 0

# Nombre de la imagen resultante:
set output '$OUTPUT3'

# Título y ejes:
set title "$TITULO3" enhanced font 'Verdana,14'
set xlabel "$XLABEL"
set ylabel "$YLABEL"
set key right bottom

set autoscale

plot "$FICHERO_DATOS2" title '$LEYENDA1' with points ls 1, f(x) title title_f(a,b) ls 2
FIN
