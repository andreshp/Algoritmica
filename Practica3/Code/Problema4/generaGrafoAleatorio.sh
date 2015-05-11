###############################################################
# Algoritmica, Practica 3
# generar grafos
###############################################################

PROGRAMA=grafoaleatorio
SALIDA=./Datos
MENSAJE_INICIO="Se inicia la ejecución del algoritmo $1:"
MENSAJE_FINAL="Fin de la ejecución. Se ha creado un fichero con los resultados.\n"

# Se genera el ejecutable con el algoritmo de ordenación:
g++ -O$2 -o $PROGRAMA ./src/$PROGRAMA.cpp

echo "$MENSAJE_INICIO"

# Variables:
INICIO_NOD=100
FIN_NOD=1000
INCREMENTO_NOD=10
INICIO_PROB=5
FIN_PROB=25
INCREMENTO_PROB=10


i=$INICIO_NOD
j=$INICIO_PROB

while [ $j -le $FIN_PROB ]
do
    echo $FIN_PROB
    printf "" > $SALIDA/$i$j.txt
    echo Ejecución prob = $j
    i=$INICIO_NOD
    while [ $i -le $FIN_NOD ]
        do
            printf "" > $SALIDA/$i$j.txt
            echo $SALIDA/$i$j.txt
            echo Ejecución tam = $i
            echo "`./$PROGRAMA $i $j`" > $SALIDA/$i$j.txt
            i=$((i+$INCREMENTO_NOD))
        done
    j=$((j+$INCREMENTO_PROB))
done

# Se elimina el ejecutable:
rm $PROGRAMA

echo "$MENSAJE_FINAL"