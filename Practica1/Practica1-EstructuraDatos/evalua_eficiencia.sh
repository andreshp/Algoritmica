#!/bin/bash

title=$1 #Título  (Sintaxis: "'Título'")
datos=$2 #Nombre del archivo que almacenará los datos
exe=$3 #Nombre del programa ejecutable a analizar
nubeplot=$4 #PDF que guardará la nube de puntos obtenida
grafplot=$5 #PDF con la curva de regresión sobre la nube de puntos
fitfile=$6 #Archivo con la información sobre la regresión
f=$7 #Función de regresión (Sintaxis: "f(x)")
fitvar=$8 #Variables que intervienen en f (Sintaxis: "a, b, ...")
exebash=$9 #Guión que controla la ejecución del programa.



bash $exebash $exe $datos	#Ejecutamos el guión que obtendrá el análisis del programa

gnuplot  2>/dev/null << EOF

f(x) = $f

set term postscript color	#Indicamos que la salida se imprima en formato ps

set output '| ps2pdf - $nubeplot'	#Utilizamos el programa ps2pdf para obtener el pdf del dibujo

set title $title	#Establecemos título y estilos de línea
set style line 1 lt 1 lc rgb "blue" lw 3
set style line 2 lt 1 lc rgb "red"  lw 5

plot "$datos" ls 1	#Imprimimos la nube de puntos

fit f(x) "$datos" via $fitvar #Ajustamos datos

set output '| ps2pdf - $grafplot'

plot f(x) ls 2, "$datos" ls 1	#Imprimimos la nube junto a la curva de regresión.

quit

EOF

mv fit.log $fitfile

echo La ejecución del análisis sobre el programa $title finalizó con éxito. Se ha generado toda la información.