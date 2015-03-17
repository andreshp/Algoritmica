---
title: 'Algorítmica: Práctica 1'
author: "Andrés Herrera Poyatos, Antonio Rafael Moya Martín-Castaño, Iván Sevillano García, Juan Luis Suárez Díaz"
date: "15/3/2015"
output:
  pdf_document:
    highlight: zenburn
    toc: yes
    includes:
        in_header:
            mystyles.sty
---

$\pagebreak$

# Organización de la práctica

Se adjunta el directorio comprimido **code** con todos los datos obtenidos. La información se organiza como sigue:

- Los códigos **.cpp** de los distintos algoritmos están disponibles en la carpeta **src**.
- Se añade el script de bash **ejecuciones.sh**, el cual se encarga de obtener todos los datos y gráficas para todos los
  algoritmos.
- En la carpeta **sh** se añaden scripts auxiliares, cada uno especializado en la toma de datos de uno o varios
  algoritmos concretos.
- En la carpeta **plot**, de la misma forma, se encuentran scripts especializados en la elaboración de las distintas
  gráficas.
- En las carpetas **Datos**___Autor___ se almacenan los archivos .dat generados por cada uno de los autores,
  en sus respectivos PCs. Los ficheros contienen, para cada algoritmo, varias parejas *[tamaño tiempo]* correspondientes
  a distintas ejecuciones del programa con distintos tamaños y sus respectivos resultados.
  con los datos utilizados en el trabajo.
- De forma análoga, están disponibles los directorios **Tablas**___Autor___ e **Imagenes**___Autor___ que contienen tablas
  en formato **.md** con los resultados, y las gráficas del comportamiento de los algoritmos generadas por *gnuplot*,
  respectivamente.

Cada ejercicio tiene su apartado en el pdf con su corresponiente enunciado y solución.

***Nota:*** Se ha utilizado el shell bash para la obtención de los distintos datos de los algoritmos.

# Ejercicio 1: Cálculo de la eficiencia empírica

Calcule la eficiencia empírica de los algoritmos pedidos. Defina adecuadamente los tamaños de entrada para que se generen 
al menos 25 datos. Incluya en la memoria tablas diferentes para los algoritmos de distinto orden de eficiencia (una con los
algoritmos $O(n^2)$, otra con los $O(n \log{n})$, otra con $O(n^3)$ y otra con $O((\frac{1+\sqrt{5}}{2})^n)$.

A continuación se disponen las distintas tablas para cada clase de algoritmos:

## Tabla con los algoritmos cuadráticos

| Tamaño del Vector | Burbuja | Seleccion | Insercion |
|-------------------|---------|-----------|-----------|
|1000|0.005971|0.003397|0.001321|
|2000|0.018136|0.009589|0.007588|
|3000|0.024143|0.014704|0.020282|
|4000|0.043267|0.025817|0.023064|
|5000|0.067684|0.037817|0.034221|
|6000|0.099499|0.055028|0.047872|
|7000|0.137072|0.073739|0.064517|
|8000|0.181558|0.092111|0.082905|
|9000|0.232648|0.118624|0.103043|
|10000|0.290489|0.14394|0.124546|
|11000|0.354349|0.178614|0.151216|
|12000|0.433737|0.20678|0.178228|
|13000|0.519202|0.239558|0.209278|
|14000|0.59308|0.273397|0.248141|
|15000|0.689312|0.314147|0.276967|
|16000|0.789129|0.356495|0.317291|
|17000|0.890449|0.402106|0.358508|
|18000|1.01538|0.450575|0.397242|
|19000|1.1313|0.50472|0.435913|
|20000|1.26128|0.55525|0.483853|
|21000|1.39441|0.611367|0.541654|
|22000|1.55788|0.670662|0.600085|
|23000|1.68169|0.732809|0.644882|
|24000|1.84769|0.800821|0.70273|
|25000|1.9893|0.864984|0.762199|


## Tabla con los algoritmos cúbicos ##

| Nodos del Grafo | Floyd |
|-----------------|-------|
|32|0.000596|
|64|0.004593|
|96|0.01017|
|128|0.017141|
|160|0.035407|
|192|0.054113|
|224|0.083649|
|256|0.116013|
|288|0.153556|
|320|0.217792|
|352|0.280357|
|384|0.362685|
|416|0.460287|
|448|0.581175|
|480|0.703839|
|512|0.852424|
|544|1.02124|
|576|1.25977|
|608|1.44669|
|640|1.68365|
|672|1.93344|
|704|2.23303|
|736|2.54158|
|768|2.89293|
|800|3.25971|


## Tabla con el algoritmo de Fibonacci ($O((\frac{1+\sqrt{5}}{2})^n)$) ##

| Índice | Fibonacci |
|--------|-----------|
|15|1.3e-05|
|16|2e-05|
|17|2.6e-05|
|18|4.4e-05|
|19|5e-05|
|20|0.000114|
|21|8.6e-05|
|22|0.000154|
|23|0.000582|
|24|0.00097|
|25|0.001314|
|26|0.002554|
|27|0.002394|
|28|0.003356|
|29|0.004289|
|30|0.007083|
|31|0.011583|
|32|0.017354|
|33|0.029313|
|34|0.047371|
|35|0.073093|
|36|0.127835|
|37|0.190808|
|38|0.308124|
|39|0.498824|
|40|0.849934|


## Tabla con el algoritmo de Hanoi ($O(2^n))$) ##

| Num. Discos | Hanoi |
|-------------|-------|
|5|1e-06|
|6|3e-06|
|7|3e-06|
|8|6e-06|
|9|9e-06|
|10|1.3e-05|
|11|4.9e-05|
|12|7.6e-05|
|13|0.00015|
|14|0.00019|
|15|0.000393|
|16|0.000851|
|17|0.002302|
|18|0.003382|
|19|0.009191|
|20|0.019015|
|21|0.024593|
|22|0.041194|
|23|0.065421|
|24|0.127555|
|25|0.246427|
|26|0.483075|
|27|0.96832|
|28|1.9249|
|29|3.83247|
|30|7.63996|

## Tabla con los algoritmos n log n ##

| Tamaño del Vector | Mergesort | Quicksort |
|-------------------|-----------|-----------|
|40000|0.015087|0.006235|
|80000|0.02682|0.014736|
|120000|0.037756|0.02246|
|160000|0.041266|0.025439|
|200000|0.059359|0.032775|
|240000|0.057706|0.041055|
|280000|0.065938|0.045861|
|320000|0.082393|0.053183|
|360000|0.093771|0.057395|
|400000|0.107337|0.063843|
|440000|0.102685|0.071064|
|480000|0.122825|0.076521|
|520000|0.136037|0.082585|
|560000|0.141045|0.087434|
|600000|0.150005|0.093448|
|640000|0.1658|0.100634|
|680000|0.181068|0.109131|
|720000|0.211107|0.115456|
|760000|0.205422|0.121493|
|800000|0.226734|0.129283|
|840000|0.200972|0.136155|
|880000|0.211482|0.141553|
|920000|0.23571|0.148845|
|960000|0.240497|0.155352|
|1000000|0.244299|0.178312|


Finalmente, mostramos una tabla con la comparativa de todos los algoritmos de ordenación, tanto cuadráticos como $n \log{n}$.
Podemos apreciar, que para tamaños relativamente pequeños (25.000), ya se muestran diferencias bastante grandes:

## Tabla con los algoritmos de ordenación ##

| Tamaño del Vector | Burbuja | Seleccion | Insercion | Mergesort | Quicksort |
|-------------------|---------|-----------|-----------|-----------|-----------|
|1000|0.005971|0.003397|0.001321|0.000359|0.000195|
|2000|0.018136|0.009589|0.007588|0.000756|0.000269|
|3000|0.024143|0.014704|0.020282|0.00074|0.000671|
|4000|0.043267|0.025817|0.023064|0.000748|0.00067|
|5000|0.067684|0.037817|0.034221|0.002255|0.000567|
|6000|0.099499|0.055028|0.047872|0.001549|0.001661|
|7000|0.137072|0.073739|0.064517|0.003041|0.001953|
|8000|0.181558|0.092111|0.082905|0.003166|0.002456|
|9000|0.232648|0.118624|0.103043|0.004058|0.001649|
|10000|0.290489|0.14394|0.124546|0.003803|0.001971|
|11000|0.354349|0.178614|0.151216|0.004144|0.002048|
|12000|0.433737|0.20678|0.178228|0.0041|0.003616|
|13000|0.519202|0.239558|0.209278|0.005279|0.003037|
|14000|0.59308|0.273397|0.248141|0.006677|0.002399|
|15000|0.689312|0.314147|0.276967|0.006024|0.002247|
|16000|0.789129|0.356495|0.317291|0.007461|0.002721|
|17000|0.890449|0.402106|0.358508|0.006324|0.002745|
|18000|1.01538|0.450575|0.397242|0.008806|0.005765|
|19000|1.1313|0.50472|0.435913|0.008887|0.004034|
|20000|1.26128|0.55525|0.483853|0.007868|0.003407|
|21000|1.39441|0.611367|0.541654|0.00544|0.00359|
|22000|1.55788|0.670662|0.600085|0.006238|0.00374|
|23000|1.68169|0.732809|0.644882|0.010339|0.006076|
|24000|1.84769|0.800821|0.70273|0.010512|0.006921|
|25000|1.9893|0.864984|0.762199|0.009398|0.003104|

$\pagebreak$

# Ejercicio 2: Elaboración de gráficas.

Con cada una de las tablas anteriores, genere un gráfico comparando los tiempos de los algoritmos. Indique claramente el significado de cada serie. Para los algoritmos que realizan la misma tarea (los de ordenación), incluya también una gráfica con todos ellos, para poder apreciar las diferencias de rendimiento de algoritmos con diferente orden de eficiencia.

## Gráfica comparativa de los algoritmos cuadráticos. ##

$\centerline{\includegraphics[height=7cm]{../Code/ImagenesAndres/cuadraticos.png}}$

Cabe destacar, que dentro de los algoritmos cuadráticos también existen ciertas diferencias; a continuación, vamos a exponerlas. Como se puede observar, el algoritmo de la burbuja emplea un mayor tiempo que los otros dos. La causa, viene determinada por dos hechos que cabe nombrar: el primero, y que no se debe pasar por alto, es que los vectores se generan de manera aleatoria, y por lo tanto, varía el tiempo que se puede dedicar a la ordenación en función a cómo quede estructurado el vector (por ejemplo, si hay un mayor número de elementos bien ordenados en un caso que en otro, se ahorra tiempo). Pero el hecho de que sea algo más lento el método de la burbuja no sólo se debe a que los vectores se generen aleatoriamente, sino que aquí entra en juego el segundo factor determinante. Aunque el método de la burbuja hace el mismo número de comprobaciones que el de selección, pues recorremos el vector el mismo número de veces, en el método de la burbuja se realizan un mayor número de intercambios, lo que supone cierto coste (en el de selección hay un sólo intercambio cada vez que se recorre el vector, pues siempre se busca el mínimo y se coloca al principio). Todo ésto se traduce en la diferencia que podemos ver en la gráfica entre el algoritmo de burbuja y el de selección.

Veamos ahora, que el de insercción, de los tres es el mejor. De nuevo entra en juego que los vectores se generen aleatoriamente, pero también, y como factor principal, está el hecho de que el algoritmo de insercción, en su peor caso (vector totalmente invertido) funciona igual que el de selección. Pero es sencillo ver, que el método de insercción requiere un coste menor, pues coloca el elemento mínimo entre un conjunto i de elementos al principio de dicho conjunto de elementos, con lo que se consigue una eficiencia algo mejor (aunque bastante similar como se ve en las gráficas), que el algoritmo de selección.

## Gráfica del algoritmo cúbico (Floyd) ##

$\centerline{\includegraphics[height=7cm]{../Code/ImagenesAndres/cubicos.png}}$

Contrastando con las gráficas anteriores, podemos ver que existe una gran diferencia entre los algoritmos cuadráticos y el algoritmo de Floyd, que es cúbico (éste último emplea un tiempo mucho mayor).

Como nota, el algoritmo de Dijkistra resuelve el mismo problema para grafos con pesos no negativos y consigue una eficiencia de $O(n^2 *logn)$, por lo que es mucho más práctico.

## Gráfica del algoritmo de Fibonacci ($O((\frac{1+\sqrt{5}}{2})^n)$) ##

$\centerline{\includegraphics[height=7cm]{../Code/ImagenesAndres/fibonacci.png}}$

Tanto en éste algoritmo, como en el de Hanoi, que cómo podemos observar son de orden exponencial, tenemos que tener en cuenta que los datos que sirven de prueba no pueden ser excesivamente grandes, pues de lo contrario el programa requeriría demasiado tiempo.

## Gráfica del algoritmo de Hanoi ($O(2^n)$) ##

$\centerline{\includegraphics[height=7cm]{../Code/ImagenesAndres/hanoi.png}}$

## Gráfica de los algoritmos $O(n \log{n})$ ##

$\centerline{\includegraphics[height=7cm]{../Code/ImagenesAndres/nlogn.png}}$

En el caso de éstos algoritmos, podemos ver que el el algoritmo quicksort es más rápido. A parte de, cómo se ha explicado antes, el hecho de que los vectores se generan aleatoriamente, aquí debemos tener en cuenta que el algoritmo mergesort utiliza espacio extra, con lo que la reserva de dicho espacio supone un coste de tiempo. 

## Gráfica comparativa con todos los algoritmos de ordenación. ##

$\centerline{\includegraphics[height=7cm]{../Code/ImagenesAndres/ordenacion.png}}$

Por último y a modo de conclusión, podemos observar esta gráfica en la que quedan comparados los algoritmos cuadráticos y los de orden n*log(n), pues el algoritmo de Floyd y los exponenciales deben realizarse con datos de tamaño menor, de forma que la comparación es bastante complicada, aunque claramente, el algoritmo de Floyd requiere mayor tiempo que los cuadráticos y los exponenciales (Hanoi y Fibonacci), un mayor tiempo que todos los demás. 

En cuánto a lo que vemos en esta gráfica, podemos ver la gran diferencia entre los algoritmos quicksort y mergesort y los cuadráticos, principalmente el algoritmo de selección e insercción. Podemos ver también que dentro de este conjunto de algoritmos, como hemos explicado anteriormente, el peor algoritmo es el de la burbuja.

# Comparación de ejecuciones entre los componentes del grupo.

En ésta última sección, vamos a comparar las ejecuciones realizadas en los 4 ordenadores de los componentes del grupo, y veamos las diferencias. Para ello, dentro de cada apartado, vamos a realizar una tabla de tres entradas, colocando en la primera entrada los resultados para el primer dato, en la segunda para un dato medio y en la tercera resultados en el último dato (más grande):

## Comparación algoritmos cuadráticos. ##

En el caso de los cuadráticos, cogemos el método de inserción. 

| Tamaño del Vector | Andrés | Antonio | Iván | Juanlu |
|-------------------|--------|---------|------|--------|
|1000|0.001321|0.003619|0.001556|0.010846|
|13000|0.209278|0.34684|0.262103|1.26515|
|25000|0.762199|1.28187|0.978268|4.59284|

## Comparación algoritmos cúbicos. ##

| Nodos del grafo | Andrés | Antonio | Iván | Juanlu |
|-----------------|--------|---------|------|--------|
|32|0.000596|0.000961|0.000298|0.001617|
|416|0.460287|0.825125|0.586223|3.57139|
|800|3.25971|6.14008|4.15313|25.4081|

## Comparación algoritmo de Fibonacci. ##

| Índice | Andrés | Antonio | Iván | Juanlu |
|--------|--------|---------|------|--------|
|15|1.3e-05|1.5e-05|7e-06|3.2e-05|
|27|0.002394|0.004638|0.003859|0.020256|
|40|0.849934|1.21011|1.03951|4.43443|

## Comparación algoritmo de Hanoi. ##

| Número de discos | Andrés | Antonio | Iván | Juanlu |
|------------------|--------|---------|------|--------|
|5|1e-06|1e-06|1e-06|4e-06|
|17|0.002302|0.002542|0.00182|0.005348|
|30|7.63996|9.44513|9.81995|32.7569|

## Comparación algoritmos n*logn. ##

El algoritmo que comparamos es el quicksort.

| Tamaño del Vector | Andrés | Antonio | Iván | Juanlu |
|-------------------|--------|---------|------|--------|
|40000|0.006235|0.012287|0.007532||
|520000|0.082585|0.118127|0.103365||
|1000000|0.178312|0.229693|0.204994||

<!---
TODO ESTO ESTÁ COMENTADO. LO DEJO COMO MODELO POR SI NECESITÁIS VER CÓMO SE HACE ALGO.
$\centerline{\includegraphics[height=7cm]{./Codigos/Ejercicio2/Imagenes/Trabajo/AlgoritmoBurbuja.png}}$


~~~cpp
void ordenar(int *v, int n) {
    for (int i=0; i<n-1; i++)
        for (int j=0; j<n-i-1; j++)
            if (v[j]>v[j+1]) {
                int aux = v[j];
                v[j] = v[j+1];
                v[j+1] = aux;
            }
}
~~~

Calcule la eficiencia teórica de este algoritmo. 
A continuación replique el experimento que se ha hecho antes (búsqueda lineal) con este nuevo código. Debe:

- Crear un fichero ordenacion.cpp con el programa completo para realizar una ejecución del algoritmo.

- Crear un script ejecuciones_ordenacion.csh en C-Shell que permite ejecutar varias veces el programa anterior y generar un fichero con los datos obtenidos.

- Usar gnuplot para dibujar los datos obtenidos en el apartado previo.

Los datos deben contener tiempos de ejecución para tamaños del vector 100, 600, 1100, ...,
30000.
Pruebe a dibujar superpuestas la función con la eficiencia teórica y la empírica. ¿Qué sucede?

### Cálculo de la eficiencia teórica: ###
El algoritmo de la burbuja es un algoritmo de ordenación sencillo, luego calcularemos
exactamente el número de operaciones realizadas para su posterior exposición en una gráfica.
En primer lugar, es claro que el siguiente código se realiza en tiempo constante:



~~~cpp
if (v[j]>v[j+1]) { // Comparación y acceso a los elementos v[j] y v[j+1]. 3 operaciones.
    int aux = v[j]; // Asignación y acceso al elemento v[j]. 2 operaciones
    v[j] = v[j+1]; // Asignación y acceso a los elementos v[j] y v[j+1]. 3 operaciones.
    v[j+1] = aux; // Asignación y acceso al elemento v[j+1]. 2 operaciones
}
~~~

En total, 10 operaciones. Por cada iteración del bucle interno se realizan las 10 operaciones 
anteriores (en el peor de los casos) más la comparación, el acceso a un vector y el incremento 
correspondientes, 13 operaciones en total. Por otro lado, por cada iteración del bucle externo 
se realizan anlálogamente las 3 operaciones mencionadas más la asignación j=0 junto con la 
ejecución del bucle interno. Se debe sumar la asignación inicial i=0 al resultado de aunar lo 
anterior. Sea $T: \mathbb{N} \rightarrow \mathbb{N}$ la función que dado el número de datos 
nos proporciona el número de operaciones realizadas, utilizando lo anterior podemos calcularla 
como sigue:
$$ T(n) = 1 + \sum_{i=0}^{n-1}4\sum_{j=0}^{n-i-1}13 = 1 + \sum_{i=0}^{n-1}(4+13(n-i)) = 1 + \sum_{i=0}^{n-1}4 + 13\sum_{i=0}^{n-1}(n-i)= $$
$$ 1 + 4n + 1   3\left(\sum_{i=0}^{n-1}n - \sum_{i=0}^{n-1}i\right) = 1 + 4n + 13(n^2 - \frac{n(n-1)}{2}) = 1 + 4n + 13\frac{2n^2 - n^2 + n}{2} = 1  + 13\frac{n^2 + 105n}{2} \ \forall n \in \mathbb{N} $$
De donde es claro que $T \in O(n^2)$ y **el algoritmo de la burbuja es cuadrático**.

### Resultados empíricos: ###

Se muestra a continuación una gráfica con los resultados obtenidos. Es claro que la evolución del tiempo en función
del número de datos se rige bajo una ley cuadrática aunque la pendiente de la misma es suave dada la velocidad del
ordenador al ejecutar una operación.

$\centerline{\includegraphics[height=7cm]{./Codigos/Ejercicio1/Imagenes/Trabajo/AlgoritmoBurbuja.png}}$

Si dibujamos la función obtenida para la eficiencia teórica con gnuplot se ve claramente 
la parábola característica de un algoritmo cuadrático. La forma de las dos imágenes presentadas
es prácticamente equivalente. La única diferencia es el factor de conversión de operaciones a segundos
más el tiempo utilizado por el sistema operativo en aspectos que no tienen que ver con la ejecución 
del algoritmo.

$$ \centerline{\includegraphics[height=7cm]{./Codigos/Ejercicio1/Imagenes/Trabajo/EficienciaTeorica.png}} $$

***

## Ejercicio 2: Ajuste en la ordenación de la burbuja ##
Replique el experimento de ajuste por regresión a los resultados obtenidos en el ejercicio
1 que calculaba la eficiencia del algoritmo de ordenación de la burbuja. Para ello
considere que $f(x)$ es de la forma $ax^2+bx+c$.

### Resultados: ###

A continuación se muestra la regresión cuadrática calculada frente a los datos obtenidos.

$\centerline{\includegraphics[height=7cm]{./Codigos/Ejercicio2/Imagenes/Trabajo/AlgoritmoBurbuja.png}}$

La **desviación media** del ajuste cuadrático responde a: 
$$ \sqrt{\frac{\sum_{i=1}^{n}(y_i - f(x_i))^2}{n}} = 0.0138602 $$ 
Como vemos esta es mínima en relación con los valores de tiempo presentados en la ejecución. El algoritmo burbuja 
implementado presenta un comportamiento prácticamente constante pues la única posible variación en el número de
operaciones realizadas consiste en el número de veces que se entre en el if, en cuyo caso se realiza un intercambio
entre dos componentes del vector. Por ello en la gráfica el ajuste prácticamente coincide con casi todos los puntos.


## Ejercicio 3: Problemas de precisión ##

Junto con este guión se le ha suministrado un fichero ejercicio_desc.cpp. En él se ha
implementado un algoritmo. Se pide que:

- Explique qué hace este algoritmo.
- Calcule su eficiencia teórica.
- Calcule su eficiencia empírica.

Si visualiza la eficiencia empírica debería notar algo anormal. Explíquelo y proponga una
solución. Compruebe que su solución es correcta. Una vez resuelto el problema realice la
regresión para ajustar la curva teórica a la empírica.

### Explicación del algoritmo ###
El algoritmo proporcionado consiste en una **busqueda binaria** implementada de forma iterativa. 
La busqueda binaria permite encontrar un elemento en un vector verificando que las componentes 
del mismo mantengan una relación de orden total y que se encuentre ordenado a través de dicha relación. 
En este caso se implementa el algoritmo para un vector de enteros. 

**ALGORITMO: Búsqueda Binaria**

Para cada iteración *inf* representa la posición donde empieza el subvector en el que se realiza 
la búsqueda y *sup* la posición donde finaliza. El proceso para cada iteración es el siguiente:

1. Se toma el elemento que se encuentra en la mitad del subvector {*inf*, ... , *sup*}.
2. Si dicho elemento es el buscado se devuelve su posición, $\frac{inf+sup}{2}$. En caso contrario:
    a) Si es menor que el elemento buscado, se busca en el subvector {$\frac{inf+sup}{2}+1$, ..., *sup*}.
    b) Si es mayor que el elemento buscado, se busca en el subvector {*inf*, ..., $\frac{inf+sup}{2}-1$}.
3. Se repite el proceso hasta encontrar el valor pedido o bien cuando inf > sup, 
   en cuyo caso el elemento a buscar no se encuentra en el vector y se devuelve -1.

### Cálculo de la eficiencia teórica ###

El peor de los casos para la búsqueda binaria es aquel en el que nunca encuentra el elemento deseado. 
Sea $T: \mathbb{N} \rightarrow \mathbb{N}$ la función tal que dado el número de elementos del vector 
nos proporciona la eficiencia del algoritmo en el caso de que no se encuentre un elemento dado. 
Es claro que $T(1) = O(1)$ pues solo se comprueba dicho elemento. Para $n > 1$ podemos expresar 
$T$ de forma recursiva: 
$$ T(n) = 1 + T(n/2) $$
La explicación es sencilla, para un vector de tamaño n se realiza una comprobación y se aplica el algoritmo 
en un subvector de tamaño la mitad. Por tanto, basta resolver la anterior ecuación recurrente 
para obtener la eficiencia teórica. Tomando $m = log_2 n$ se tiene que 
$T(n) = T(2^m) = 1 + T(2^{m-1}) \ \forall n > 1$. Denotando $x_m = T(2^m) \ \forall m \in \mathbb{N}$,
basta resolver la siguiente suceción recurrente:
$$ x_m = 1 + x_{m-1} \ \forall m > 0, \ x_0 = 1 $$  
El resultado de la misma es evidente: 
$$ x_m = m \ \forall m \in \mathbb{N} $$
Este hecho se prueba de forma sencilla por inducción. 
Para $m=0$ se tiene que $x_0 = T(2^0) = T(1) = 1$. Supesto cierto el resultado para $m \in \mathbb{N}$ se tiene 
$x_{m+1} = 1 + x_m = 1 + m$ como se quería. Volviendo a la función $T$:
$$ T(n) = T(2^m) = x_m = m = log_ 2 n \ \forall n \in \mathbb{N} $$ 
Por tanto, **la búsqueda binaria es un algoritmo logarítmico**.

### Cálculo de la eficiencia empírica ###

Tomamos como tamaño inicial del vector 1000. Se realizan ejecuciones desde este tamaño hasta 500000000
aumentando de 5000000 en 5000000. Si realizamos el proceso de cálculo de la eficiencia empírica para el código 
ejercicio_desc.cpp con la búsqueda binaria se obtiene el siguiente resultado:

$\centerline{\includegraphics[height=7cm]{./Codigos/Ejercicio3/Imagenes/Trabajo/BusquedaBinaria1.png}}$

Se puede observar un valor casi nulo con una variación de $10^{-6}$. La razón es bien sencilla: 
la precisión del clock de c++ es muy limitada. Puesto que la búsqueda binaria es muy rápida por 
ser logarítmica, el tiempo tomado tiende a 0 y clock no es capaz de medirlo. Para resolver este problema
he creado un nuevo código **busqueda_binaria.cpp** que contiene el algoritmo dado y lo ejecuta 10000 veces,
calculando el tiempo como la media de las 10000 reiteraciones. De esta forma sí se consigue medir el tiempo
con clock para las 10000 ejecuciones. Se muestran los resultados en la siguiente imagen:

$\centerline{\includegraphics[height=7cm]{./Codigos/Ejercicio3/Imagenes/Trabajo/BusquedaBinaria2.png}}$

La tendencia logarítmica es clara. Si aplicamos una regresión logarítmica a los datos se obtiene el siguiente
resultado:

$\centerline{\includegraphics[height=7cm]{./Codigos/Ejercicio3/Imagenes/Trabajo/BusquedaBinariaAjuste.png}}$

En este caso la **desviación media** del ajuste logarítmico responde a: 
$$ \sqrt{\frac{\sum_{i=1}^{n}(y_i - f(x_i))^2}{n}} = 5.7476 10^{-9}$$
Siendo un valor en cierta medida importante en comparación con el valor de los datos
tomados. Esta desviación se debe al poco tiempo de ejecución de la búsqueda binaria,
lo que produce que cualquier operación del sistema operativo afecte gravemente a los resultados.

***

$$ \pagebreak $$

## Ejercicio 4: Mejor y peor caso ##

Retome el ejercicio de ordenación mediante el algoritmo de la burbuja. Debe modificar el
código que genera los datos de entrada para situarnos en dos escenarios diferentes:

- El mejor caso posible. Para este algoritmo, si la entrada es un vector que ya está
ordenado el tiempo de cómputo es menor ya que no tiene que intercambiar ningún
elemento.
- El peor caso posible. Si la entrada es un vector ordenado en orden inverso
estaremos en la peor situación posible ya que en cada iteración del bucle interno
hay que hacer un intercambio.

Calcule la eficiencia empírica en ambos escenarios y compárela con el resultado del
ejercicio 1.

### Cálculo de la eficiencia empírica ###

Nótese que de forma teórica el algoritmo sigue siendo O($n^2$) en cualquier caso.
La única variación entre los posibles casos es el hecho de entrar o no al condicional
que intercambia dos componentes del vector. Por ello, la diferencia entre los casos no
es excesiva. Se muestra en la siguiente imagen los resultados obtenidos:

$\centerline{\includegraphics[height=8cm]{./Codigos/Ejercicio4/Imagenes/Trabajo/AlgoritmoBurbuja.png}}$

Es sorprendente que el supuesto peor caso obtenga mejores resultados que un caso arbitrario. La razón
es la siguiente: en el peor caso siempre se ejecutan las mismas instrucciones pues el algoritmo
siempre entra en el bloque condicional para intercambiar dos componentes. Por tanto, durante la 
ejecución del algoritmo las instrucciones que se ejecutan con el condicional pasan a la  memoria
caché por su uso asiduo, librándose del acceso a memoria ralentizaría el proceso. El caso arbitrario 
no sufre de esta optimización al no ejecutarse siempre el bloque condicional. Debido a este hecho 
realiza más accesos a memoria que el peor caso, obteniendo como consecuencia los peores resultados.

***

$$ \pagebreak $$

## Ejercicio 5: Dependencia de la implementación ##
Considere esta otra implementación del algoritmo de la burbuja:

~~~cpp
void ordenar(int *v, int n) {
    bool cambio=true;
    for (int i=0; i<n-1 && cambio; i++) {
        cambio=false;
        for (int j=0; j<n-i-1; j++)
            if (v[j]>v[j+1]) {
                cambio=true;
                int aux = v[j];
                v[j] = v[j+1];
                v[j+1] = aux;
            }
    }
}
~~~

En ella se ha introducido una variable que permite saber si, en una de las iteraciones del
bucle externo no se ha modificado el vector. Si esto ocurre significa que ya está ordenado
y no hay que continuar.
Considere ahora la situación del mejor caso posible en la que el vector de entrada ya está
ordenado. ¿Cuál sería la eficiencia teórica en ese mejor caso? Muestre la gráfica con la
eficiencia empírica y compruebe si se ajusta a la previsión.

### Cálculo de la eficiencia teórica ###

Si el vector está ordenado de menor a mayor se tiene que el algoritmo de ordenación por burbuja
no realiza ningún intercambio. Por tanto, la variable *cambio* permanece siempre con el valor
*false* y a la primera iteración se finaliza el algoritmo. Consecuentemente, es claro que el algoritmo
se comporta de forma lineal en el mejor caso. Matemáticamente, realizando el mismo proceso que en el
[ejercicio 1](#Ejercicio 1: Ordenación de la burbuja), sea $T: \mathbb{N} \rightarrow \mathbb{N}$
la función que nos proporciona para un número de datos ordenados, $n$, el número de operaciones que
realiza el algoritmo burbuja, $T(n)$. Podemos expresar $T(n)$ como:

$$ T(n) = 1 + 5 + 1 + \sum_{j=0}^{n}3 = 3n + 7 $$

De donde $T \in O(n)$.

## Resultados empíricos ##

Repitiendo los experimentos con este nuevo código solo se nota una mejoría en el mejor caso.
Se adjunta un **.cpp** por cada caso posible con los otros archivos eplicados al inicio.

En primer lugar se muestran los resultados empíricos obtenidos al ejecutar el nuevo algoritmo
para el mejor caso. Los resultados indican una enorme mejoría en cuanto al tiempo. Además,
hay severas variaciones en la imagen tal y como pasaba con la búsqueda binaria pero de forma menos 
drástica.

$\centerline{\includegraphics[height=7cm]{./Codigos/Ejercicio5/Imagenes/Trabajo/AlgoritmoBurbujaAntiguo.png}}$

Para obtener unos datos más limpios se aplica el criterio utilizado en la búsqueda binaria que consiste en
repetir una ejecución una serie de veces y proporcionar el tiempo medio de la misma:

$\centerline{\includegraphics[height=7cm]{./Codigos/Ejercicio5/Imagenes/Trabajo/AlgoritmoBurbuja1.png}}$

El orden lineal ya es claro. Se ha reducido la varianza de los datos como se pretendía. Con estos nuevos
datos se compara el algoritmo con peor caso y caso promedio en la siguiente imagen:

$\centerline{\includegraphics[height=7cm]{./Codigos/Ejercicio5/Imagenes/Trabajo/AlgoritmoBurbuja2.png}}$

Como se ve el tiempo del mejor caso se vuelve prácticamente nulo en comparación. El peor caso sigue
ganando a un caso promedio a pesar de la optimización del algoritmo por las razones expuestas en el
apartado anterior. Cabe preguntarse si el nuevo algoritmo es mejor que el antiguo en un caso arbitrario.
El resultado de su comparación se muestra en la siguiente imagen en la que vemos un comportamiento
prácticamente similar en ambos. El tiempo que el nuevo algoritmo gana en caso que que en determinado
momento el vector ya esté ordenado lo pierde por las comparaciones y asignaciones extras del código.

$\centerline{\includegraphics[height=7cm]{./Codigos/Ejercicio5/Imagenes/Trabajo/AlgoritmoBurbuja3.png}}$

***

$$ \pagebreak $$

## Ejercicio 6: Influencia del proceso de compilación ##

Retome el ejercicio de ordenación mediante el algoritmo de la burbuja. Ahora replique
dicho ejercicio pero previamente deberá compilar el programa indicándole al compilador
que optimice el código. Esto se consigue así:

~~~bash
g++ -O3 ordenacion.cpp -o ordenacion_optimizado
~~~

Compare las curvas de eficiencia empírica para ver cómo mejora esto la eficiencia del
programa.

### Resultados Empíricos ###

Se utiliza el código del **ejercicio 5** para el algoritmo de ordenación burbuja.
Los resultados obtenidos son los siguientes:


$\centerline{\includegraphics[height=7cm]{./Codigos/Ejercicio6/Imagenes/Trabajo/AlgoritmoBurbuja.png}}$

Es clara la amplia mejora que proporciona la optimización del código por parte del compilador.
Se obtienen tiempos que son casi la mitad con respecto a los iniciales. Sin embargo, la 
optimización del código solo afecta a la eficiencia del mismo desde el punto de vista
de operaciones por segundo, el algoritmo sigue siendo cuadrático.

***

$$ \pagebreak $$

## Ejercicio 7: Multiplicación matricial ##
Implemente un programa que realice la multiplicación de dos matrices bidimensionales.
Realice un análisis completo de la eficiencia tal y como ha hecho en ejercicios anteriores
de este guión.

He implementado dos algoritmos para este apartado:

- Algoritmo Clásico para el producto de matrices
- Algoritmo de Strassen

### Algoritmo Clásico para el producto de matrices ###

Sea $n,m,k \in \mathbb{N}$, y sean $A \in \mathbb{M}_{nxk}(\mathbb{R})$, $B \in \mathbb{M}_{kxm}(\mathbb{R})$ dos matrices. Entonces,
se define el producto de A y B como:
$$ c_{ij} = (A.B)_{ij} = \sum_{r=1}^{k}a_{ir}.b_{rj} \ \forall i,j \in \mathbb{N} \ con \ 1 \le i \le n \ y \ 1 \le j \le m $$

Nótese que la matriz resultante $C$ pertenece a $\mathbb{M}_{nxm}(\mathbb{R})$.

La implementación clásica del producto de matrices consiste en respetar la
definición del mismo. El código de dicha implementación se muestra a continuación:

~~~cpp
Matriz productoMatrices(Matriz A, Matriz B, int n, int k, int m){
    Matriz C(n,m);

    for (int i = 0; i < n; i++){
        for (int j = 0; j < m; j++){
            for (int r = 0; r < k; r++){
                C[i][j] += A[i][r] * B[r][j]; // Tiempo constante, O(1)
            }
        }
    }
    return C;
}
~~~

La eficiencia del mismo es evidente. Se realizan tres bucles encadenados con una operación 
constante al final del mismo. Sea $T: \mathbb{N}x\mathbb{N}x\mathbb{N} \rightarrow \mathbb{N}$
la función que nos proporciona para una terna de dimensiones de las matrices $A$ y $B$, $(n,k,m)$, 
la eficiencia del algoritmo, $T(n,k,m)$. Podemos expresar $T(n,k,m)$ como:

$$ T(n,k,m) =  \sum_{i=0}{n-1}\sum_{j=0}^{m-1}\sum_{r=0}{k-1}O(1) = O(n m k) $$

Por tanto , $T \in O(nmk)$. En la práctica se aplicará el algoritmo para matrices cuadradas
para poder así ver la evolución del tiempo de cómputo en fución de su dimensión. En este caso
particular es evidente que el algoritmo resulta ser **cúbico** y por tanto su ejecución será
potencialmente inabordable para matrices de grandes dimensiones.

### Algoritmo de Strassen ###

El algoritmo de Strassen es un algoritmo recursivo para el producto de matrices cuadradas.
Fue el primer algoritmo en bajar la eficiencia teórica del producto matricial a
un orden menor que O($n^3$), en particular, O($n^{log_{2}7}$). No solo supuso
una mejoría en el cálculo de producto de matrices de gran dimensión sino que además
inicio una investigación en torno a la búsqueda de algoritmos que mejorasen la eficiencia
obtenida a la vista de que esto era factible. Esto permitió el descubrimiento de
algoritmos como el de [Coppersmith-Winograd](http://en.wikipedia.org/wiki/Coppersmith-Winograd_algorithm)
que hacen que el producto de matrices sea una operación abordable.

El algoritmo de Strassen se basa en la siguiente obserración:

Sean $m \in \mathbb{N}$ y $n = 2^m$ una potencia de 2. Sean $A,B \in \mathbb{M}_{nxn}(\mathbb{R})$ dos 
matrices cuadradas. Se puede denotar:

\[ A = \left( \begin{array}{ccc}
a_{11} & a_{12} \\
a_{21} & a_{22} \end{array} \right) \ y
\ B = \left( \begin{array}{ccc}
b_{11} & b_{12} \\
b_{21} & b_{22} \end{array} \right)\]

Con $a_{11}, a_{12}, a_{21}, a_{22}, b_{11}, b_{12}, b_{21}, b_{22} \in \mathbb{M}_{2^{m-1}x2^{m-1}}(\mathbb{R})$. 
Definimos las matrices  $P_{1}, P_{2}, P_{3}, P_{4}, P_{5}, P_{6}, P_{7} \in \mathbb{M}_{2^{m-1}x2^{m-1}}(\mathbb{R})$
como sigue:

- $P1 = (a_{11} + a_{22})(b_{11} + b_{22})$  
- $P2 = (a_{21} + a_{22})b_{11}$  
- $P3 = a_{11}(b_{12} - b_{22})$  
- $P4 = a_{22}(b_{21} - b_{12})$  
- $P5 = (a_{11} + a_{12})b_{22}$  
- $P6 = (a_{21} - a_{11})(b_{11} + b_{12})$  
- $P7 = (a_{12} - a_{22})(b_{21} + b_{22})$  

Entonces se tiene que:

\[ C = A.B = \left( \begin{array}{ccc}
P_1+P_4+P_7-P_5 & P_3 + P_5 \\
\\
P_2 + P_4 & P_3 + P_1 + P_6 - P_2 \end{array} \right)\]

Nótese que las matrices $P_i$ también tienen dimenión potencia de 2. Puesto que estas matrices se 
calculan mediante un producto, la misma idea puede aplicarse a las mismas. Por tanto, el algoritmo 
de Strassen sustituye productos por sumas hasta llegar a matrices con una dimensión umbral (32 en
este caso) cuyo producto sí se calcula mediante el algoritmo clásico.

El análisis teórico del algoritmo se basa en la siguiente recurrencia:

$$ T(n) = 7T(\frac{n}{2}) + O(n^2) $$

Su obtención es sencilla. Para una matriz de dimensión *n* se calculan las matrices $P_i$ como
el producto de sumas y restas de matrices de dimensión la mitad. La operación de producto
tendrá una eficiencia de $T(\frac{n}{2})$ pues se llama recurrentemente al algoritmo. El número
7 proviene de la realización de 7 productos matriciales, uno por cada $P_i$. Las sumas y restas
realizadas en el proceso así como las que tienen lugar durante el cálculo de *C* son operaciones
de orden de eficiencia $O(n^2)$ y el número de operaciones es siempre constante. La suma de ambas
eficiencias nos proporciona la ecuación anterior. Para su resolución se acude al 
[Master Theorem](http://en.wikipedia.org/wiki/Master_theorem) obteniendo:

$$ T(n) = n^{log_2 7} = n^{2.8074} \ \forall n \ tal \ que \ n = 2^m \ con \ m \in \mathbb{N} $$

El algoritmo expuesto requiere como entrada una matriz de dimensión potencia de 2. Para poder 
aplicarlo a cualquier matriz, la idea más sencilla es ampliar la misma con columnas y filas de ceros
hasta obtener como dimensión la siguiente potencia de 2 a la actual lo que empeora su comportamiento
y da lugar al comportamiento dado en la imagen de la siguiente seccción.

### Resultados Empíricos ### 

Aunque el algoritmo de Strassen tenga una mejor eficiencia, el factor de la misma es grande. Esto
se debe a la recursividad utilizada así como a la creación de numerosas matrices en el proceso, lo
que conlleva reserva de memoria, sumas y restas matriciales y diversas asignaciones entre matrices.
Además, el hecho de que se deba ampliar la dimensión a una potencia de 2 produce que en realidad
se multipliquen matrices de mayor dimensión, obteniendo a veces por esta razón peores resultados
que el algoritmo clásico. Existen diversas [propuestas](www.cs.duke.edu/~alvy/papers/sc98/) 
para evitar este hecho aunque todas conllevan un gran trabajo de programación.

El algoritmo clásico obtiene mejores resultados en matrices de dimensión pequeña por las 
razones expuestas anteriormente. Cuando la dimensión aumenta, el algoritmo de Strassen sí 
obtiene mejores resultados gracias a su eficiencia teórica. Se muestra a continuación una 
comparativa entre ambos algoritmos en la se aprecia todo lo explicado anteriormente:

$\centerline{\includegraphics[height=9cm]{./Codigos/Ejercicio7/Imagenes/Trabajo/ProductoMatrices.png}}$

***

$$ \pagebreak $$

## Ejercicio 8: Ordenación por Mezcla ##
Estudie el código del algoritmo recursivo disponible en el fichero mergesort.cpp. En él, se
integran dos algoritmos de ordenación: inserción y mezcla (o mergesort). El parámetro
UMBRAL_MS condiciona el tamaño mínimo del vector para utilizar el algoritmo de
inserción en vez de seguir aplicando de forma recursiva el mergesort. Como ya habrá
estudiado, la eficiencia teórica del mergesort es n log(n). Realice un análisis de la
eficiencia empírica y haga el ajuste de ambas curvas. Incluya también, para este caso, un
pequeño estudio de cómo afecta el parámetro UMBRAL_MS a la eficiencia del algoritmo.
Para ello, pruebe distintos valores del mismo y analice los resultados obtenidos.

Se divide el ejercico en diferentes comparativas entre los  algoritmos:

- Algoritmo de Inserción vs Algoritmo Burbuja.
- Estudio sobre UMBRAL_MS del Mergesort.
- Comparación de mergesort con otros algoritmos de ordenación O(nlog_2 n).
- Ajuste para Mergesort e Inserción.

Se proporciona un código para cada algoritmo. Debido a las subsecciones planteadas,
en este caso se proporcionan 3 scripts **ejecutar_ejercico_8_i.sh**, uno para cada
una de las 3 primeras secciones junto con un **plot_i.sh** por script.

### Algoritmo de Inserción vs Algoritmo Burbuja ### 

El algoritmo de inserción utilizado en el código es un algoritmo de ordenación
de eficiencia O($n^2$) y que suele ser de los mejores con esa eficiencia. El cálculo
teórico de la  misma es sencillo. 

Su funcionamito se basa en el siguiente proceso:

1. Se realiza una iteración por cada elemento del vector. 
2. Para la iteración m-ésima se presupone que se ha ordenado el subvector {$1, ..., m-1$}. 
    Se toma el elemento en la posición m y se inserta en el subvector anterior manteniéndose 
    este ordenado y con un elemento más.
    
Es claro que cuando finalice el proceso se habrá ordenado el vector al completo. Se muestra en
la siguiente gráfica una comparativa entre este algoritmo y el burbuja con el código del
**ejercicio 5**:

$\centerline{\includegraphics[height=7cm]{./Codigos/Ejercicio8/Imagenes/Trabajo/InsercionBurbuja.png}}$

El mejor factor del algoritmo de inserción con respecto al brubuja es claro. Se debe a que el burbuja
recorre todo el subvector en cada iteración mientras que el de insercción puede parar la iteración sin
recorrer el bucle entero pues solo tiene que insertar el elemento.

### Estudio sobre UMBRAL_MS del Mergesort ###

Se muestra en esta sección el estudio pedido sobre el parámetro UMBRAL_MS del mergesort.
En el estudio el parámetro toma el valor 2, 20, 40, 60, 80 y 100. Se realiza la media de 1000 ejecuciones
para cada dato. Los resultados se resumen en la siguiente imagen:

$\centerline{\includegraphics[height=9cm]{./Codigos/Ejercicio8/Imagenes/Trabajo/MergesortVariacion.png}}$

Se puede observar que el mejor resultado viene dado por UMBRAL_MS=20. Nótese que para umbrales mayores
se produce un desnivel importante en algunos puntos de la gráfica. La razón es la siguiente. Por ejemplo,
para el caso UMBRAL_MS = 100, es claro que el algoritmo funcionará mejor cuando las particiones del vector
resulten en subvectores de tamaño menor que 100 puesto que se aplicará inserción a vectores más pequeños,
simulando un umbral menor con su correspondiente mejoa. Supongamos que para determinado tamaño, todas las 
particiones previas a las finales tienen tamaño 101. En consecuencia, se realizará otra partición, aplicando 
inserción a vectores de tamaño 50 o 51 posteriormente. En este caso se obtiene el mejor resultado posible en 
términos de tiempo. Por tanto, cuando la longitud del vector está en torno a $101 2^n$ se producirá este 
fenómeno, mejorando radicalmente el tiempo del algoritmo.

Para los siguentes estudios se toma UMBRAL_MS = 20. 

### Comparación de mergesort con otros algoritmos de ordenación O(nlog_2 n) ###

Se compara el mergesort con otros algoritmos de orden de eficiencia O(nlog_2 n).
A priori, el mergesort no se suele utilizar debido a que necesita de una segunda copia 
en memoria del vector para su funcionamiento. Se comparan los resultados con:

- [**Quicksort:**](http://ronnyml.wordpress.com/2009/07/19/quicksort-en-c/) Algoritmo ampliamente utilizado y considerado uno de los mejores algoritmos de ordenación.
- [**Heapsort:**](https://www.youtube.com/watch?v=B7hVxCmfPtM&index=4&list=PLUl4u3cNGP61Oq3tWYp6V_F-5jb5L2iHb) 
  Algoritmo basado en la estructura de datos Heap.
- [**Sort:**](http://www.cplusplus.com/reference/algorithm/sort/) Algoritmo de ordenación que proporciona c++ en el include *algorithm*.

Los resultados obtenidos son los siguientes:

$\centerline{\includegraphics[height=8cm]{../Codigos/Ejercicio8/Imagenes/Trabajo/Comparacion.png}}$

Se puede apreciar que el mejor algoritmo en la práctica es el Quicksort (recordemos que en teoría
su peor caso es **cuadrático**). Obtiene resultados similares al sort de la STL, luego presupongo
que puede estar implementado también como quicksort. Mergesort no consigue los resultados de los
dos algoritmos anteriores pero no se queda atrás. Sí lo hace Heapsort pues a pesar de ser O($nlog_2 n$),
en primer lugar crea el heap y en segundo lugar lo ordena. Por ello obtiene tiempos dos veces más lento.

### Ajustes para Inserción y Mergesort ###

En esta  sección se proporcionan los ajustes pedidos para los algoritmos inserción y mergesort.
La primera gráfica responde al primero de ellos. Nótese la poca variación del mismo, lo que permite
que el ajuste cuadrático sea casi exacto. En este caso la **desviación media** del ajuste cuadrático 
responde a: 
$$ \sqrt{\frac{\sum_{i=1}^{n}(y_i - f(x_i))^2}{n}} = 0.00877017$$

$\centerline{\includegraphics[height=7cm]{../Codigos/Ejercicio8/Imagenes/Trabajo/InsercionAjuste.png}}$

La siguiente imagen responde al ajuste realizado para el mergesort. Al ser calculados los puntos como la 
media de 1000 ejecuciones el ajuste tiene una **desviación media** del orden del 1%:
$$ \sqrt{\frac{\sum_{i=1}^{n}(y_i - f(x_i))^2}{n}} = 2.86917 / 10^{-05} $$

$\centerline{\includegraphics[height=7cm]{../Codigos/Ejercicio8/Imagenes/Trabajo/MergeSortAjuste.png}}$

En cambio, para una única ejecución se tiene una mayor dispersión de los puntos. Esto se debe a que
el ruido introducido por el sistema operativo es significativo en relación con el tiempo que tarda
el algoritmo:

$\centerline{\includegraphics[height=7cm]{../Codigos/Ejercicio8/Imagenes/Trabajo/MergeSortAjuste_1.png}}$

***

-->