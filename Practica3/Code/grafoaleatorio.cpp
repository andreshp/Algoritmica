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


bool** grafoAleatorio(int num_nodos, vector<pair<int,int> > &aristas, int probabilidad){
    srand(time(NULL));
    aristas.clear();
    bool ** grafo = new bool*[num_nodos];
    for(int i = 0; i < num_nodos; i++){
        grafo[i] = new bool[num_nodos];
    }
    for(int i = 0; i < num_nodos; i++){
        for( int j = i; j < num_nodos; j++){
            if( rand() % 100 < probabilidad && i != j){
                grafo[i][j] = true;
                grafo[j][i] = true;
                aristas.push_back(pair<int,int>(i,j));
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