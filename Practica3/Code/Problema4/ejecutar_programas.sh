###############################################################
# Algoritmica, Practica 1
# Medir el tiempo del algoritmo de un algoritmo de ordenación.
###############################################################

# Script de bash que obtiene los datos para el algoritmo 
# de ordenación dado como parámetro.

# Variables:

PROGRAMA1=primeraIdea
SALIDA1=./Datos/resultados1.txt
PROGRAMA2=segundaIdea
SALIDA2=./Datos/resultados2.txt
PROGRAMA3=terceraIdea
SALIDA3=./Datos/resultados3.txt

PARAMETRO=./Datos
MENSAJE_INICIO="Se inicia la ejecución del algoritmo $1:"
MENSAJE_FINAL="Fin de la ejecución. Se ha creado un fichero con los resultados.\n"

# Se genera el ejecutable con el algoritmo de ordenación:
g++ -O$2 -o $PROGRAMA1 ./src/$PROGRAMA1.cpp
g++ -O$2 -o $PROGRAMA2 ./src/$PROGRAMA2.cpp
g++ -O$2 -o $PROGRAMA3 ./src/$PROGRAMA3.cpp

echo "$MENSAJE_INICIO"

# Variables:
INICIO_NOD=100
FIN_NOD=1000
INCREMENTO_NOD=10
INICIO_PROB=5
A=arbol
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
        echo $SALIDA1
        printf "$i " >> $SALIDA1
        echo "`./$PROGRAMA1 $PARAMETRO/$A$i.txt`" >> $SALIDA1
        echo $SALIDA2
        printf "$i " >> $SALIDA2
        echo "`./$PROGRAMA2 $PARAMETRO/$A$i.txt`" >> $SALIDA2
        echo $SALIDA3
        printf "$i " >> $SALIDA3
        echo "`./$PROGRAMA3 $PARAMETRO/$A$i.txt`" >> $SALIDA3
        i=$((i+$INCREMENTO_NOD))
    done
    #j=$((j+$INCREMENTO_PROB))
#done

# Se elimina el ejecutable:
rm $PROGRAMA1
rm $PROGRAMA2
rm $PROGRAMA3

echo "$MENSAJE_FINAL"