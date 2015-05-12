#!/bin/bash

###############################################################
# Algoritmica, Practica 3
# Ejecución de los algoritmos voraces del ejercicio 4
###############################################################

# Script de bash que obtiene los datos para el algoritmo 
# de ordenación dado como parámetro.

#----------------- VARIABLES -----------------#

PROGRAMA1=AlgoritmoAleatorio
PROGRAMA2=AlgoritmoVorazAleatorizado
PROGRAMA3=AlgoritmoVorazNodos
PROGRAMA4=AlgoritmoOptimoArbol

INICIO_NODOS=100
FIN_NODOS=1000
INCREMENTO_NODOS=10

#----------------- PARAMETROS -----------------#

# Se comprueban los parametros, asignando el directorio para
# grafos correspondiente
if [[ $# == 1 && $1 == '-a' ]]; then
    DIR=./Datos/Arboles
    PROGRAMAS=($PROGRAMA1 $PROGRAMA2 $PROGRAMA3 $PROGRAMA4)
else
    DIR=./Datos/Grafos
    PROGRAMAS=($PROGRAMA1 $PROGRAMA2 $PROGRAMA3)
fi

mkdir -p $DIR/Resultados

#----------------- COMPILACIÓN -----------------#

# Se generan los ejecutables para los algoritmos:
g++ -O2 -o $PROGRAMA1 ./src/$PROGRAMA1.cpp
g++ -O2 -o $PROGRAMA2 ./src/$PROGRAMA2.cpp
g++ -O2 -o $PROGRAMA3 ./src/$PROGRAMA3.cpp
g++ -O2 -o $PROGRAMA4 ./src/$PROGRAMA4.cpp


#----------------- EJECUCIÓN -----------------#

# Se comprueba que existe el directorio con los datos.
# En caso afirmativo se inicia la ejecución.
if [[ -d $DIR ]]; then
    echo "Iniciando la ejecución..."
else
    echo "No existe el directorio con los datos (./Datos). Ejecutar 'genera*.sh'."
    exit
fi

for PROGRAMA in ${PROGRAMAS[*]}; do
    echo "Ejecutando el programa $PROGRAMA..."
    printf "" > $DIR/Resultados/$PROGRAMA.txt
    i=$INICIO_NODOS
    while [ $i -le $FIN_NODOS ]
    do
        echo "  Ejecución para $i nodos..."
        echo "$i `./$PROGRAMA $DIR/Instancias/$i.txt`" >> $DIR/Resultados/$PROGRAMA.txt
        i=$((i+$INCREMENTO_NODOS))
    done
done

# Se elimina el ejecutable:
rm $PROGRAMA1
rm $PROGRAMA2
rm $PROGRAMA3
rm $PROGRAMA4

echo "Fin de la ejecución. Se han creado ficheros con los resultados."