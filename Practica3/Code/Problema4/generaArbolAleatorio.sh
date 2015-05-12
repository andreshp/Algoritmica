#!/bin/bash

###############################################################
# Algoritmica, Practica 3
# Script para generar árboles aleatorios
###############################################################

#----------------- VARIABLES -----------------#

# Programa y directorio de salida
PROGRAMA=arbolaleatorio
SALIDA=./Datos/Arboles/Instancias

# Número de nodos
INICIO_NODOS=100
FIN_NODOS=1000
INCREMENTO_NODOS=10

# Creación del directorio de salida en caso de que no exista
mkdir -p $SALIDA

#----------------- COMPILACIÓN -----------------#

# Se genera el ejecutable para crear árboles:
g++ -O$2 -o $PROGRAMA ./src/$PROGRAMA.cpp

#----------------- EJECUCIÓN -----------------#

echo "Se inicia la creación de árboles..."

i=$INICIO_NODOS
while [ $i -le $FIN_NODOS ]
do
    MAX_HIJOS=`echo "puts $i**0.3" | ruby` # NUM_NODOS ^ 0.3
    printf "" > $SALIDA/$i.txt
    echo "Creando un grafo con $i nodos..."
    echo "`./$PROGRAMA $i $MAX_HIJOS`" > $SALIDA/$i.txt
    i=$((i+$INCREMENTO_NODOS))
done

# Se elimina el ejecutable:
rm $PROGRAMA