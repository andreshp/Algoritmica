#################################################
# Autor: Andrés Herrera Poyatos
# Estructura de Datos, Práctica 1, Ejercicio 3
#################################################

# Script de bash que genera una fichero de nombre dado
# con los resultados generados por el ejecutable indicado.

#!/bin/bash

# Variables:
INICIO=1000
FIN=500000000
INCREMENTO=5000000
EJECUTABLE=$1
SALIDA=$2

i=$INICIO
echo > $SALIDA
while [ $i -le $FIN ]
do
  echo Ejecución tam = $i
  echo `./$EJECUTABLE $i` >> $SALIDA
  i=$((i+$INCREMENTO))
done