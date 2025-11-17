#!/bin/bash
# 22)  Implemente un script que recorra un arreglo compuesto por números e imprima en pantalla sólo los números pares y que cuente sólo los números impares y los informe en pantalla al finalizar el recorrido.

nums=(2 4 10 5 7)

recorrer(){
	local cantImpares=0
	for num in ${nums[*]}; do
		if (( num % 2 == 0 )); then
			echo $num
		else
			((cantImpares++))
		fi
	done
	echo "Impares: $cantImpares"
}

recorrer
