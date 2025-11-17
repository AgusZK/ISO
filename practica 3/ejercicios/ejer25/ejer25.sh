#!/bin/bash
# 25) Escriba un script que reciba una cantidad desconocida de parámetros al momento
# de su invocación (debe validar que al menos se reciba uno). Cada parámetro 
# representa la ruta absoluta de un archivo o directorio en el sistema.
# El script deberá iterar por todos los parámetros recibidos, y solo para 
# aquellos parámetros que se encuentren en posiciones impares (el primero, el
# tercero, el quinto, etc.), verificar si el archivo o directorio existen en el
# sistema, imprimiendo en pantalla qué tipo de objeto es (archivo o directorio).
# Además, deberá informar la cantidad de archivos o directorios inexistentes en
# el sistema.

if [ $# -eq 0 ]; then
	echo "Enviar un parametro como minimo"
	exit 1
fi

cantIne=0
iteraciones=0

for path in "$@"; do
	((iteracion++))
	if [ iteracion % 2 == 0 ]; then
		continue
	fi

	if [ -e "$path" ]; then
		if [ -d "$path" ]; then
			echo "$path es un directorio"
		elif [ -f "$path" ]; then
			echo "$path es un archivo"
		fi
	else
		echo "$path es inexistente"
		((cantIne++))
	fi
done

echo "Cant de archivos/directorios inexistentes en el sistema: $cantIne"
