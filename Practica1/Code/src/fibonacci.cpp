/**
   @file Cálculo de la sucesión de Fibonacci
*/

   
#include <iostream>
using namespace std;
#include <ctime>


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

  f = fibo(n);

  cout << "El término " << n << "-ésimo es: " << f << endl;

  return 0;
}
 
