//////////////////////////////////////////////////////////////////////////////////////////
// Author: A.Herrera, A. Moya, I. Sevillano, J.L. Suárez
// Date: 10, April, 2015
// Algoritmica - Práctica 2 - Divide y Vencerás - Problema 2 - Quicksort
//////////////////////////////////////////////////////////////////////////////////////////
   
#include <iostream>
#include <stdlib.h> 
#include <sys/time.h>
#include <vector>
#include <fstream>

using namespace std;

//#define PRINT_INV   //Uncomment this line to print number of inversions.
#define PRINT_TIME  //Uncomment this line to print elapsed time.
//#define PRINT_TEXT  //Uncomment this line to print text while showing the results.
#define RAND

// Global vector for quicksort partition:
#define MAX 1 << 25
int v_aux[MAX];

/* ************************************************************ */ 
/*  Método de ordenación rápida  */

/**
   @brief Make a quicksort algorithm and counts the number of inversions.
j
   @param T: That is the vector that will be ordered and where we count the
            number of inversions.
   @param num_elem: Number of elements of the vector. num_elem > 0.

   Sort a vector by using the quicksort method and counts the number of 
   inversion of a vector.
*/
inline unsigned long long quicksort(vector <int> &T, int num_elem);



/**
   @brief Sort part of a vector.

   @param T: Vector modified-
   @param inicial: First position it should count and sort from.
   @param final: The next one of last position it should sort and
               count from.
       inicial < final.

   It sort the part of the vector from the least to the greater one and
   count the number of inversions it makes to change it.
*/
unsigned long long quicksort_lims(vector <int> &T, int inicial, int final);


/**
   @brief Change the position of a pivot to a position where
   the biggers ones are at his rigth side ant the less ones are 
    at his left side and counts the inversions he did.

   @param T: Vector modified-
   @param inicial: First position it should count and sort from.
   @param final: The next one of last position it should sort and
               count from.
       inicial < final.
   @param pp: pivot position. It is MODIFIED.

   Select a pivot to sort the vector from inicial to final - 1
   and sort each part. At the same time, he counts the inversions he did to
   sort it.
*/
unsigned long long dividir_qs(vector <int> &T, int inicial, int final, int & pp);


inline unsigned long long quicksort(vector <int> &T, int num_elem)
{
  return quicksort_lims(T, 0, num_elem);
}

unsigned long long quicksort_lims(vector <int> &T, int inicial, int final){
  int k;
  unsigned long long contador = 0;
  if(inicial+1 < final){
    contador = dividir_qs(T, inicial, final, k);
    contador += quicksort_lims(T, inicial, k);
    contador += quicksort_lims(T, k+1, final);
  }

  return contador;
}

unsigned long long dividir_qs(vector <int> &T, int inicial, int final, int & pp){
    int pivote  = T[inicial];
    unsigned long long contador = 0;
    int j = 0, i;
    unsigned long long count_bigger = 0;

    // Print pre partition
//    cout << "Prepartition:" << endl;
//    for (i = inicial; i < final; i++){
//      cout << T[i] << " ";
//    }
//    cout << endl; 

    for (i = inicial+1; i < final; i++){
        if(T[i] < pivote){
            v_aux[j] = T[i];
            j++;
            contador += count_bigger;
        }
        else{
            count_bigger++;
        }
    }
    pp = inicial+j;
    for (i = inicial+1; i < final; i++){
        if (T[i] >= pivote){
            v_aux[j] = T[i];
            j++;
        }
    }
    j = 0;
    for (i = inicial; i < pp; i++) {
        T[i] = v_aux[j]; j++;
    }
    T[pp] = pivote;
    contador += j;
    for (i = pp+1; i < final; i++) {
        T[i] = v_aux[j]; j++;
    }

    //  cout << "Inversions: " << contador << endl;
    // Print post partition
//    cout << "Postpartition:" << endl;
//    for (i = inicial; i < final; i++){
//      cout << T[i] << " ";
//    }
//    cout << endl; 
//    cout << "Inversions: " << contador << endl;
    return contador;
}


/**
  * @brief Main program.
  * @param argv[1] Name of sequence's file.
  * @pos If PRINT_INV is defined, the number pf inversions will be shown at STDOUT.
  * @pos If PRINT_TIME is defined, elapsed time will be shown at STDOUT.
  */
int main(int argc, char *argv[]){
    if(argc != 2){
        cerr << "Expected a file name." << endl;
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
            cerr << "Error: cannot open the file or a number." << endl;
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

    inversions = quicksort(v, v.size());

    gettimeofday(&tv2,NULL);

    //cout << "Vector Size: " << v.size() << endl;

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

 
