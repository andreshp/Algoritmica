//////////////////////////////////////////////////////////////////////////////////////////
// Author: A.Herrera, A. Moya, I. Sevillano, J.L. Suárez
// Date: 10, April, 2015
// Algoritmica - Práctica 2 - Divide y Vencerás - Problema 6 - Algoritmo recursivo
//////////////////////////////////////////////////////////////////////////////////////////

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
           return unimodalDivide(v, middle, end);
        else if(v[middle-1] > v[middle] && v[middle] > v[middle+1])
           return unimodalDivide(v, start, middle);    
        else if(v[middle-1]<v[middle] && v[middle] > v[middle-1])
            return middle;
    }
    else{
        return v[start] <= v[end]? end : start;
    }
}

//--------------- MAIN -----------------//
int main(int argc, char *argv[]){
    if(argc != 3){
        cerr << "Sintaxis: ./unimodalDivide <options> <vector size> <number repetitions> \n     If option -t is given, instead of vector size and number of repetitions provide a test case file." << endl;
        exit(-1);
    }
    
    // Variables
    int results; vector <int> v; int v_i;
    double tv_usecs = 0;
    srand(time(0));

    // Si el programa es ./unimodalDivide <vector size> <number repetitions>
    if (argv[1] != "-t"){
        int v_size = atoi(argv[1]);
        int num_repetitions = atoi(argv[2]);
        v.resize(v_size);
        // Repeat the algorithm num_repetitions times
        for (int i = 0; i < num_repetitions; i++){
            // Build random vector
            int p = 1 + rand() % (v_size-2);
            v[p] = v_size-1;
            for (int i=0; i<p; i++) v[i]=i;
            for (int i=p+1; i<v_size; i++) v[i]=v_size-1-i+p;

            // Variables de tiempo
            struct timeval tv1, tv2;

            // Execute algorithm
            gettimeofday(&tv1,NULL);
            results = unimodalDivide(&v[0], 0, v.size());
            gettimeofday(&tv2,NULL);
            tv_usecs += ((tv2.tv_sec -tv1.tv_sec )*1E6 + (tv2.tv_usec-tv1.tv_usec)) / 1000000.0;
        }
        tv_usecs /= num_repetitions;
    }
    // Si el programa es ./unimodalDivide -t <test.txt>
    else{
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
        // Variables de tiempo
        struct timeval tv1, tv2;
        //Ejecucion del algoritmo.
        gettimeofday(&tv1,NULL);
        results = unimodalDivide(&v[0], 0, v.size());
        gettimeofday(&tv2,NULL);
        tv_usecs = ((tv2.tv_sec -tv1.tv_sec )*1E6 + (tv2.tv_usec-tv1.tv_usec)) / 1000000.0;
    }

    cout << "Vector size: " << v.size() << "\n";

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
        cout << tv_usecs << endl;
    #endif

    return 0;
}