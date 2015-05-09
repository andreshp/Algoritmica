#include "GeneralTree.h"
#include <set>

#include <iostream>
#include <fstream>

using namespace std;

void matrizAGrafo(bool ** grafo, int dimension, GeneralTree<int> &arbol, GeneralTree<int>::Node nodo,int numnodo){
    int i = numnodo;
    GeneralTree<int>::Node nodoaux = nodo;
    do{
        i++;
    }while(grafo[numnodo][i] == 0 && i < dimension);
    if(grafo[numnodo][i] != 0){
        GeneralTree<int> arbolaux(i);
        arbol.insertLeftChild(nodoaux,arbolaux);
        nodoaux = nodoaux->leftc;
        matrizAGrafo(grafo,dimension,arbol,nodoaux,i);
        i++;
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

set<GeneralTree<int>::Node > hayaPadresHojas(GeneralTree<int> arbol){
    for(GeneralTree<int>::Iterator iter = arbol.begin(); iter != arbol.end(); ++iter){
        
    }
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
    set<int> recubrimiento;

    /*__________________________________Algoritmo_____________________________________________*/

















    /*_________________________________________________________________________________________*/







    cout <<"Arbol:\n" << arbol << endl;

    cout << "Recubrimiento:\n"  << endl;
    for(set<int>::iterator iter = recubrimiento.begin(); iter != recubrimiento.end(); ++iter){
        cout << " " << *iter;
    }
    cout << endl;


    return 0;
}
