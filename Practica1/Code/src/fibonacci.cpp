/**
   @file Cálculo de la sucesión de Fibonacci
*/

   
#include <iostream>
using namespace std;
#include <ctime>
#include <cstdlib>


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


int main(int argc, char * argv[])
{

  if (argc != 2)
  {
    cerr << "Formato " << argv[0] << " <índice>" << endl;
    return -1;
  }

  int n = atoi(argv[1]);

  int f;
 
  f = fibo(n);

  return 0;
}
 
