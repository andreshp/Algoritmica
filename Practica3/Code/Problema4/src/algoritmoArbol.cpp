#include "GeneralTree.h"
#include <set>
#include <sys/time.h>
#include <iostream>
#include <fstream>

using namespace std;

void matrizAGrafo(bool ** grafo, int dimension, GeneralTree<int> &arbol, GeneralTree<int>::Node nodo,int numnodo){
    int i = numnodo;
    GeneralTree<int>::Node nodoaux = nodo;
    do{
        i++;
    }while(grafo[numnodo][i] == 0 && i < dimension);

    if( i < dimension){
        if(grafo[numnodo][i] != 0){
            GeneralTree<int> arbolaux(i);
            arbol.insertLeftChild(nodoaux,arbolaux);
            nodoaux = nodoaux->leftc;
            matrizAGrafo(grafo,dimension,arbol,nodoaux,i);
            i++;
        }
    }
    
    
    while(grafo[numnodo][i] == 1  && i < dimension){
        GeneralTree<int> arbolaux2(i);
        arbol.insertRightBrother(nodoaux,arbolaux2);
        nodoaux = nodoaux->rightb;
        matrizAGrafo(grafo,dimension,arbol,nodoaux,i);
        i++;

    }
}

GeneralTree<int> formatoGeneralTree(ifstream &is){
    int dimension;
    is >> dimension;
    bool ** grafo = new bool*[dimension];
    for( int i = 0;i < dimension; i++){
        grafo[i] = new bool[dimension];
    }
    for( int i = 0; i < dimension; i++){
        for(int j = 0; j < dimension; j++){
            is >> grafo[i][j];
        }
    }
    GeneralTree<int> arbol(0);
    matrizAGrafo(grafo,dimension,arbol,arbol.getRoot(),0);




    for(int i = 0; i < dimension; i++){
        delete[] grafo[i];
    }
    delete[] grafo;
    return arbol;

}

set<GeneralTree<int>::Node > algoritmoOptimo(GeneralTree<int>::Node nodo){
    set<GeneralTree<int>::Node > recubrimiento;
    GeneralTree<int>::Node nodoaux = nodo;
    if(nodoaux->leftc != NULL){
        set<GeneralTree<int>::Node > recubrimiento2 = algoritmoOptimo(nodoaux->leftc);
        recubrimiento.insert(recubrimiento2.begin(),recubrimiento2.end());
        nodoaux = nodoaux->leftc;
    }
    while(nodoaux->rightb != NULL){
        set<GeneralTree<int>::Node > recubrimiento2 = algoritmoOptimo(nodoaux->rightb);
        recubrimiento.insert(recubrimiento2.begin(),recubrimiento2.end());
        nodoaux = nodoaux->rightb;
    }
    nodoaux = nodo->leftc;
    while(nodoaux != NULL){
        if(recubrimiento.find(nodoaux) == recubrimiento.end()){
            recubrimiento.insert(nodo);
            nodoaux = NULL;
        }
        else{
            nodoaux = nodoaux->rightb;
        }

    }
    return recubrimiento;



}
int main(int argc, char const *argv[])
{
    // Se comprueban los argumentos
    if(argc < 2){
        cout << "Formato: ./primeraIdea <archivo del arbol>\n";
        return -1;
    }
    const char* nombre = argv[1];
    ifstream is(nombre);
    if(!is){
        cout << "Error de lectura de fichero" << endl;
        return -1;
    }

    GeneralTree<int> arbol = formatoGeneralTree(is);
    is.close();

    GeneralTree<int> arbolaux = arbol;
    set<GeneralTree<int>::Node > recubrimiento;

    // Variables para calcular el tiempo
    struct timeval tv1, tv2;        // gettimeofday() secs-usecs
    double tv_usecs; 

     // Ejecución del algoritmo
    gettimeofday(&tv1,NULL);

    /*__________________________________Algoritmo_____________________________________________*/




    recubrimiento = algoritmoOptimo(arbol.getRoot());



    /*_________________________________________________________________________________________*/
    gettimeofday(&tv2,NULL);


    tv_usecs= ((tv2.tv_sec -tv1.tv_sec )*1E6 + (tv2.tv_usec-tv1.tv_usec)) / 1000000.0;





    #ifdef PRUEBA
    cout <<"Arbol:\n" << arbol << endl;

    cout << "Recubrimiento:\n"  << endl;
    for(set<GeneralTree<int>::Node>::iterator iter = recubrimiento.begin(); iter != recubrimiento.end(); ++iter){
        cout << " " << arbol.key(*iter);
    }
    cout << endl;
    #else

    cout << tv_usecs << endl;
    #endif


    return 0;
}
