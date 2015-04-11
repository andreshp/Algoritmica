///////////////////////////////////////////////////////////////////////////////////////////
// Author: A.Herrera, A. Moya, I. Sevillano, J.L. Suárez
// Date: 10, April, 2015
// Algoritmica - Práctica 2 - Divide y Vencerás - Problema 2 - Algoritmo inserción
////////////////////////////////////////////////////////////////////////////////////////// 
 
# include <iostream>
# include <ctime>
# include <cstdlib>
# include <climits>
# include <cassert>

# include <sys/time.h>  // gettimeofday(), struct timeval
# include <stdio.h>     // printf()
#include <stdlib.h>
#include <sys/time.h>
#include <vector>
#include <fstream>

using namespace std;

//#define PRINT_INV   //Uncomment this line to print number of inversions.
#define PRINT_TIME  //Uncomment this line to print elapsed time.
//#define PRINT_TEXT  //Uncomment this line to print text while showing the results.
#define RAND

/*  Método de ordenación por inserción  */
/**
   @brief Ordena un vector por el método de inserción.

   @param T: vector de elementos. Debe tener num_elem elementos.
             Es MODIFICADO.
   @param num_elem: número de elementos. num_elem > 0.

   Cambia el orden de los elementos de T de forma que los dispone
   en sentido creciente de menor a mayor.
   Aplica el algoritmo de inserción.
*/
unsigned long long insercion(int T[], int num_elem);



/**
   @brief Ordena parte de un vector por el método de inserción.

   @param T: vector de elementos. Tiene un número de elementos 
                   mayor o igual a final. Es MODIFICADO.
   @param inicial: Posición que marca el incio de la parte del
                   vector a ordenar.
   @param final: Posición detrás de la última de la parte del
                   vector a ordenar. 
       inicial < final.

   Cambia el orden de los elementos de T entre las posiciones
   inicial y final - 1de forma que los dispone en sentido creciente
   de menor a mayor.
   Aplica el algoritmo de inserción.
*/
unsigned long long insercion_lims(int T[], int inicial, int final);


/**
   Implementación de las funciones
**/
unsigned long long insercion(int T[], int num_elem) {
    insercion_lims(T, 0, num_elem);
}


unsigned long long insercion_lims(int T[], int inicial, int final) {
    unsigned long long counts = 0;
    int i, j;
    int aux;
    for (i = inicial + 1; i < final; i++) {
        aux = T[i];
        for (j = i-1; j >= 0 && T[j] > aux; j--){
            T[j+1] = T[j];
        }
        T[j+1] = aux;
        counts += (i-j-1);
    }
    return counts;
}

/**
  * @brief Main program.
  * @param argv[1] Name of sequence's file.
  * @pos If PRINT_INV is defined, the number pf inversions will be shown at STDOUT.
  * @pos If PRINT_TIME is defined, elapsed time will be shown at STDOUT.
  */
int main(int argc, char *argv[]){
    
    if(argc != 2){
        cerr << "Expected a file name or a number." << endl;
        exit(-1);
    }
        
    unsigned long long inversions = 0;
    vector <int> v;
    int v_i;

    // Time variables
    struct timeval tv1, tv2;        // gettimeofday() secs-usecs
    double tv_usecs; 

    //Data reading
    #ifndef RAND
    ifstream in(argv[1]);
    if(!in){
        cerr << "Error: cannot open the file." << endl;
        exit(-1);
    }
    
    while(!in.eof()){
        if(in >> v_i)
            v.push_back(v_i);
    }
    #else
    int tam = atoi(argv[1]);
    for(int i = 0; i < tam; i++){
        v.push_back(rand());
    }

    #endif

    //Algorithm execution.
    gettimeofday(&tv1,NULL);
    inversions = insercion(&v[0], v.size());
    gettimeofday(&tv2,NULL);

    //cout << v.size();

    //Results.
    #ifdef PRINT_INV
        #ifdef PRINT_TEXT
            cout << "Number of inversions: ";
        #endif
        cout << inversions << endl;
    #endif

    #ifdef PRINT_TIME
        #ifdef PRINT_TEXT
            cout << "Elapsed time: ";
        #endif
        
        // Elapsed time.
        tv_usecs= ((tv2.tv_sec -tv1.tv_sec )*1E6 + (tv2.tv_usec-tv1.tv_usec)) / 1000000.0;
        cout << tv_usecs << endl;
    #endif

    return 0;
}
