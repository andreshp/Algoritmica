#include "grafoaleatorio.cpp"
#include <sys/time.h>
#include <utility>
#include <vector>
#include <set>

#define PRUEBA


using namespace std;

int grado_nodo(int nodo, int num_nodos, bool ** grafo){
    int contador = 0;
    for( int i = 0; i < num_nodos; i++){
        if(grafo[nodo][i]){
            contador++;
        }
    }
    return contador;
}
int elimina_nodo(int nodo, int num_nodos, bool ** grafo, set<pair<int,int> > & aristas){
    for(int i = 0; i < num_nodos; i++){
        grafo[nodo][i] = false;
        grafo[i][nodo] = false;
        set<pair<int, int > >::iterator iter;
        if((iter = aristas.find(pair<int,int>(nodo,i)) ) != aristas.end() ){
            aristas.erase(iter);
        }
        if((iter = aristas.find(pair<int,int>(i,nodo)) ) != aristas.end() ){
            aristas.erase(iter);
        }
    }
    cout << aristas.size() << "Yeah" << endl;
}

int main(int argc, char const *argv[]){

    if(argc != 3){
        cout << "Formato: ./terceraIdea <numero de nodos> <probabilidad de ser arista sobre 100>\n";
        return -1;
    }
    struct timeval tv1, tv2;        // gettimeofday() secs-usecs
    double tv_usecs; 
    int num_nodos = atoi(argv[1]);
    int probabilidad = atoi(argv[2]);
    set<pair<int,int> > aristas;
    bool ** grafo = grafoAleatorio(num_nodos,aristas,probabilidad);
    set<int> recubrimiento;
    set<pair<int,int> > temporal = aristas;

    gettimeofday(&tv1,NULL);

    int indice;
    int temp;
    int maximo =1;
    while(maximo > 0){
        cout << temporal.size()  << "????"<< endl;
        int i;
        for(i = 0; i < num_nodos; i++){
            temp = grado_nodo(i,num_nodos,grafo);
            if(temp > maximo){
                indice = i;
                maximo = temp;
            }
        }
        recubrimiento.insert(indice);
        elimina_nodo(indice,num_nodos,grafo,temporal);
    }
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
    cout << tv_usecs << endl;

    liberaGrafo(num_nodos,grafo);

    #endif



    return 0;
}