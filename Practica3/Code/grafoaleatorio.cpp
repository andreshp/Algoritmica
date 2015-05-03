#include <iostream>
#include <cstdlib>


bool** grafoAleatorio(int num_nodos){
    srand(time(NULL));
    bool ** grafo = new bool*[num_nodos];
    for(int i = 0; i < num_nodos; i++){
        grafo[i] = new bool[num_nodos];
        for( int j = 0; j < num_nodos; j++){
            if( rand()%100 < 50 && i != j){
                grafo[i][j] = true;
            }
            else{
                grafo[i][j] = false;
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