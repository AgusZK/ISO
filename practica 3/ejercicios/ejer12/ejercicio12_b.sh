#!/bin/bash
# 12-b) Modificar el script creado en el inciso anterior para que los números sean recibidos
#como parámetros. El script debe controlar que los dos parámetros sean enviados

function mayor(){
	if [ $1 -gt $2 ]; then
        	echo $1
    	elif [ $2 -gt $1 ]; then
        	echo $2
    	else
        	echo "Son iguales"
    	fi	
}

if [[ $# -ne 2 ]]; then
	echo "Enviar 2 numeros como parametro"
	exit 1
fi

echo "La multiplicacion de ambos numeros es: $(($1 * $2))"
echo "La suma de ambos numeros ingresados es: $(($1 + $2))"
echo "La resta de num1 menos num2 es: $(($1 - $2))"
echo "El numero mas grande es: $(mayor $@)"

exit 0
