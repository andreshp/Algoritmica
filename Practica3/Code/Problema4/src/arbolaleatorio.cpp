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

bool** generaArbolAleatorio(int numnodes, int maxh){
  srand(time(NULL));
  bool **v;
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
         v[i][j]=true; //v es la matriz de adyacencia del árbol
         v[j][i]=true;
         cola.push_back(j);
      }
      n=n+ch;
  }
  while (!cola.empty()) cola.pop_front();

  return v;
}
int main(int argc, char const *argv[])
{
  if(argc < 3){
    cout << "Error de formato: ./arbolaleatorio <numero nodos> <hijos maximos>" <<endl;
    return -1;
  }
  int num_nodos = atoi(argv[1]);
  int maxhijos = atoi(argv[2]);
  bool ** grafo = generaArbolAleatorio(num_nodos,maxhijos);
  cout << num_nodos << endl;
  for( int i = 0; i < num_nodos; i++){
    for(int j = 0; j < num_nodos; j++){
      cout << " " << grafo[i][j];
    }
    cout << endl;
  }
  return 0;
}
