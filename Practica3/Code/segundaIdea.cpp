#include "grafoaleatorio.cpp"
#include <sys/time.h>
#include <utility>
#include <vector>
#include <set>

#define PRUEBA


using namespace std;

int main(int argc, char const *argv[]){

    if(argc != 3){
        cout << "Formato: ./primeraIdea <numero de nodos> <probabilidad de ser arista sobre 100>\n";
        return -1;
    }
    struct timeval tv1, tv2;        // gettimeofday() secs-usecs
    double tv_usecs; 
    int num_nodos = atoi(argv[1]);
    int probabilidad = atoi(argv[2]);
    set<pair<int,int> > aristas;
    bool ** grafo = grafoAleatorio(num_nodos,aristas,probabilidad);
    set<int> recubrimiento;

    gettimeofday(&tv1,NULL);

    for(set<pair<int,int> >::iterator i = aristas.begin(); i != aristas.end(); ++i){
        if(recubrimiento.find((*i).first) == recubrimiento.end() ){
            recubrimiento.insert((*i).first);

        }
        else if( recubrimiento.find((*i).second) != recubrimiento.end()){
            recubrimiento.insert((*i).second);
        }
        else{
            if(rand()%100 < 50){
                recubrimiento.insert((*i).second);
            }
            else{
                recubrimiento.insert((*i).first);
            }
        }
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