#!/bin/bash

###############################################################
# Algoritmica, Practica 1
# Script que realiza todas las ejecuciones
###############################################################

# Permisos
chmod a+x medirFibonacci.sh
chmod a+x medirHanoi.sh
chmod a+x medirFloyd.sh
chmod a+x medirOrdenacion.sh

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
./medirOrdenacion.sh burbuja
./medirOrdenacion.sh seleccion
./medirOrdenacion.sh insercion
./medirOrdenacion.sh quicksort
./medirOrdenacion.sh mergesort

# Medir otros
./medirFloyd.sh
./medirHanoi.sh
./medirFibonacci.sh

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
echo "| Tamaño del Vector | Mergesort | Quicksort |" >> ./Tablas/nlogn.md
echo "|-------------------|-----------|-----------|" >> ./Tablas/nlogn.md

echo > $TEMPORAL1
cat ./Datos/tiempo_mergesort.dat | cut -d' ' -f1 > $TEMPORAL2
paste -d'|' $TEMPORAL1 $TEMPORAL2 > $TEMPORAL4
cat ./Datos/tiempo_mergesort.dat | cut -d' ' -f2 > $TEMPORAL2
paste -d'|' $TEMPORAL4 $TEMPORAL2 > $TEMPORAL3
cat ./Datos/tiempo_quicksort.dat | cut -d' ' -f2 > $TEMPORAL2
paste -d'|' $TEMPORAL3 $TEMPORAL2 > $TEMPORAL4
paste -d'|' $TEMPORAL4 $TEMPORAL1 > $TEMPORAL3
cat $TEMPORAL3 >> ./Tablas/nlogn.md

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
echo "| Tamaño del Vector | Burbuja | Seleccion | Insercion | Mergesort | Quicksort |" >> ./Tablas/ordenacion.md
echo "|-------------------|---------|-----------|-----------|-----------|-----------|" >> ./Tablas/ordenacion.md

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
paste -d'|' $TEMPORAL3 $TEMPORAL1 > $TEMPORAL4
cat $TEMPORAL4 >> ./Tablas/ordenacion.md

#------------- OBTENER GRAFICAS -------------#



rm $TEMPORAL1
rm $TEMPORAL2
rm $TEMPORAL3
rm $TEMPORAL4
