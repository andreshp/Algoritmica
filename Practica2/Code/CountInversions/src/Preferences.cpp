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

/**
  * @brief Function which merges two sorted sequences to get a new complete sorted sequence.
  * @brief While merging the function also counts the number of inversions produced.
  * @param v Array with the sequences.
  * @param begin Index of the first element in the first sequence.
  * @param middle Index of the next-to-last element in the first sequence,
  * which is also the first element in the second sequence.
  * @param end Index of the next-to-last element in the second sequence.
  * @return Number of inversions in the subarray.
  * @pos Subarray [begin,end[ gets merged.
  */
unsigned long long mergeAndCount(int *v, int begin, int middle, int end){
    //Auxiliar array to keep sorted items;
    int *sorted = new int[(unsigned)(end - begin)];

    //Inversions, left-array index, right-array index, sorted-array index, respectively.
    unsigned long long invs = 0, j = middle, i = begin, k = 0;
    
    while(i < middle){
        if(j < end){
            //Case no inverted items: the leftest one is added to sorted array. Next left item is taken.
            //No inversions are added.
            if(v[i] <= v[j]){
                sorted[k] = v[i];
                k++; i++;
            }
            //Case inverted items: the rightest one is added to sorted array. Next right item is taken.
            //Inversions are added, as much as remaining size of left array.
            else{
                sorted[k] = v[j];
                k++;j++;
                invs += (middle -i);
            }
        }
        else{   //Add remaining items from left array, if necessary.
            sorted[k] = v[i];
            k++; i++;
        }
    }

    //Add remaining items from right array, if necessary.
    while(j < end){
        sorted[k] = v[j];
        k++; j++;
    }

    //Sorted array is copied in v.
    for(int r = 0; r < end - begin; r++){
        v[r+begin] = sorted[r];
    }
    
    //Sorted auxiliar array is deleted.
    delete [] sorted;

    return invs;
}

/**
  * @brief Recursive function which counts the number of inversions between two elements of an array.
  * @param v Array which contains the subarray to count.
  * @param begin Index of first element of the subarray to count.
  * @param end Index of the next-to-last element of the subarray to count.
  * @return Number of inversions in the subarray [begin, end[.
  * @pos Subarray [begin,end[ gets sorted.
  */
unsigned long long sortAndCount(int *v, int begin, int end){
    int middle = (begin + end) / 2;
    unsigned long long invs = 0;

    //If left subarray has more than one item, function is called with left subarray.
    if(middle - begin > 1)
        invs += sortAndCount(v,begin,middle);

    //If right subarray has more than one item, function is called with right subarray.
    if(end - middle > 1)
        invs += sortAndCount(v,middle,end);

    //After getting both array halves sorted, they get merged.
    if(begin < middle && middle < end)
        invs += mergeAndCount(v,begin,middle,end);

    return invs;
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

    inversions = sortAndCount(&v[0],0,v.size());

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
