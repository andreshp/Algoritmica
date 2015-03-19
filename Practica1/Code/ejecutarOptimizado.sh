#!/bin/bash

###############################################################
# Algoritmica, Practica 1
# Script que realiza todas las ejecuciones
###############################################################

# Permisos
chmod a+x ./sh/medirFibonacci.sh
chmod a+x ./sh/medirHanoi.sh
chmod a+x ./sh/medirFloyd.sh
chmod a+x ./sh/medirOrdenacion.sh
chmod a+x ./sh/medirOrdenacionLog.sh

chmod a+x ./plot/plot_cuadraticos.sh
chmod a+x ./plot/plot_nlogn.sh
chmod a+x ./plot/plot_cubicos.sh
chmod a+x ./plot/plot_fibonacci.sh
chmod a+x ./plot/plot_hanoi.sh
chmod a+x ./plot/plot_ordenacion.sh

chmod a+x ./plot/plot_cuadraticos_optimizacion.sh
chmod a+x ./plot/plot_nlogn_optimizacion.sh
chmod a+x ./plot/plot_cubicos_optimizacion.sh
chmod a+x ./plot/plot_fibonacci_optimizacion.sh
chmod a+x ./plot/plot_hanoi_optimizacion.sh

# Directorios
mkdir -p Datos
mkdir -p Imagenes
mkdir -p Tablas$1
mkdir -p Ajustes$1

# Variables
TEMPORAL1=temp1.txt
TEMPORAL2=temp2.txt
TEMPORAL3=temp3.txt
TEMPORAL4=temp4.txt

#------------- OBTENER DATOS -------------#

# Medir para ordenacion
./sh/medirOrdenacion.sh burbuja 2
./sh/medirOrdenacion.sh seleccion 2 
./sh/medirOrdenacion.sh insercion 2
./sh/medirOrdenacion.sh quicksort 2
./sh/medirOrdenacion.sh mergesort 2
./sh/medirOrdenacion.sh heapsort 2
./sh/medirOrdenacionLog.sh heapsort 2
./sh/medirOrdenacionLog.sh quicksort 2
./sh/medirOrdenacionLog.sh mergesort 2

# Medir otros
./sh/medirFloyd.sh 2
./sh/medirHanoi.sh 2
./sh/medirFibonacci.sh 2

mv Datos DatosOpt
mv Datos$1 Datos

#------------- OBTENER TABLAS -------------#

# Tabla para los algoritmos cuadráticos

echo "# Tabla con los algoritmos cuadráticos"                  >  ./Tablas$1/cuadraticos_optimizado.md
echo                                                           >> ./Tablas$1/cuadraticos_optimizado.md
echo "| Tamaño del Vector | Burbuja | Seleccion | Insercion |" >> ./Tablas$1/cuadraticos_optimizado.md
echo "|-------------------|---------|-----------|-----------|" >> ./Tablas$1/cuadraticos_optimizado.md

echo > $TEMPORAL1
cat ./Datos/tiempo_burbuja.dat | cut -d' ' -f1 > $TEMPORAL2
paste -d'|' $TEMPORAL1 $TEMPORAL2 > $TEMPORAL4
cat ./Datos/tiempo_burbuja.dat | cut -d' ' -f2 > $TEMPORAL2
paste -d'|' $TEMPORAL4 $TEMPORAL2 > $TEMPORAL3
cat ./Datos/tiempo_seleccion.dat | cut -d' ' -f2 > $TEMPORAL2
paste -d'|' $TEMPORAL3 $TEMPORAL2 > $TEMPORAL4
cat ./Datos/tiempo_insercion.dat | cut -d' ' -f2 > $TEMPORAL2
paste -d'|' $TEMPORAL4 $TEMPORAL2 > $TEMPORAL3
paste -d'|' $TEMPORAL3 $TEMPORAL1 > $TEMPORAL4
cat $TEMPORAL4 >> ./Tablas$1/cuadraticos_optimizado.md

# Tabla para los algoritmos n log n

echo "# Tabla con los algoritmos n log n"            >  ./Tablas$1/nlogn_optimizado.md
echo                                                 >> ./Tablas$1/nlogn_optimizado.md
echo "| Tamaño del Vector | Mergesort | Quicksort | Heapsort |" >> ./Tablas$1/nlogn_optimizado.md
echo "|-------------------|-----------|-----------|----------|" >> ./Tablas$1/nlogn_optimizado.md

echo > $TEMPORAL1
cat ./Datos/tiempo_mergesort_1.dat | cut -d' ' -f1 > $TEMPORAL2
paste -d'|' $TEMPORAL1 $TEMPORAL2 > $TEMPORAL4
cat ./Datos/tiempo_mergesort_1.dat | cut -d' ' -f2 > $TEMPORAL2
paste -d'|' $TEMPORAL4 $TEMPORAL2 > $TEMPORAL3
cat ./Datos/tiempo_quicksort_1.dat | cut -d' ' -f2 > $TEMPORAL2
paste -d'|' $TEMPORAL3 $TEMPORAL2 > $TEMPORAL4
cat ./Datos/tiempo_heapsort_1.dat | cut -d' ' -f2 > $TEMPORAL2
paste -d'|' $TEMPORAL4 $TEMPORAL2 > $TEMPORAL3
paste -d'|' $TEMPORAL3 $TEMPORAL1 > $TEMPORAL4
cat $TEMPORAL4 >> ./Tablas$1/nlogn_optimizado.md

# Tabla para los algoritmos cúbicos

echo "# Tabla con los algoritmos cubicos" >  ./Tablas$1/cubico_optimizado.md
echo                                      >> ./Tablas$1/cubico_optimizado.md
echo "| Nodos del Grafo | Floyd |"        >> ./Tablas$1/cubico_optimizado.md
echo "|-----------------|-------|"        >> ./Tablas$1/cubico_optimizado.md

echo > $TEMPORAL1
cat ./Datos/tiempo_floyd.dat | cut -d' ' -f1 > $TEMPORAL2
paste -d'|' $TEMPORAL1 $TEMPORAL2 > $TEMPORAL4
cat ./Datos/tiempo_floyd.dat | cut -d' ' -f2 > $TEMPORAL2
paste -d'|' $TEMPORAL4 $TEMPORAL2 > $TEMPORAL3
paste -d'|' $TEMPORAL3 $TEMPORAL1 > $TEMPORAL4
cat $TEMPORAL4 >> ./Tablas$1/cubico_optimizado.md

# Tabla para los algoritmos ((1+sqrt(5))/2)^n (Fibonacci)

echo "# Tabla con el algoritmo de Fibonacci" >  ./Tablas$1/fibonacci_optimizado.md
echo                                         >> ./Tablas$1/fibonacci_optimizado.md
echo "| Índice | Fibonacci |"                >> ./Tablas$1/fibonacci_optimizado.md
echo "|--------|-----------|"                >> ./Tablas$1/fibonacci_optimizado.md

echo > $TEMPORAL1
cat ./Datos/tiempo_fibonacci.dat | cut -d' ' -f1 > $TEMPORAL2
paste -d'|' $TEMPORAL1 $TEMPORAL2 > $TEMPORAL4
cat ./Datos/tiempo_fibonacci.dat | cut -d' ' -f2 > $TEMPORAL2
paste -d'|' $TEMPORAL4 $TEMPORAL2 > $TEMPORAL3
paste -d'|' $TEMPORAL3 $TEMPORAL1 > $TEMPORAL4
cat $TEMPORAL4 >> ./Tablas$1/fibonacci_optimizado.md

# Tabla para los algoritmos 2^n (Hanoi)

echo "# Tabla con el algoritmo de Hanoi (2^n)" >  ./Tablas$1/hanoi_optimizado.md
echo                                           >> ./Tablas$1/hanoi_optimizado.md
echo "| Num. Discos | Hanoi |"                 >> ./Tablas$1/hanoi_optimizado.md
echo "|-------------|-------|"                 >> ./Tablas$1/hanoi_optimizado.md

echo > $TEMPORAL1
cat ./Datos/tiempo_hanoi.dat | cut -d' ' -f1 > $TEMPORAL2
paste -d'|' $TEMPORAL1 $TEMPORAL2 > $TEMPORAL4
cat ./Datos/tiempo_hanoi.dat | cut -d' ' -f2 > $TEMPORAL2
paste -d'|' $TEMPORAL4 $TEMPORAL2 > $TEMPORAL3
paste -d'|' $TEMPORAL3 $TEMPORAL1 > $TEMPORAL4
cat $TEMPORAL4 >> ./Tablas$1/hanoi_optimizado.md

# Tabla para todos los algoritmos de ordenación

echo "# Tabla con los algoritmos de ordenación"                                        >  ./Tablas$1/ordenacion_optimizado.md
echo                                                                                   >> ./Tablas$1/ordenacion_optimizado.md
echo "| Tamaño del Vector | Burbuja | Seleccion | Insercion | Mergesort | Quicksort | Heapsort |" >> ./Tablas$1/ordenacion_optimizado.md
echo "|-------------------|---------|-----------|-----------|-----------|-----------|----------|" >> ./Tablas$1/ordenacion_optimizado.md

echo > $TEMPORAL1
cat ./Datos/tiempo_burbuja.dat | cut -d' ' -f1 > $TEMPORAL2
paste -d'|' $TEMPORAL1 $TEMPORAL2 > $TEMPORAL4
cat ./Datos/tiempo_burbuja.dat | cut -d' ' -f2 > $TEMPORAL2
paste -d'|' $TEMPORAL4 $TEMPORAL2 > $TEMPORAL3
cat ./Datos/tiempo_seleccion.dat | cut -d' ' -f2 > $TEMPORAL2
paste -d'|' $TEMPORAL3 $TEMPORAL2 > $TEMPORAL4
cat ./Datos/tiempo_insercion.dat | cut -d' ' -f2 > $TEMPORAL2
paste -d'|' $TEMPORAL4 $TEMPORAL2 > $TEMPORAL3
cat ./Datos/tiempo_mergesort.dat | cut -d' ' -f2 > $TEMPORAL2
paste -d'|' $TEMPORAL3 $TEMPORAL2 > $TEMPORAL4
cat ./Datos/tiempo_quicksort.dat | cut -d' ' -f2 > $TEMPORAL2
paste -d'|' $TEMPORAL4 $TEMPORAL2 > $TEMPORAL3
cat ./Datos/tiempo_heapsort.dat | cut -d' ' -f2 > $TEMPORAL2
paste -d'|' $TEMPORAL3 $TEMPORAL2 > $TEMPORAL4
paste -d'|' $TEMPORAL4 $TEMPORAL1 > $TEMPORAL3
cat $TEMPORAL3 >> ./Tablas$1/ordenacion_optimizado.md

#------------- OBTENER GRAFICAS -------------#

./plot/plot_cuadraticos.sh
./plot/plot_nlogn.sh
./plot/plot_cubicos.sh
./plot/plot_fibonacci.sh
./plot/plot_hanoi.sh
./plot/plot_ordenacion.sh

./plot/plot_cuadraticos_optimizacion.sh
./plot/plot_nlogn_optimizacion.sh
./plot/plot_cubicos_optimizacion.sh
./plot/plot_fibonacci_optimizacion.sh
./plot/plot_hanoi_optimizacion.sh

./plot/plot_cuadraticos_ajuste.sh > Ajustes$1/cuadraticos_optimizado.txt
./plot/plot_nlogn_ajuste.sh > Ajustes$1/nlogn_optimizado.txt
./plot/plot_cubicos_ajuste.sh > Ajustes$1/cubicos_optimizado.txt
./plot/plot_fibonacci_ajuste.sh > Ajustes$1/fibonacci_optimizado.txt
./plot/plot_hanoi_ajuste.sh > Ajustes$1/hanoi_optimizado.txt
./plot/plot_ordenacion_ajuste.sh > Ajustes$1/ordenacion_optimizado.txt

rm $TEMPORAL1
rm $TEMPORAL2
rm $TEMPORAL3
rm $TEMPORAL4

mv DatosOpt DatosOpt$1
mv Datos Datos$1
mv Imagenes ImagenesOpt$1