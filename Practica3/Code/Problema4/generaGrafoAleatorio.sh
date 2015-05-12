#!/bin/bash

###############################################################
# Algoritmica, Practica 3
# Script para generar grafos aleatorios
###############################################################

#----------------- VARIABLES -----------------#

# Programa y directorio de salida
PROGRAMA=grafoaleatorio
SALIDA=./Datos/Grafos/Instancias

# Número de nodos
INICIO_NODOS=100
FIN_NODOS=1000
INCREMENTO_NODOS=10

# El índice de densidad del árbol indica el porcentaje de parejas
# de nodos entre los cuales hay una arista.
INDICE_DENSIDAD=5

# Creación del directorio de salida en caso de que no exista
mkdir -p $SALIDA

#----------------- COMPILACIÓN -----------------#

# Se genera el ejecutable para crear grafos:
g++ -O$2 -o $PROGRAMA ./src/$PROGRAMA.cpp

#----------------- EJECUCIÓN -----------------#

echo "Se inicia la creación de grafos..."

i=$INICIO_NODOS
while [ $i -le $FIN_NODOS ]
do
    printf "" > $SALIDA/$i.txt
    echo "Creando un grafo con $i nodos..."
    echo "`./$PROGRAMA $i $INDICE_DENSIDAD`" > $SALIDA/$i.txt
    i=$((i+$INCREMENTO_NODOS))
done

# Se elimina el ejecutable:
rm $PROGRAMA