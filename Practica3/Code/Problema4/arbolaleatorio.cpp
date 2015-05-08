#include <iostream>
using namespace std;
//#include <ctime>
#include <cstdlib>
#include <cassert>
#include <list>
#include <set>
#include <utility> //Para pair
//genera un arbol aleatorio con un numero (numnodes) de nodos y un maximo (maxh) de hijos de cada nodo

list<int> cola;

double uniforme() //Genera un número uniformemente distribuido en el
                  //intervalo [0,1) a partir de uno de los generadores
                  //disponibles en C. 
{
   int t = rand();
   double f = ((double)RAND_MAX+1.0);
   return (double)t/f;
}

bool** generaArbolAleatorio(int numnodes, int maxh,set<pair<int,int> > &aristas){
  srand(time(NULL));
  bool **v;
  aristas.clear();
  v =  new bool * [numnodes];
    assert(v);

   for (int i = 0; i < numnodes; i++)
        v[i]= new bool [numnodes];
  int n=1; //cuenta el número de nodos generados hasta ahora
  int i=0; //etiqueta del nodo
  cola.push_back(i); //es una cola FIFO
  while (n < numnodes) {
      i=cola.front();
      cola.pop_front();
      double u=uniforme();
      int ch=1+(int)(maxh*u); //entero aleatorio entre 1 y maxh
      if ((ch+n) > numnodes) ch=numnodes-n; //para no generar más de numnodes nodos
      for (int j=n; j<ch+n; j++) {
        aristas.insert(pair<int,int>(i,j));
         v[i][j]=true; //v es la matriz de adyacencia del árbol
         v[j][i]=true;
         cola.push_back(j);
      }
      n=n+ch;
  }
  while (!cola.empty()) cola.pop_front();

  return v;
}
