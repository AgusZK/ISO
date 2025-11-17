#!/bin/bash
# Escribir un Programa de “Menu de Comandos Amigable con el Usuario” llamado menú, el cual, al ser invocado, mostrará un menú con la selección para cada uno de los scripts creados en esta práctica. Las instrucciones de cómo proceder deben mostrarse junto con el menú. El menú deberá iniciarse y permanecer activo hasta que se seleccione Salir. Por ejemplo:
#MENU DE COMANDOS
#03. Ejercicio 3
#12. Evaluar Expresiones
#13. Probar estructuras de control
#...
#Ingrese la opción a ejecutar: 03

mapfile -t scripts < <(find ../ -name "*.sh") #Mapeo 
echo "Scripts encontrados:"
for s in "${scripts[@]}"; do
	echo $s
done

echo "Seleccione una opcion:"
select action in "${scripts[@]}" "Salir"; do
	case $action in
		"Salir")
			echo "Saliendo"
			exit 0;;
		*) bash $action;;
	esac
done
