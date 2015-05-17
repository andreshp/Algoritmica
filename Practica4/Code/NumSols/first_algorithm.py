#!/usr/bin/python
import sys
from time import time
if len(sys.argv) < 3:
    print "Fallo. Se debe llamar al programa asi: ./first_algorithm <numero trabajos> <numero trabajadores>"
else:

    # Parametros:
    # - k : indice del trabajo a asignar.
    # - tiempos : vector con los tiempos de los m trabajos.
    # - solucion_actual : vector con el tiempo de trabajo
    #  asignado a cada maquina.
    # - max_tiempo : Maximo de solucion_actual

    def algoritmo1(k,tiempos, solucion_actual, max_tiempo):
        if k < len(tiempos):
            sol = float("Inf")
            for i in range(len(solucion_actual)):
                solucion_actual[i] += tiempos[k]
                sol = min(sol, algoritmo1(k+1,tiempos, solucion_actual, max(max_tiempo, solucion_actual[i])))
                solucion_actual[i] -= tiempos[k]
            return sol
        else:
            return max_tiempo
    tiempos = []
    for i in range(int(sys.argv[1])):
        tiempos.append(i+1)

    inicial = time()
    algoritmo1(0,tiempos,[0 for i in range(0, int(sys.argv[2]))],0)
    total = time() - inicial

    print total
