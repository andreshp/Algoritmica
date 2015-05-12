#include <sys/time.h>
#include <utility>
#include <vector>
#include <set>
#include <list>
#include <iostream>
#include <fstream>
#include <string>
#include <stdlib.h>

//#define PRUEBA

using namespace std;

int main(){

struct timeval tv1, tv2;        // gettimeofday() secs-usecs
double tv_usecs;

list<int> mylist;
srand((unsigned)time(NULL));
int a = rand() % 10 + 1; //1 to 10    
for (int i =0; i < a; i++){
    int b = rand() % 20 + 1;
    mylist.push_back(b);
}

/*cout << "Lista con los tiempos de atención a los clientes: ";
for(list<int>::iterator it=mylist.begin(); it != mylist.end(); ++it)
    cout << ' ' << *it;

cout << '\n';*/

gettimeofday(&tv1,NULL);
mylist.sort();
gettimeofday(&tv2,NULL);
/*cout << "Lista de tiempos a los que antes se atenderá: ";
for(list<int>::iterator it=mylist.begin(); it != mylist.end(); ++it)
    cout << ' ' << *it;
cout << "\n";*/

 #ifdef PRUEBA
 cout << "Lista de tiempos a los que antes se atenderá: ";
 for(list<int>::iterator it=mylist.begin(); it != mylist.end(); ++it)
    cout << ' ' << *it;
 cout << "\n";
 cout << "Tiempo: " << tv_usecs << "\n";
 #else
 cout << "Tiempo: " << tv_usecs << "\n";
 #endif
 }
