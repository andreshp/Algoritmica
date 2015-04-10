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


unsigned long long BubleCount(int * v, int begin,unsigned int tam){
  int i, j;
  int aux;
  unsigned long long count = 0;
  for (i = begin; i < tam -1; i++){
    for (j = tam -1; j > i; j--){
      if (v[j] < v[j-1]){
        aux = v[j];
        v[j] = v[j-1];
        v[j-1] = aux;
        count++;
      }
    }
  }
  return count;
}

unsigned long long BubleCount(vector<int> v){
  return BubleCount(&v[0],0,v.size());
}



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

    inversions = BubleCount(&v[0],0,v.size());

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
