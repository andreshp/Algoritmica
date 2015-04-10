/////////////////////////////////////////////

#include <iostream>
#include <stdlib.h>
#include <sys/time.h>
#include <vector>
#include <fstream>

using namespace std;

#define PRINT_P   //Descomentar para obtener la posicion p.
#define PRINT_TIME  //Descomentar para el tiempo gastado
#define PRINT_TEXT  //Descomentar para obtener la linea que imprime resultados

/* El algoritmo "divide y venceras" para este problema, se basa en observar el comportamiento de la serie de numeros
antes y despues de la posicion central del vector estudiado. Para empezar, se coge la posicion central del vector que nos pasan
y simplemente comprobamos, teniendo tres casos: 
1) El numero del vector en esa posicion es mayor que en la posicion anterior, pero menor que la siguiente: nuestro p esta a la derecha
2) El numero del vector en esa posicion es menor que la posicion anterior y mayor que la siguiente: nuestro p esta a la izquierda
3) El numero del vector en esa posicion es mayor que la posicion anterior y tambien mayor que la siguiente: ese es el p que buscamos*/



int unimodalDivide(int *v, int start, int end){
    bool found = false;
    int middle = (end+start)/2;
    if (middle > start){
        if(v[middle-1] < v[middle] && v[middle] < v[middle+1])
           unimodalDivide(v, middle, end);
    
        else if(v[middle-1] > v[middle] && v[middle] > v[middle+1])
           unimodalDivide(v, start, middle);
    
        else if(v[middle-1]<v[middle] && v[middle] > v[middle-1])
            found = true;
    
        if(found)
            return middle;
    }
    else{
        return v[start] <= v[end]? end : start;
    }
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

    results = unimodalDivide(&v[0],0,v.size());

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
