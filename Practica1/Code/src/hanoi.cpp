/**
   @file Resolución del problema de las Torres de Hanoi
*/

   
#include <iostream>
using namespace std;
#include <ctime>
#include <cstdlib>

# include <sys/time.h>  // gettimeofday(), struct timeval
# include <stdio.h>     // printf()



/**
   @brief Resuelve el problema de las Torres de Hanoi
   @param M: número de discos. M > 1.
   @param i: número de columna en que están los discos.
             i es un valor de {1, 2, 3}. i != j.
   @param j: número de columna a que se llevan los discos.
             j es un valor de {1, 2, 3}. j != i.

   Esta función imprime en la salida estándar la secuencia de 
   movimientos necesarios para desplazar los M discos de la
   columna i a la j, observando la restricción de que ningún
   disco se puede situar sobre otro de tamaño menor. Utiliza
   una única columna auxiliar.
*/
void hanoi (int M, int i, int j);




void hanoi (int M, int i, int j)
{
  if (M > 0)
    {
      hanoi(M-1, i, 6-i-j);
      //cout << i << " -> " << j << endl;
      hanoi (M-1, 6-i-j, j);
  }
}

int main(int argc, char * argv[])
{
  
    if (argc != 2)
    {
      cerr << "Formato " << argv[0] << " <num_discos>" << endl;
      return -1;
    }

  int M = atoi(argv[1]);

  // Variables para medir el tiempo
    struct timeval tv1, tv2; // gettimeofday() secs-usecs
    double           tv_usecs; // y sus cuentas
    
    //----------- Ejecución del algoritmo -----------//
    gettimeofday(&tv1,NULL);

  hanoi(M, 1, 2);

  gettimeofday(&tv2,NULL);

  tv_usecs= ((tv2.tv_sec -tv1.tv_sec )*1E6 + (tv2.tv_usec-tv1.tv_usec)) / 1000000.0;
    cout << tv_usecs << endl;

  return 0;
}
 
