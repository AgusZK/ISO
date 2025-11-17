#!/bin/bash
# 27)  Realice un script que reciba como parámetro el nombre de un directorio. Deberá
#validar que el mismo exista y de no existir causar la terminación del script con
#código de error 4. Si el directorio existe deberá contar por separado la cantidad
#de archivos que en él se encuentran para los cuales el usuario que ejecuta el
#script tiene permiso de lectura y escritura, e informar dichos valores en pantalla.
#En caso de encontrar subdirectorios, no deberán procesarse, y tampoco deberán
#ser tenidos en cuenta para la suma a informar

if [ $# -ne 1 ]; then
	echo "Enviar un directorio como parametro"
	exit 1
fi


if [ ! -d $1 ]; then
	echo "El directorio enviado no existe"
	exit 4
fi

cantArch=0

for archivo in "$1"/*; do
	if [ -f "$archivo" ]; then
		if [ -r "$archivo" ] && [ -w "$archivo" ]; then
			((cantArch++))
		fi
	fi
done

echo "Cantidad de archivos del usuario ejecutando el script con R/W: $cantArch"
