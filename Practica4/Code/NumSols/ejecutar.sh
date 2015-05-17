#!/bin/bash

mkdir -p Datos
mkdir -p Imagenes

chmod +x plot_graficas.sh
chmod +x obtenerDatosTrabajadores.sh
chmod +x obtenerDatosTrabajos.sh

./obtenerDatosTrabajos.sh first_algorithm.py
./obtenerDatosTrabajos.sh second_algorithm.py
./obtenerDatosTrabajos.sh third_algorithm.py
./obtenerDatosTrabajos.sh fourth_algorithm.py

./obtenerDatosTrabajadores.sh first_algorithm.py
./obtenerDatosTrabajadores.sh second_algorithm.py
./obtenerDatosTrabajadores.sh third_algorithm.py
./obtenerDatosTrabajadores.sh fourth_algorithm.py


./plot_graficas_todos.sh Trabajadores
./plot_graficas_todos.sh Trabajos 
./plot_graficas.sh Trabajadores
./plot_graficas.sh Trabajos
./plot_graficas_dos.sh Trabajadores
./plot_graficas_dos.sh Trabajos