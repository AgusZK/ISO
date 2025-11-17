#!/bin/bash
# 28)  Implemente un script que agregue a un arreglo todos los archivos del directorio
#/home cuya terminación sea .doc. Adicionalmente, implemente las siguientes
#funciones que le permitan acceder a la estructura creada:
#➢ verArchivo <nombre_de_archivo>: Imprime el archivo en pantalla si el
#mismo se encuentra en el arreglo. Caso contrario imprime el mensaje
#de error “Archivo no encontrado” y devuelve como valor de retorno 5
#➢ cantidadArchivos: Imprime la cantidad de archivos del /home con
#terminación .doc
#➢ borrarArchivo <nombre_de_archivo>: Consulta al usuario si quiere
#eliminar el archivo lógicamente. Si el usuario responde Si, elimina el
#elemento solo del arreglo. Si el usuario responde No, elimina el
#archivo del arreglo y también del FileSystem. Debe validar que el
#archivo exista en el arreglo. En caso de no existir, imprime el mensaje
#de error “Archivo no encontrado” y devuelve como valor de retorno 10


archivos=()

function agregarArchivos(){
	arch=$(find /home -type f  -name "*.doc" 2>/dev/null)
	for a in $arch; do
		archivos+=("$a")
	done
	echo "Se cargaron ${#archivos[*]} en el array"
}

function verArchivo(){
	if [ $# -ne 1 ]; then
		echo "Enviar nombre de archivo a buscar"
		exit 1
	fi

	for arch in ${archivos[*]}; do
		nombre=$(basename "$arch")
		if [ $nombre == $1 ]; then
			# Imprimo el contenido del archivo
			echo $(cat $arch)
			return 0
		fi
	done

	echo "El archivo no se encuentra en el arreglo"
}

function cantidadArchivos(){
	echo "${#archivos[*]}"
}

function borrarArchivo(){
        nombre=$1
        pos=0

        for a in "${archivos[@]}"; do
                if [[ $(basename "$a") == "$nombre" ]]; then
                        echo "Eliminar logicamente? si/no"
                        read respuesta
                        case $respuesta in
                        si)
                                #Borro del arreglo nomas
                                unset "archivos[$pos]"
                                echo "Se borro el archivo logicamente"
                                return 0
                                ;;
                        no)
                                #Borro el archivo original
                                rm -f "$a"
                                unset "archivos[$pos]"
                                echo "Se borro del arreglo y del FS"
                                return 0
                                ;;
                        *)
                                echo "Pone si o no hijo de mil"
                                return 1
                                ;;
                        esac
                fi
                ((pos++)) # Me voy guardando en que lugar estoy para poder borrar
        done

        echo "Nombre de archivo invalido"
        return 10
}

agregarArchivos
cantidadArchivos
verArchivo doc1.doc
borrarArchivo doc1.doc #De los 3 que tenia me borra solo el primero
