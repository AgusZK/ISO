#!/bin/bash
# 15) Realizar un script que reciba como parámetro una extensión y haga un reporte
#con 2 columnas, el nombre de usuario y la cantidad de archivos que posee con
#esa extensión. Se debe guardar el resultado en un archivo llamado reporte.txt

if [ $# -ne 1 ]; then
	echo "Enviar una extension"
	exit 1
fi

ext=$1
echo > reporte.txt

#usuario:x:UID:GID:info:/home/usuario:/bin/bash
for linea in $(cat /etc/passwd | cut -d: -f1,6);do # Agarro usuario:/home/usuario
	usuario=$(echo $linea | cut -d: -f1) # Me quedo con el usuario
	home=$(echo $linea | cut -d: -f2) # Me quedo con /home/usuario

	if [[ -d "$home" && "$home" == /home/* ]]; then # Filtro para evitar errores de Windows
		# Cuento cantidad de archivos en el home con la extension del param
		cant=$(find "$home" -name "*.$ext" | wc -l)
		echo "$usuario |  $cant" >> reporte.txt
	fi
done
