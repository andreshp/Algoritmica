#!/bin/bash

###############################################################
# Algoritmica, Practica 1
# Script que realiza todas las ejecuciones
###############################################################

# Permisos
chmod a+x ./sh/medirOrdenacion.sh
chmod a+x ./sh/medirOrdenacionLog.sh

chmod a+x ./plot/plot_cuadraticos.sh
chmod a+x ./plot/plot_nlogn.sh
chmod a+x ./plot/plot_ordenacion.sh
chmod a+x ./eficienciaHibrida.sh

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
./sh/medirOrdenacion.sh PreferencesFor 0
./sh/medirOrdenacion.sh PreferencesBuble 0
./sh/medirOrdenacion.sh PreferencesInsertion 0
./sh/medirOrdenacion.sh PreferencesQuicksort 0
./sh/medirOrdenacion.sh Preferences 0
./sh/medirOrdenacionLog.sh Preferences 0

#------------- OBTENER TABLAS -------------#

# Tabla para los algoritmos cuadráticos

echo "# Tabla con los algoritmos cuadráticos"                  >  ./Tablas/cuadraticos.md
echo                                                           >> ./Tablas/cuadraticos.md
echo "| Tamaño del Vector | Burbuja | Seleccion | Insercion | Quicksort |" >> ./Tablas/cuadraticos.md
echo "|-------------------|---------|-----------|-----------|-----------|" >> ./Tablas/cuadraticos.md

echo > $TEMPORAL1
cat ./Datos/tiempo_PreferencesBuble.dat | cut -d' ' -f1 > $TEMPORAL2
paste -d'|' $TEMPORAL1 $TEMPORAL2 > $TEMPORAL4
cat ./Datos/tiempo_PreferencesBuble.dat | cut -d' ' -f2 > $TEMPORAL2
paste -d'|' $TEMPORAL4 $TEMPORAL2 > $TEMPORAL3
cat ./Datos/tiempo_PreferencesFor.dat | cut -d' ' -f2 > $TEMPORAL2
paste -d'|' $TEMPORAL3 $TEMPORAL2 > $TEMPORAL4
cat ./Datos/tiempo_PreferencesInsertion.dat | cut -d' ' -f2 > $TEMPORAL2
paste -d'|' $TEMPORAL4 $TEMPORAL2 > $TEMPORAL3
cat ./Datos/tiempo_PreferencesQuicksort.dat | cut -d' ' -f2 > $TEMPORAL2
paste -d'|' $TEMPORAL4 $TEMPORAL2 > $TEMPORAL3
paste -d'|' $TEMPORAL3 $TEMPORAL1 > $TEMPORAL4
cat $TEMPORAL4 >> ./Tablas/cuadraticos.md

# Tabla para los algoritmos n log n

echo "# Tabla con los algoritmos n log n"            >  ./Tablas/nlogn.md
echo                                                 >> ./Tablas/nlogn.md
echo "| Tamaño del Vector | Mergesort |" >> ./Tablas/nlogn.md
echo "|-------------------|-----------|" >> ./Tablas/nlogn.md

echo > $TEMPORAL1
cat ./Datos/tiempo_Preferences.dat | cut -d' ' -f1 > $TEMPORAL2
paste -d'|' $TEMPORAL1 $TEMPORAL2 > $TEMPORAL4
cat ./Datos/tiempo_Preferences_1.dat | cut -d' ' -f2 > $TEMPORAL2
paste -d'|' $TEMPORAL4 $TEMPORAL2 > $TEMPORAL3
paste -d'|' $TEMPORAL3 $TEMPORAL1 > $TEMPORAL4
cat $TEMPORAL4 >> ./Tablas/nlogn.md


# Tabla para todos los algoritmos de ordenación

echo "# Tabla con los algoritmos de ordenación"                                        >  ./Tablas/ordenacion.md
echo                                                                                   >> ./Tablas/ordenacion.md
echo "| Tamaño del Vector | Burbuja | Seleccion | Insercion | Mergesort | Quicksort |" >> ./Tablas/ordenacion.md
echo "|-------------------|---------|-----------|-----------|-----------|-----------|" >> ./Tablas/ordenacion.md

echo > $TEMPORAL1
cat ./Datos/tiempo_PreferencesBuble.dat | cut -d' ' -f1 > $TEMPORAL2
paste -d'|' $TEMPORAL1 $TEMPORAL2 > $TEMPORAL4
cat ./Datos/tiempo_PreferencesBuble.dat | cut -d' ' -f2 > $TEMPORAL2
paste -d'|' $TEMPORAL4 $TEMPORAL2 > $TEMPORAL3
cat ./Datos/tiempo_PreferencesFor.dat | cut -d' ' -f2 > $TEMPORAL2
paste -d'|' $TEMPORAL3 $TEMPORAL2 > $TEMPORAL4
cat ./Datos/tiempo_PreferencesInsertion.dat | cut -d' ' -f2 > $TEMPORAL2
paste -d'|' $TEMPORAL4 $TEMPORAL2 > $TEMPORAL3
cat ./Datos/tiempo_Preferences.dat | cut -d' ' -f2 > $TEMPORAL2
paste -d'|' $TEMPORAL3 $TEMPORAL2 > $TEMPORAL4
cat ./Datos/tiempo_PreferencesQuicksort.dat | cut -d' ' -f2 > $TEMPORAL2
paste -d'|' $TEMPORAL4 $TEMPORAL2 > $TEMPORAL3
paste -d'|' $TEMPORAL4 $TEMPORAL1 > $TEMPORAL3
cat $TEMPORAL3 >> ./Tablas/ordenacion.md

#------------- OBTENER GRAFICAS -------------#

./plot/plot_cuadraticos.sh
./plot/plot_nlogn.sh
./plot/plot_ordenacion.sh

rm $TEMPORAL1
rm $TEMPORAL2
rm $TEMPORAL3
rm $TEMPORAL4

./eficienciaHibrida.sh
