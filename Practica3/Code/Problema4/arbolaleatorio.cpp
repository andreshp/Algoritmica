#include <iostream>
using namespace std;
//#include <ctime>
#include <cstdlib>
#include <cassert>
#include <list>
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

int main(int argc, char * argv[])
{

  if (argc != 3)
    {
      cerr << "Formato " << argv[0] << " <num_nodes>" <<  " <num_hijos_max>" << endl;
      return -1;
    }

  int numnodes = atoi(argv[1]);
  int maxh=atoi(argv[2]);


srand(time(NULL));
int **v;
v =  new int * [numnodes];
  assert(v);

 for (int i = 0; i < numnodes; i++)
      v[i]= new int [numnodes];
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
       v[i][j]=1; //v es la matriz de adyacencia del árbol
       cola.push_back(j);
    }
    n=n+ch;
}
while (!cola.empty()) cola.pop_front();

for (int i=0; i<numnodes; i++) {
 for (int j=0; j<numnodes; j++)
   cout << v[i][j] << " ";
 cout << " " << endl;
}
}
