#!/bin/bash
# 12-c) Realizar una calculadora que ejecute las 4 operaciones básicas: +, - ,*, %.
#Esta calculadora debe funcionar recibiendo la operación y los números
#como parámetros

if [[ $# -ne 3 ]]; then
	echo "Enviar 3 parametros, numero, operacion, numero"
	exit 1
fi

op=$2

case "$op" in
	"+") echo "$(($1 + $3))";;
	"-") echo "$(($1 - $3))";;
	"*") echo "$(($1 * $3))";;
	"%")
	if [[ $3 -eq 0 ]]; then
		echo "No podes dividr por 0"
	else
		echo "$(($1 / $3))"
	fi;;
	*) echo "Operacion invalida";;
esac

exit 0



