#!/bin/bash
# 21) Dada la siguiente declaración al comienzo de un script:
#num=(10 3 5 7 9 3 5 4) (la cantidad de elementos del arreglo puede variar). Implemente la función productoria dentro de este script, cuya tarea sea multiplicar todos los números que el arreglo contiene.

num=(10 3 5 7 9 3 5 4)

productoria(){
	local acumulador=1
	for num in ${num[*]}; do
		acumulador=$((acumulador * num))
	done
	echo $acumulador
}

productoria
