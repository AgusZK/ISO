#!/bin/bash
# 13-c) Crear un script que reciba como parámetro el nombre de un archivo e informe si el
#mismo existe o no, y en caso afirmativo indique si es un directorio o un archivo. En
#caso de que no exista el archivo/directorio cree un directorio con el nombre recibido
#como parámetro.

if [ $# -ne 1]; then
	echo "Se necesita ingresar un nombre de archivo"
	exit 1
fi

if [ -e "$1"]; then
	if [ -f "$1" ]; then
		echo "Es un archivo regular"
	if [ -d "$1" ]; then
		echo "Es un directorio"
	else
		echo "No es archivo ni directorio"
	fi
else
		mkdir "$1"
fi

exit 0
