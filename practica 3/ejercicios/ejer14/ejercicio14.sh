#!/bin/bash
# Renombrando Archivos: haga un script que renombre solo archivos de un
#directorio pasado como parámetro, agregandole una CADENA, contemplando las
#opciones:
#➢ “-a CADENA”: renombra el fichero concatenando CADENA al final del nombre
#del archivo
#➢ “-b CADENA”: renombra el fichero concatenando CADENA al comienzo del
#nombre del archivo

if [ "$#" -ne 3 ]; then
	echo "Enviar directorio, opcion, cadena"
	exit 1
fi

directorio=$1
opcion=$2
cadena=$3

if [[ ! -d $directorio ]]; then
	echo "El primer parametro no es un directorio"
	exit 2
fi

cd "$directorio"
if [ $opcion = "-a" ]; then
	for archivo in *; do
		mv "$archivo" "$archivo$cadena"
	done
elif [ $opcion = "-b" ]; then
	for archivo in *; do
		mv "$archivo" "$cadena$archivo"
	done
else
	echo "Opcion invalida"
	exit 1
fi
