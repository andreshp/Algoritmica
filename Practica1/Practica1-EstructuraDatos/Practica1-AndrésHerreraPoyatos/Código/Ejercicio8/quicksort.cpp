//////////////////////////////////////////////////
// Autor: Andrés Herrera Poyatos
// Estructura de Datos, Práctica 1, Ejercicio 8
///////////////////////////////////////////////////

/* Programa que devuelve el tiempo que el algoritmo de ordenación quicksort
   tarda en ordenar un array de tamaño dado como parámetro */


# include <iostream>
# include <ctime>    // Recursos para medir tiempos
# include <cstdlib>  // Para generación de números pseudoaleatorios
# include <algorithm>

using namespace std;

// Función para dividir el array y hacer los intercambios
int divide(int *array, int start, int end) {
    int left;
    int right;
    int pivot;
    int temp;
 
    pivot = array[start];
    left = start;
    right = end;
 
    // Mientras no se cruzen los índices
    while (left < right) {
        while (array[right] > pivot) {
            right--;
        }
 
        while ((left < right) && (array[left] <= pivot)) {
            left++;
        }
 
        // Si todavía no se cruzan los indices seguimos intercambiando
        if (left < right) {
            temp = array[left];
            array[left] = array[right];
            array[right] = temp;
        }
    }
 
    // Los índices ya se han cruzado, ponemos el pivot en el lugar que le corresponde
    temp = array[right];
    array[right] = array[start];
    array[start] = temp;
 
    // La nueva posición del pivot
    return right;
}
 
// Función recursiva para hacer el ordenamiento
void quicksort(int *array, int start, int end)
{
    int pivot;
 
    if (start < end) {
        pivot = divide(array, start, end);
 
        // Ordeno la lista de los menores
        quicksort(array, start, pivot - 1);
 
        // Ordeno la lista de los mayores
        quicksort(array, pivot + 1, end);
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
        
        quicksort(v, 0, size-1);
        
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
            quicksort(u, 0, size-1);
        }
        clock_t t_despues = clock();
        cout << size << " \t  " << ((double) ((t_despues - t_antes) - (t_despues_vacio - t_antes_vacio))) / (CLOCKS_PER_SEC * NUM_VECES) << endl;

      delete [] u;
    }

    delete [] v;     // Liberamos memoria dinámica
}