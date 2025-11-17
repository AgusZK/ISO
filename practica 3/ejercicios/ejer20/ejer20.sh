#!/bin/bash
#Realice un script que simule el comportamiento de una estructura de# PILA e implementelas siguientes funciones aplicables sobre una estructura global definida en el script:
#push: Recibe un parámetro y lo agrega en la pila 
#pop: Saca un elemento de la pila
#length: Devuelve la longitud de la pila 
#print: Imprime todos elementos de la pila

pila=();

push(){
        pila+=("$1")
}

length(){
        echo "${#pila[@]}"
}

print(){
        for e in "${pila[@]}"; do
                echo "$e"
        done
}

pop(){
        if [ "${#pila[@]}" -eq 0 ]; then
                echo "Pila vacia, no podes desapilar"
                exit 1
        else
                unset pila[$((${#pila[@]} - 1))] # Agarro tamanio - 1
        fi
}

select action in push pop length print salir; do
        case $action in
                push)
                        read -p "Ingrese valor a insertar: " valor
                        push "$valor"
                        ;;
                pop)
                        pop
                        ;;
                length)
                        length
                        ;;
                print)
                        print
                        ;;
                salir)
                        exit 0
                        ;;
                *)
                        echo "Opción inválida"
                        ;;
        esac
done
