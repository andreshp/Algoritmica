//////////////////////////////////////////////////////////////////////////////////////////
// Author: A.Herrera, A. Moya, I. Sevillano, J.L. Suárez
// Date: 10, April, 2015
// Algoritmica - Práctica 3 - Algoritmos Greedy - Problema 4 - Algoritmo aleatorio
//////////////////////////////////////////////////////////////////////////////////////////

#include <iostream>
#include <cstdlib>
#include <set>
#include <utility>
#include <vector>

using namespace std;


bool** grafoAleatorio(int num_nodos, int probabilidad){
    srand(time(NULL));
    bool ** grafo = new bool*[num_nodos];
    for(int i = 0; i < num_nodos; i++){
        grafo[i] = new bool[num_nodos];
    }
    for(int i = 0; i < num_nodos; i++){
        for( int j = i; j < num_nodos; j++){
            if( rand() % 100 < probabilidad && i != j){
                grafo[i][j] = true;
                grafo[j][i] = true;
            }
            else{
                grafo[i][j] = false;
                grafo[j][i] = false;
            }
        }
    }
    return grafo;
}

void liberaGrafo(int dimension, bool ** matriz){
    for(int i = 0; i < dimension; i++){
        delete [] matriz[i];
    }
    delete [] matriz;
}

int main(int argc, char const *argv[])
{
    if ( argc < 2){
        cout  << "Forma e llamar al programa: ./grafoaleatorio <numero de nodos> <probabilidad arista>" <<endl;
        return -1;
    }
    int num_nodos = atoi(argv[1]);
    int probabilidad = atoi(argv[2]);

    bool ** grafo = grafoAleatorio(num_nodos,probabilidad);

    cout << num_nodos << endl;

    for(int i = 0; i < num_nodos; i++){
        for(int j = 0; j < num_nodos; j++){
            if(grafo[i][j]){
                cout << 1 << " ";
            }
            else{
                cout << 0 << " ";
            }
        }
        cout << endl;
    }
    liberaGrafo(num_nodos,grafo);


    return 0;
}