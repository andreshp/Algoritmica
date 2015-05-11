###############################################################
# Algoritmica, Practica 3
# generar grafos
###############################################################

PROGRAMA=arbolaleatorio
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
A=arbol
i=$INICIO_NOD
j=`echo "puts $i**0.3" | ruby`
while [ $i -le $FIN_NOD ]
    do
        printf "" > $SALIDA/$A$i.txt
        echo $SALIDA/$A$i.txt
        echo Ejecución tam = $i
        echo "`./$PROGRAMA $i $j`" > $SALIDA/$A$i.txt
        i=$((i+$INCREMENTO_NOD))
        j=`echo "puts $i**0.3" | ruby`
    done

# Se elimina el ejecutable:
rm $PROGRAMA

echo "$MENSAJE_FINAL"