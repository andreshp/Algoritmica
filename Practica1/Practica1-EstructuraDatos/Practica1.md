Estructura de Datos: Práctica 1
===============================
####Alumno: Andrés Herrera Poyatos####

**Ejercicio 1:** Ordenación de la burbuja
El siguiente código realiza la ordenación mediante el algoritmo de la burbuja:
~~~~
:::cpp
void ordenar(int *v, int n) {
    for (int i=0; i<n-1; i++)
        for (int j=0; j<n-i-1; j++)
            if (v[j]>v[j+1]) {
                int aux = v[j];
                v[j] = v[j+1];
                v[j+1] = aux;
            }
}
~~~~
Calcule la eficiencia teórica de este algoritmo. 
A continuación replique el experimento que se ha hecho antes (búsqueda lineal) con este nuevo código. Debe:
- Crear un fichero ordenacion.cpp con el programa completo para realizar una ejecución del algoritmo.
- Crear un script ejecuciones_ordenacion.csh en C-Shell que permite ejecutar varias veces el programa anterior y generar un fichero con los datos obtenidos.
- Usar gnuplot para dibujar los datos obtenidos en el apartado previo.
Los datos deben contener tiempos de ejecución para tamaños del vector 100, 600, 1100, ...,
30000.
Pruebe a dibujar superpuestas la función con la eficiencia teórica y la empírica. ¿Qué sucede?
