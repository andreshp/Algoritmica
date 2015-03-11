//////////////////////////////////////////////////
// Autor: Andrés Herrera Poyatos
// Estructura de Datos, Práctica 1, Ejercicio 8
///////////////////////////////////////////////////

/* Programa que devuelve el tiempo que el algoritmo de ordenación heapsort
   tarda en ordenar un array de tamaño dado como parámetro */


# include <iostream>
# include <ctime>    // Recursos para medir tiempos
# include <cstdlib>  // Para generación de números pseudoaleatorios
# include <algorithm>

using namespace std;

void Swap(int* array, int i, int j){
    int exchange = array[i];
    array[i] = array[j];
    array[j] = exchange;
}

void MaxHeapify(int* heap, int start, int end){
    int root = start;
    int child = 2 * start + 1;
    while(child < end){
        if (child + 1 < end && heap[child] < heap[child+1])
            child++;
        if (heap[root] < heap[child]){
            Swap(heap, child, root);
        }
        else break;
        root = child;
        child = 2 * root +1;
    }
}

void BuildMaxHeap(int* array, int start, int end){
    for (int i = (end-2)/2; i >= 0; i--)
        MaxHeapify(array, i, end);
}

void HeapSort(int* array, int start, int end){
    BuildMaxHeap(array, start, end);
    while (end > 0){
        Swap(array, 0, end-1);
        end--;
        MaxHeapify(array, 0, end);
    }
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
    
    const int TAM_GRANDE = 50000;
    const int NUM_VECES = 1000;

    if (size > TAM_GRANDE){
        clock_t t_antes = clock();
        
        HeapSort(v, 0, size);
        
        clock_t t_despues = clock();
    
        cout << size << "  " << ((double)(t_despues - t_antes)) / CLOCKS_PER_SEC << endl;
    }else{
        int * u = new int[size];
        
        for (int i = 0; i < size; i++)
            u[i] = v[i];
      
        clock_t t_antes_vacio = clock();
        for (int veces = 0; veces < NUM_VECES; veces++){
            for (int i = 0; i < size; i++)
                u[i] = v[i];
        }
        clock_t t_despues_vacio = clock();

        clock_t t_antes = clock();
        for (int veces = 0; veces < NUM_VECES; veces++){
            for (int i = 0; i < size; i++)
                u[i] = v[i];
            HeapSort(u, 0, size);
        }
        clock_t t_despues = clock();
        cout << size << " \t  " << ((double) ((t_despues - t_antes) - (t_despues_vacio - t_antes_vacio))) / (CLOCKS_PER_SEC * NUM_VECES) << endl;

      delete [] u;
    }

    delete [] v;     // Liberamos memoria dinámica
}