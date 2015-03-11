//////////////////////////////////////////////////
// Autor: Andrés Herrera Poyatos
// Estructura de Datos, Práctica 1, Ejercicio 7
///////////////////////////////////////////////////

/* Programa que devuelve el tiempo que el algoritmo Clásico  para
   multiplicación de matrices tarda en realizar un producto de dos matrices
   de tamaño dado como parámetro */

# include <iostream>
# include <algorithm>
# include <cmath>
#include <ctime>    // Recursos para medir tiempos
#include <cstdlib>  // Para generación de números pseudoaleatorios

using namespace std;

/**
 * Función para imprimir matrices. Utilizada durante el desarrollo del código.
 */
void imprimirMatriz(int **matriz, int dimension) {
    for (int i=0; i < dimension; i++) {
        for (int j=0; j < dimension; j++) {
            if (j != 0) {
                cout << "\t";
            }
            cout << matriz[i][j];
        }
        cout << endl;
    }
}

/**
 * Algoritmo cásico del producto de matrices. Eficiencia O(n^3).
 */
int **algoritmoClasico(int **A, int **B, int dimension){
    int **C = new int *[dimension];

    for (int i = 0; i < dimension; i++){
        C[i] = new int [dimension];
    }

    for (int i = 0; i < dimension; i++){
        for (int j = 0; j < dimension; j++){
            C[i][j] = 0;
        }
    }

    for (int i = 0; i < dimension; i++){
        for (int k = 0; k < dimension; k++){
            for (int j = 0; j < dimension; j++){
                C[i][j] += A[i][k] * B[k][j];
            }
        }
    }
    return C;
}

/**
 * Función void que muestra por pantalla la sintaxis del programa
 */
void sintaxis()
{
  cerr << "Sintaxis:" << endl;
  cerr << "  DIM: dimensión de la matriz cuadrada (>0)" << endl;
  cerr << "  VMAX: Valor máximo (>0)" << endl;
  cerr << "Se genera una matriz cuadrada DIMxDIM con elementos aleatorios en [0,VMAX[" << endl;
  exit(EXIT_FAILURE);
}

int main (int argc, char* argv[]){

    // Lectura de parámetros
    if (argc!=3)
        sintaxis();
    int dimension=atoi(argv[1]);     // Tamaño del vector
    int vmax=atoi(argv[2]);    // Valor máximo
    if (dimension<=0 || vmax<=0)
        sintaxis();
  
    // Generación de dos matrices aleatorias:
    int **A=new int *[dimension];       // Reserva de memoria
    int **B=new int *[dimension];       // Reserva de memoria
    int **C;

    for (int i = 0; i < dimension; i++){
        A[i] = new int [dimension];
        B[i] = new int [dimension];
    }

    srand(time(0));            // Inicialización del generador de números pseudoaleatorios
    for (int i = 0; i < dimension; i++){
        for (int j = 0; j < dimension; j++){
            A[i][j] = rand() % vmax;    // Generar aleatorio [0,vmax[
            B[i][j] = rand() % vmax;    // Generar aleatorio [0,vmax[
        }
    }

    clock_t tini;    // Anotamos el tiempo de inicio
    tini=clock();
  
    C = algoritmoClasico(A, B, dimension);  // Se llama al algoritmo
    
    clock_t tfin;    // Anotamos el tiempo de finalización
    tfin=clock();

    // Mostramos resultados
    cout << dimension << "\t" << (tfin-tini)/(double)CLOCKS_PER_SEC << endl;
    
    for (int i = 0; i < dimension; i++){
        delete [] A[i];
        delete [] B[i];
        delete [] C[i];
    }

    delete [] A;
    delete [] B;
    delete [] C;
    
    return 0;
}