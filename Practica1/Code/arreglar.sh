#!/bin/bash

###############################################################
# Algoritmica, Practica 1
# Script que realiza todas las ejecuciones
###############################################################

NOMBRE=$1

# Permisos
chmod a+x ./sh/medirOrdenacion.sh
chmod a+x ./sh/medirOrdenacionLog.sh

chmod a+x ./plot/plot_nlogn.sh
chmod a+x ./plot/plot_ordenacion.sh

# Directorios
mv Datos$NOMBRE Datos
mv Tablas$NOMBRE Tablas
mv Imagenes$NOMBRE Imagenes

# Variables
TEMPORAL1=temp1.txt
TEMPORAL2=temp2.txt
TEMPORAL3=temp3.txt
TEMPORAL4=temp4.txt

#------------- OBTENER DATOS -------------#

# Medir para ordenacion
./sh/medirOrdenacion.sh heapsort
./sh/medirOrdenacionLog.sh heapsort

#------------- OBTENER TABLAS -------------#

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

./plot/plot_nlogn.sh
./plot/plot_ordenacion.sh

# Directorios
mv Datos Datos$NOMBRE
mv Tablas Tablas$NOMBRE
mv Imagenes Imagenes$NOMBRE


rm $TEMPORAL1
rm $TEMPORAL2
rm $TEMPORAL3
rm $TEMPORAL4