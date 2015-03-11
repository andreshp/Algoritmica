#################################################
# Autor: Andrés Herrera Poyatos
# Estructura de Datos, Práctica 1, Ejercicio 8
#################################################

# Script de bash que genera una fichero de nombre dado
# con los resultados generados por el ejecutable indicado.

#!/bin/bash

# Variables:
INICIO=100
FIN=30100
INCREMENTO=500
EJECUTABLE=$1
SALIDA=$2

i=$INICIO
echo > $SALIDA
while [ $i -le $FIN ]
do
  echo Ejecución tam = $i
  echo `./$EJECUTABLE $i 10000` >> $SALIDA
  i=$((i+$INCREMENTO))
done