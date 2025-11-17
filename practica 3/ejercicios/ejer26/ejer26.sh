#!/bin/bash
# 26)  Realice un script que implemente a través de la utilización de funciones las
#operaciones básicas sobre arreglos:
#➢ inicializar: Crea un arreglo llamado array vacío
#➢ agregar_elem <parametro1>: Agrega al final del arreglo el parámetro
#recibido
#➢ eliminar_elem <parametro1>: Elimina del arreglo el elemento que se
#encuentra en la posición recibida como parámetro. Debe validar que
#se reciba una posición válida
#➢ longitud: Imprime la longitud del arreglo en pantalla
#➢ imprimir: Imprime todos los elementos del arreglo en pantalla
#➢ inicializar_Con_Valores <parametro1><parametro2>: Crea un arreglo
#con longitud <parametro1>y en todas las posiciones asigna el valor
#<parametro2

function inicializar(){
	arreglo=()
	echo "Array creado"
}

function agregar_elem(){
	arreglo=(${arreglo[*]} $1)
}

function eliminar_elem(){
	pos=$1

	if [ $pos -le ${#arreglo[*]} ]; then
		unset arreglo[$pos]
		arreglo=(${arreglo[*]})
		echo "Posicion $pos eliminada"
	else
		echo "Posicion a eliminar invalida"
	fi

}

function longitud(){
	echo ${#arreglo[*]}
}

function imprimir(){
	for e in ${arreglo[*]}; do
		echo $e
	done
}

function inicializar_Con_Valores(){
	if [ $# -ne 2 ]; then
		echo "Enviar dos parametros"
		exit 1
	fi

	longitud=$1
	valores=$2

	inicializar
	# Llamo a agregar tantas veces como el parametro lo indique
	for ((i=0; i < $longitud; i++)) do
		agregar_elem $valores
	done
}

select action in inicializar agregar_elem eliminar_elem longitud imprimir inicializar_Con_Valores Salir; do
	case $action in
		"inicializar")
			inicializar
			;;
		"agregar_elem")
			echo "Ingresa elemento a agregar"
			read elemento
			agregar_elem $elemento
			;;
		"eliminar_elem")
			echo "Ingresa posicion a borrar"
			read pos
			eliminar_elem $pos
			;;
		"longitud")
			echo "Longitud de arreglo: $(longitud)"
			;;
		"imprimir")
			imprimir
			;;
		"inicializar_Con_Valores")
			echo "Ingrese longitud de arreglo"
			read longitud
			echo "Ingrese elemento a repetir en cada posicion"
			read valor
			inicializar_Con_Valores $longitud $valor
			;;
		"Salir")
			echo "Saliendo"
			exit 0
			;;
	esac
done	
