//////////////////////////////////////////////////////////////////////////////////////////
// Author: A.Herrera, A. Moya, I. Sevillano, J.L. Suárez
// Date: 10, April, 2015
// Algoritmica - Práctica 3 - Algoritmos Greedy - Problema 4 - 
// Algoritmo greedy con preferencia de grado de nodo
//////////////////////////////////////////////////////////////////////////////////////////

#include <sys/time.h>
#include <utility>
#include <vector>
#include <set>
#include <iostream>
#include <fstream>
#include <string>

//#define PRUEBA


using namespace std;

int leeGrafo(ifstream &is,bool ** & grafo, set<pair<int, int> > &aristas){
    char* dim;
    int dimension;
    is >> dimension;
    grafo = new bool*[dimension];
    for(int i = 0; i < dimension; i++){
        grafo[i] = new bool[dimension];
    }
    for( int i = 0; i < dimension; i++){
        for(int j = i; j < dimension; j++){
            is >> grafo[i][j];
            grafo[j][i] = grafo[i][j];
            if(grafo[i][j]){
                aristas.insert(pair<int,int>(i,j));
            }
        }
    }

    return dimension;
}
void liberaGrafo(bool** grafo,int dimension){
    for( int i = 0; i < dimension;i++){
        delete[] grafo[i];
    }
    delete[] grafo;
}

//Cuenta el grado del nodo actual
int grado_nodo(int nodo, int num_nodos, bool ** grafo){
    int contador = 0;
    for( int i = 0; i < num_nodos; i++){
        if(grafo[nodo][i]){
            contador++;
        }
    }
    return contador;
}

// Elimina un nodo del grafo, quitando las respectivas aristas
void elimina_nodo(int nodo, int num_nodos, bool ** grafo, set<pair<int,int> > & aristas,vector<int> &grados){
    for(int i = 0; i < num_nodos; i++){
        grafo[nodo][i] = false;
        grafo[i][nodo] = false;
        set<pair<int, int > >::iterator iter;
        if((iter = aristas.find(pair<int,int>(nodo,i)) ) != aristas.end()){
            aristas.erase(iter);
            grados[i]--;
        }
        if((iter = aristas.find(pair<int,int>(i,nodo)) ) != aristas.end() ){
            aristas.erase(iter);
            grados[i]--;
        }
    }
    grados[nodo] = 0;
}

int main(int argc, char const *argv[]){

    // Se comprueban los argumentos
    if(argc < 2){
        cout << "Formato: ./primeraIdea <archivo del grafo>\n";
        return -1;
    }
    const char* nombre = argv[1];
    ifstream is(nombre);
    if(!is){
        cout << "Error de lectura de fichero" << endl;
        return -1;
    }
    bool ** grafo;
    set <pair<int,int> > aristas;
    int num_nodos = leeGrafo(is,grafo,aristas);

    // Variables para calcular el tiempo
    struct timeval tv1, tv2;        // gettimeofday() secs-usecs
    double tv_usecs; 


    set<int> recubrimiento;

    vector<int> grados_nodos;

    set<pair<int,int> > temporal = aristas;

    

    // Ejecución del algoritmo
    gettimeofday(&tv1,NULL);

    int indice = (*temporal.begin()).first;
    for( int i = 0; i < num_nodos; i++){
        grados_nodos.push_back(grado_nodo(i,num_nodos,grafo));
    }
    
    int maximo = grados_nodos[(*temporal.begin()).first];
    int temp = maximo;
    do{
        for(int i = 0; i < num_nodos; i++){
            temp = grados_nodos[i];
            if(temp > maximo){
                indice = i;
                maximo = temp;
            }
        }
        recubrimiento.insert(indice);
        elimina_nodo(indice,num_nodos,grafo,temporal,grados_nodos);
        if(!temporal.empty()){
            maximo = grado_nodo((*temporal.begin()).first,num_nodos,grafo);
            indice = (*temporal.begin()).first;
        }
        else{
            maximo = 0;
        }
    }while(maximo > 0);
    gettimeofday(&tv2,NULL);


    tv_usecs= ((tv2.tv_sec -tv1.tv_sec )*1E6 + (tv2.tv_usec-tv1.tv_usec)) / 1000000.0;

    #ifdef PRUEBA
    cout << "Aristas:"<<endl;
    for(set<pair<int, int> >::iterator iter = aristas.begin(); iter != aristas.end(); ++iter){
        cout << "(" << (*iter).first<<","<< (*iter).second << ") ";
    }
    cout << endl;

    cout << "Recubrimiento:" << endl;
    for(set<int>::iterator iter = recubrimiento.begin(); iter != recubrimiento.end(); ++iter){
        cout <<*iter<< " ";
    }
    cout << endl;

    cout << "Tiempo:" << tv_usecs << endl;
    #else
    cout <<tv_usecs << endl;

    #endif
    liberaGrafo(grafo, num_nodos);



    return 0;
}