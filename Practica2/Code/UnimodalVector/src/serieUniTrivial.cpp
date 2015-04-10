#include <iostream>
#include <stdlib.h>
#include <sys/time.h>
#include <vector>
#include <fstream>

using namespace std;
    
#define PRINT_P   //Descomentar para obtener la posicion p.
#define PRINT_TIME  //Descomentar para el tiempo gastado
#define PRINT_TEXT  //Descomentar para obtener la linea que imprime resultados

/*El metodo trivial se basa en una busqueda lineal; como sabemos que en p se alcanza el maximo,
si v[p] > v[p+1] es señal de que ya hemos encontrado p */

int unimodalTrivial(int *v, int size){
    bool found = false;
    int pos;
    for(int i=0; i< size-1 && !found; i++){
        if(v[i]>v[i+1]){
            pos = i;
            found = true;
        }
    }
    if(found == false)  //Este es el caso en que p se encuentra en la ultima posicion. Si se encontrara en la primera,
        pos = size-1;    // se devolveria en el bucle.
    return pos;
}

int main(int argc, char *argv[]){
    if(argc != 2){
        cerr << "Expected a file name." << endl;
        exit(-1);
    }
    
    int results = 0;
    vector <int> v;
    int v_i;

    // Variables de tiempo
    struct timeval tv1, tv2;        
    double tv_usecs; 

    //Lectura de datos
    ifstream in(argv[1]);
    if(!in){
        cerr << "Error: cannot open the file." << endl;
        exit(-1);
    }
    
    while(!in.eof()){
        if(in >> v_i)
            v.push_back(v_i);
    }

    //Ejecucion del algoritmo.
    gettimeofday(&tv1,NULL);

    results = unimodalTrivial(&v[0], v.size());

    gettimeofday(&tv2,NULL);

    cout << v.size();

    //Resultados
    #ifdef PRINT_P
        #ifdef PRINT_TEXT
            cout << "Number where p is located: ";
        #endif
        cout << results << endl;
    #endif

    #ifdef PRINT_TIME
        #ifdef PRINT_TEXT
            cout << "Elapsed time: ";
        #endif
        
        // Tiempo gastado.
        tv_usecs= ((tv2.tv_sec -tv1.tv_sec )*1E6 + (tv2.tv_usec-tv1.tv_usec)) / 1000000.0;
        cout << tv_usecs << endl;
    #endif

    return 0;
}

