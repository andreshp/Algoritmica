/**
   @file Cálculo de la sucesión de Fibonacci
*/

   
#include <iostream>
using namespace std;
#include <ctime>

# include <sys/time.h>  // gettimeofday(), struct timeval
# include <stdio.h>     // printf()


/**
   @brief Calcula el término n-ésimo de la sucesión de Fibonacci.

   @param n: número de orden del término buscado. n >= 1.

   @return: término n-ésimo de la sucesión de Fibonacci.
*/
int fibo(int n)
{
  if (n < 2)
    return 1;
  else
    return fibo(n-1) + fibo(n-2);
}


int main()
{

  int n;
  int f;
 
  cout << "¿Número del término: ";
  cin >> n;

// Variables para medir el tiempo
    struct timeval tv1, tv2; // gettimeofday() secs-usecs
    double           tv_usecs; // y sus cuentas
    
    //----------- Ejecución del algoritmo -----------//
    gettimeofday(&tv1,NULL);

  f = fibo(n);

  gettimeofday(&tv2,NULL);

  tv_usecs= ((tv2.tv_sec -tv1.tv_sec )*1E6 + (tv2.tv_usec-tv1.tv_usec)) / 1000000.0;
    cout << tv_usecs << endl;

  return 0;
}
 
