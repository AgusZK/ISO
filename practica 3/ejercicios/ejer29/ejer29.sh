#!/bin/bash
# 29)  Realice un script que mueva todos los programas del directorio actual (archivos ejecutables) hacia el subdirectorio “bin” del directorio HOME del usuario actualmente logueado Elscript debe imprimir en pantalla los nombres de los que mueve, e indicar cuántos ha movido,o que no ha movido ninguno. Si el directorio “bin” no existe,deberá ser creado

destino="${HOME}/bin"
cant=0

if [ ! -d "$destino" ]; then
	echo "Creo destino"
	mkdir -p $destino
fi

for p in *; do
	if [ -f "$p" ] && [ -x "$p" ]; then
		echo "Moviendo archivo: $p"
		cp "$p" "$destino/" # En realidad es mv pero hago pruebas
		((cant++))
	fi
done

echo "Cantidad de archivos movidos: $cant"
