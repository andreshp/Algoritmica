//////////////////////////////////////////////////
// Autor: Andrés Herrera Poyatos
// Estructura de Datos, Práctica 1, Ejercicio 3
///////////////////////////////////////////////////

/* El programa dado consiste en una búsqueda binaria. Se comenta la misma junto al código. */

#include <iostream>
#include <ctime>    // Recursos para medir tiempos
#include <cstdlib>  // Para generación de números pseudoaleatorios

using namespace std;

/** Función que realiza una búsqueda binaria en el vector dado.
 *  Precondiciones: El vector debe estar ordenado de menor a mayor.
 * @param v Puntero a un vector de enteros sobre el que se realiza la búsqueda.
 * @param n Número de elementos del vector.
 * @param x Valor que se desea encontrar en el vector.
 * @param inf Posición donde empieza el subvector considerado.
 * @param sup Posición donde finaliza el subvector considerado.
 */ 
int operacion(int *v, int n, int x, int inf, int sup) {
    int med;
    bool enc=false;
    
    /* ALGORITMO: Búsqueda Binaria, implementación no recursiva.
          Para cada iteración inf representa la posición donde empieza el subvector donde se busca 
          y sup donde finaliza.
          - Se toma el elemento que se encuentra en la mitad del subvector [inf, sup] cuya posición es med = (inf+sup)/2.
          - Si dicho elemento es el buscado se devuelve su posición. En caso contrario:
              - Si es menor que el elemento buscado, este se debe encontrar en el subvector [med+1, sup], luego se asigna inf=med+1.
              - Si es mayorr que el elemento buscado, este se debe encontrar en el subvector [inf, med-1], luego se asigna sup=med-1.
          - Se repite el proceso hasta encontrar el elemento o bien cuando inf > sup, en cuyo caso se ha recorrido 
            el vector sin éxito y se devuelve -1.
    */
    while ((inf<sup) && (!enc)) {
        med = (inf+sup)/2; 
        
        if (v[med]==x) 
            enc = true;
        else if (v[med] < x) 
            inf = med+1;
        else
            sup = med-1;
    }
    
    if (enc) 
        return med;
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
    // Lectura de parámetros
    if (argc!=2)
      sintaxis();
    int tam=atoi(argv[1]);     // Tamaño del vector
    if (tam<=0)
      sintaxis();
    
    // Generación del vector aleatorio
    int *v=new int[tam];       // Reserva de memoria
    srand(time(0));            // Inicialización del generador de números pseudoaleatorios
    for (int i=0; i<tam; i++)  // Recorrer vector
      v[i] = i;                // Se asignan los valores: {0, 1, 2, ... , tam-1}.
    
    clock_t tini;    // Anotamos el tiempo de inicio
    tini=clock();
  
    // Algoritmo a evaluar
    operacion(v,tam,tam+1,0,tam-1);
    
    clock_t tfin;    // Anotamos el tiempo de finalización
    tfin=clock();
  
    // Mostramos resultados
    cout << tam << "\t" << (tfin-tini)/(double)CLOCKS_PER_SEC << endl;
    
    delete [] v;     // Liberamos memoria dinámica
}
