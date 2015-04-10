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
    
#define PRINT_P     //Descomentar para obtener la posicion p.
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

//--------------- MAIN -----------------//
int main(int argc, char *argv[]){
    if(argc != 3){
        cerr << "Sintaxis: ./unimodalTrivial <options> <vector size> <number repetitions> \n     If option -t is given, instead of vector size and number of repetitions provide a test case file." << endl;
        exit(-1);
    }
    
    int results; vector <int> v; int v_i;

    // Variables de tiempo
    struct timeval tv1, tv2;
    double tv_usecs = 0;
    srand(time(0));

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

            // Execute algorithm
            gettimeofday(&tv1,NULL);
            results = unimodalTrivial(&v[0], v.size());
            gettimeofday(&tv2,NULL);
            tv_usecs += ((tv2.tv_sec -tv1.tv_sec )*1E6 + (tv2.tv_usec-tv1.tv_usec)) / 1000000.0;
        }
        tv_usecs /= num_repetitions;
    }
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
        //Ejecucion del algoritmo.
        gettimeofday(&tv1,NULL);
        results = unimodalTrivial(&v[0], v.size());
        gettimeofday(&tv2,NULL);
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
        
        // Tiempo gastado.
        tv_usecs= ((tv2.tv_sec -tv1.tv_sec )*1E6 + (tv2.tv_usec-tv1.tv_usec)) / 1000000.0;
        cout << tv_usecs << endl;
    #endif

    return 0;
}