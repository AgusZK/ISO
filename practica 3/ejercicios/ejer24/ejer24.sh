#!/bin/bash
# 24)  Realice un script que agregue en un arreglo todos los nombres de los usuarios
#del sistema pertenecientes al grupo “users”. Adicionalmente el script puede
#recibir como parámetro:
#➢ “-b n”: Retorna el elemento de la posición n del arreglo si el mismo
#existe. Caso contrario, un mensaje de error.
#➢ “-l”: Devuelve la longitud del arreglo
#➢ “-i”: Imprime todos los elementos del arreglo en pantalla

usuarios=()

function agregarUsuarios(){
	users=$(cat /etc/group | grep users | cut -d: -f4 | tr ',' '\n') # Agarro la lista de usuarios del grupo users del campo 4 y las mete en un array
	for i in ${users[*]};do
		usuarios+=("$i")
	done
}

function retornarN(){
	if [[ $1 -lt 0 || $1 -ge ${#usuarios[*]} ]]; then
		echo "La posicion $1 esta fuera del rango"
	else
		echo ${usuarios[$1]}
	fi
}

function longitud(){
	echo "${#usuarios[*]}"
}

function imprimir(){
	for e in "${usuarios[*]}"; do
		echo $e
	done
}

param=$1
agregarUsuarios

case $param in
	"-b")
		retornarN "$2"
		;;
	"-l")
		longitud
		;;
	"-i")
		imprimir
		;;
	*)
		echo "Pasa un parametro correcto"
		;;	
esac
