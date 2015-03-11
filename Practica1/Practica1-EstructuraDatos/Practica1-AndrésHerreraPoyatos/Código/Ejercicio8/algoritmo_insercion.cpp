//////////////////////////////////////////////////
// Autor: Andrés Herrera Poyatos
// Estructura de Datos, Práctica 1, Ejercicio 8
///////////////////////////////////////////////////

/* Programa que devuelve el tiempo que el algoritmo de ordenación de inserción
   tarda en ordenar un array de tamaño dado como parámetro */

# include <iostream>
# include <ctime>    // Recursos para medir tiempos
# include <cstdlib>  // Para generación de números pseudoaleatorios
# include <algorithm>

using namespace std;

static void insercion_lims(int *T, int inicial, int final)
{
  int i, j;
  int aux;
  for (i = inicial + 1; i < final; i++) {
    j = i;
    while ((T[j] < T[j-1]) && (j > 0)) {
      aux = T[j];
      T[j] = T[j-1];
      T[j-1] = aux;
      j--;
    };
  };
}

inline static void insercion(int *T, int num_elem)
{
  insercion_lims(T, 0, num_elem);
}

// Sintaxis del programa:
void sintaxis()
{
    cerr << "Sintaxis:" << endl;
    cerr << "  TAM: Tamaño del vector (>0)" << endl;
    cerr << "  VMAX: Valor máximo (>0)" << endl;
    cerr << "Se genera un vector de tamaño TAM con elementos aleatorios en [0,VMAX[" << endl;
    exit(EXIT_FAILURE);
}

int main(int argc, char * argv[])
{
    // Lectura de parámetros
    if (argc != 3)
        sintaxis();
    int size = atoi(argv[1]);     // Tamaño del vector
    int vmax = atoi(argv[2]);    // Valor máximo
    if (size <=0 || vmax <=0)
        sintaxis();
    
    srandom(time(0));

    // Generación del vector aleatorio
    int *v = new int[size];       // Reserva de memoria
    for (int i = 0; i < size; i++){  // Recorrer vector
        v[i] = rand() % vmax;
    }
    
    clock_t tini;    // Anotamos el tiempo de inicio
    tini=clock();
    
    insercion(v, size); 

    clock_t tfin;    // Anotamos el tiempo de finalización
    tfin = clock();

    // Mostramos resultados
    cout << size << "\t" << (tfin - tini) / (double) CLOCKS_PER_SEC << endl;
    
    delete [] v;     // Liberamos memoria dinámica
}
