//////////////////////////////////////////////////
// Autor: Andrés Herrera Poyatos
// Estructura de Datos, Práctica 1, Ejercicio 3
///////////////////////////////////////////////////

/* Programa que devuelve el tiempo que tarda en ejecutarse una búsqueda binaria sobre
   un elemento que no pertenece al array como la media de 1000 ejecuciones. */

#include <iostream>
#include <ctime>    // Recursos para medir tiempos
#include <cstdlib>  // Para generación de números pseudoaleatorios

using namespace std;

/** Función que realiza una búsqueda binaria en el vector dado.
 *  Precondiciones: El vector debe estar ordenado de menor a mayor.
 * @param v Puntero a un vector de enteros sobre el que se realiza la búsqueda.
 * @param valor Valor que se desea encontrar en el vector.
 * @param inf Posición donde empieza el subvector considerado.
 * @param sup Posición donde finaliza el subvector considerado.
 */ 
int busquedaBinaria(int *v, int valor, int inf, int sup) {
    int medio;
    bool encontrado=false;
    
    /* ALGORITMO: Búsqueda Binaria, implementación no recursiva.
          Para cada iteración inf representa la posición donde empieza el subvector donde se busca 
          y sup donde finaliza.
          - Se toma el elemento que se encuentra en la mitad del subvector [inf, sup] cuya posición es medio = (inf+sup)/2.
          - Si dicho elemento es el buscado se devuelve su posición. En caso contrario:
              - Si es menor que el elemento buscado, este se debe encontrar en el subvector [medio+1, sup], luego se asigna inf=medio+1.
              - Si es mayorr que el elemento buscado, este se debe encontrar en el subvector [inf, medio-1], luego se asigna sup=medio-1.
          - Se repite el proceso hasta encontrar el elemento o bien cuando inf > sup, en cuyo caso se ha recorrido 
            el vector sin éxito y se devuelve -1.
    */
    while ((inf < sup) && (!encontrado)) {
        medio = (inf + sup)/2; 
        
        if (v[medio] == valor) 
            encontrado = true;
        else if (v[medio] < valor) 
            inf = medio+1;
        else
            sup = medio-1;
    }
    
    if (encontrado) 
        return medio;
    else 
        return -1;
}

void sintaxis()
{
    cerr << "Sintaxis:" << endl;
    cerr << "  TAM: Tamaño del vector (>0)" << endl;
    cerr << "Se genera un vector de tamaño TAM con elementos aleatorios" << endl;
    exit(EXIT_FAILURE);
}

int main(int argc, char * argv[])
{
    const int NUM_EJECUCIONES = 10000;
    
    // Lectura de parámetros
    if (argc != 2)
        sintaxis();
    
    int size = atoi(argv[1]);     // Tamaño del vector
    
    if (size <= 0)
        sintaxis();
    
    // Generación del vector aleatorio
    int *v = new int[size];          // Reserva de memoria
    for (int i = 0; i < size; i++)   // Recorrer vector
        v[i] = i;                    // Se asignan los valores: {0, 1, 2, ... , size-1}.
    
    clock_t tini;    // Anotamos el tiempo de inicio
    tini = clock();
    
    // Se ejecuta el algoritmo NUM_EJECUCIONES veces:
    for (int i = 0; i < NUM_EJECUCIONES; i++){
        busquedaBinaria(v, size+1, 0, size-1);
    }
    
    clock_t tfin;    // Anotamos el tiempo de finalización
    tfin=clock();
  
    // Mostramos resultados
    cout << size << "\t" << ((tfin - tini) / (double)CLOCKS_PER_SEC) / NUM_EJECUCIONES << endl;
    
    delete [] v;     // Liberamos memoria dinámica
}
