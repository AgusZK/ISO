#!/bin/bash
# 17 Escribir un script que al ejecutarse imprima en pantalla los nombre de los archivos que se encuentran en el directorio actual, intercambiando minúsculas por mayúsculas, además de eliminar la letra a (mayúscula o minúscula). Por ejemplo, si en el directorio actual están los siguientes archivos: ➢ IsO ➢ pepE ➢ Maria


echo "Nombres de archivos antes del cambio: $(ls)"
echo "Despues:"

for i in *; do
    echo "$i" | tr 'a-zA-Z' 'A-Za-z' | tr -d 'aA'
done

