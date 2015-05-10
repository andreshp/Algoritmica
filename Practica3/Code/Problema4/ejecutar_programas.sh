###############################################################
# Algoritmica, Practica 1
# Medir el tiempo del algoritmo de un algoritmo de ordenación.
###############################################################

# Script de bash que obtiene los datos para el algoritmo 
# de ordenación dado como parámetro.

# Variables:

PROGRAMA=terceraIdea
SALIDA=./Datos/resultados3.txt
PARAMETRO=./Datos
MENSAJE_INICIO="Se inicia la ejecución del algoritmo $1:"
MENSAJE_FINAL="Fin de la ejecución. Se ha creado un fichero con los resultados.\n"

# Se genera el ejecutable con el algoritmo de ordenación:
g++ -O$2 -o $PROGRAMA ./src/$PROGRAMA.cpp

echo "$MENSAJE_INICIO"

# Variables:
INICIO_NOD=100
FIN_NOD=2500
INCREMENTO_NOD=100
INICIO_PROB=11
#FIN_PROB=21
#INCREMENTO_PROB=10


i=$INICIO_NOD
j=$INICIO_PROB

#while [ $j -le $FIN_PROB ]
#do
 #   echo $FIN_PROB
  #  printf "" >> $SALIDA
   # printf "Ejecución prob = $j\n" >> $SALIDA
   # i=$INICIO_NOD
while [ $i -le $FIN_NOD ]
    do
        echo $SALIDA
        printf "$i " >> $SALIDA
        echo "`./$PROGRAMA $PARAMETRO/$i$j.txt`" >> $SALIDA
        i=$((i+$INCREMENTO_NOD))
    done
    #j=$((j+$INCREMENTO_PROB))
#done

# Se elimina el ejecutable:
rm $PROGRAMA

echo "$MENSAJE_FINAL"