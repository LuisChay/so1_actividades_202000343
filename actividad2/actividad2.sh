#!/bin/bash

#Solicitar el nombre de usuario de GitHub
read -p "Introduce el nombre de usuario de GitHub: " GITHUB_USER
echo " "

# Consultar la URL y guardar la respuesta JSON en una variable
response=$(curl -s "https://api.github.com/users/$GITHUB_USER")

# Verificar si el usuario existe
if [ "$(echo $response | jq -r '.message')" != "Not Found" ]; then 

    # Extraer los datos de la consulta y guardarlos en variables
    github_user=$(echo $response | jq -r .login)
    id=$(echo $response | jq -r .id)
    created_at=$(echo $response | jq -r .created_at)

    # Imprimir los datos
    echo "---------- Datos del usuario de GitHub ----------"
    echo "Hola $github_user. User ID: $id. Cuenta fue creada el: $created_at."
    echo " "

# Crear un directorio para el log
log_dir="/tmp/$(date +'%Y-%m-%d')"
mkdir -p "$log_dir"

# Escribir el mensaje en el log file
echo "Hola $github_user. User ID: $user_id. Cuenta fue creada el: $created_at." >> "$log_dir/saludos.log"

else
    # Imprimir mensaje de error si el usuario no existe
    echo -e "El usuario $GITHUB_USER no existe"
fi

# Redirigir la salida estándar y de error al log file
exec > /tmp/${fecha}/saludos.log 2>&1