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

# Directorios
mkdir -p Datos
mkdir -p Imagenes
mkdir -p Tablas

# Variables
TEMPORAL1=temp1.txt
TEMPORAL2=temp2.txt
TEMPORAL3=temp3.txt
TEMPORAL4=temp4.txt

#------------- OBTENER DATOS -------------#

# Medir para ordenacion
./sh/medirOrdenacion.sh burbuja
./sh/medirOrdenacion.sh seleccion
./sh/medirOrdenacion.sh insercion
./sh/medirOrdenacion.sh quicksort
./sh/medirOrdenacion.sh mergesort
./sh/medirOrdenacion.sh heapsort
./sh/medirOrdenacionLog.sh heapsort
./sh/medirOrdenacionLog.sh quicksort
./sh/medirOrdenacionLog.sh mergesort

# Medir otros
./sh/medirFloyd.sh
./sh/medirHanoi.sh
./sh/medirFibonacci.sh

#------------- OBTENER TABLAS -------------#

# Tabla para los algoritmos cuadráticos

echo "# Tabla con los algoritmos cuadráticos"                  >  ./Tablas/cuadraticos.md
echo                                                           >> ./Tablas/cuadraticos.md
echo "| Tamaño del Vector | Burbuja | Seleccion | Insercion |" >> ./Tablas/cuadraticos.md
echo "|-------------------|---------|-----------|-----------|" >> ./Tablas/cuadraticos.md

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
cat $TEMPORAL4 >> ./Tablas/cuadraticos.md

# Tabla para los algoritmos n log n

echo "# Tabla con los algoritmos n log n"            >  ./Tablas/nlogn.md
echo                                                 >> ./Tablas/nlogn.md
echo "| Tamaño del Vector | Mergesort | Quicksort | Heapsort |" >> ./Tablas/nlogn.md
echo "|-------------------|-----------|-----------|----------|" >> ./Tablas/nlogn.md

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
cat $TEMPORAL4 >> ./Tablas/nlogn.md

# Tabla para los algoritmos cúbicos

echo "# Tabla con los algoritmos cubicos" >  ./Tablas/cubico.md
echo                                      >> ./Tablas/cubico.md
echo "| Nodos del Grafo | Floyd |"        >> ./Tablas/cubico.md
echo "|-----------------|-------|"        >> ./Tablas/cubico.md

echo > $TEMPORAL1
cat ./Datos/tiempo_floyd.dat | cut -d' ' -f1 > $TEMPORAL2
paste -d'|' $TEMPORAL1 $TEMPORAL2 > $TEMPORAL4
cat ./Datos/tiempo_floyd.dat | cut -d' ' -f2 > $TEMPORAL2
paste -d'|' $TEMPORAL4 $TEMPORAL2 > $TEMPORAL3
paste -d'|' $TEMPORAL3 $TEMPORAL1 > $TEMPORAL4
cat $TEMPORAL4 >> ./Tablas/cubico.md

# Tabla para los algoritmos ((1+sqrt(5))/2)^n (Fibonacci)

echo "# Tabla con el algoritmo de Fibonacci" >  ./Tablas/fibonacci.md
echo                                         >> ./Tablas/fibonacci.md
echo "| Índice | Fibonacci |"                >> ./Tablas/fibonacci.md
echo "|--------|-----------|"                >> ./Tablas/fibonacci.md

echo > $TEMPORAL1
cat ./Datos/tiempo_fibonacci.dat | cut -d' ' -f1 > $TEMPORAL2
paste -d'|' $TEMPORAL1 $TEMPORAL2 > $TEMPORAL4
cat ./Datos/tiempo_fibonacci.dat | cut -d' ' -f2 > $TEMPORAL2
paste -d'|' $TEMPORAL4 $TEMPORAL2 > $TEMPORAL3
paste -d'|' $TEMPORAL3 $TEMPORAL1 > $TEMPORAL4
cat $TEMPORAL4 >> ./Tablas/fibonacci.md

# Tabla para los algoritmos 2^n (Hanoi)

echo "# Tabla con el algoritmo de Hanoi (2^n)" >  ./Tablas/hanoi.md
echo                                           >> ./Tablas/hanoi.md
echo "| Num. Discos | Hanoi |"                 >> ./Tablas/hanoi.md
echo "|-------------|-------|"                 >> ./Tablas/hanoi.md

echo > $TEMPORAL1
cat ./Datos/tiempo_hanoi.dat | cut -d' ' -f1 > $TEMPORAL2
paste -d'|' $TEMPORAL1 $TEMPORAL2 > $TEMPORAL4
cat ./Datos/tiempo_hanoi.dat | cut -d' ' -f2 > $TEMPORAL2
paste -d'|' $TEMPORAL4 $TEMPORAL2 > $TEMPORAL3
paste -d'|' $TEMPORAL3 $TEMPORAL1 > $TEMPORAL4
cat $TEMPORAL4 >> ./Tablas/hanoi.md

# Tabla para todos los algoritmos de ordenación

echo "# Tabla con los algoritmos de ordenación"                                        >  ./Tablas/ordenacion.md
echo                                                                                   >> ./Tablas/ordenacion.md
echo "| Tamaño del Vector | Burbuja | Seleccion | Insercion | Mergesort | Quicksort | Heapsort |" >> ./Tablas/ordenacion.md
echo "|-------------------|---------|-----------|-----------|-----------|-----------|----------|" >> ./Tablas/ordenacion.md

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
cat $TEMPORAL3 >> ./Tablas/ordenacion.md

#------------- OBTENER GRAFICAS -------------#

./plot/plot_cuadraticos.sh
./plot/plot_nlogn.sh
./plot/plot_cubicos.sh
./plot/plot_fibonacci.sh
./plot/plot_hanoi.sh
./plot/plot_ordenacion.sh

rm $TEMPORAL1
rm $TEMPORAL2
rm $TEMPORAL3
rm $TEMPORAL4
