#Comandos de busqueda o visualizacion de archivos BASH

#!/bin/bash

buscar_archivo() {
    local ruta="$1"
    local nombre="$2"
    local contador=0

    for archivo in $(find "$ruta" -type f -name "*$nombre*"); do
        echo "Ubicacion: $archivo"
        contador=$((contador+1))
    done

    if [ $contador -eq 0 ]; then
        echo "No se encontraron archivos con el nombre o parte del nombre especificado."
    else
        echo "Se encontraron $contador archivo(s) con el nombre o parte del nombre especificado."
    fi
}

buscar_palabra() {
    local archivo="$1"
    local palabra="$2"
    local contador=0

    while read -r linea; do
        if [[ $linea == *"$palabra"* ]]; then
            echo "Palabra encontrada en línea: $linea"
            contador=$((contador+1))
        fi
    done < "$archivo"

    if [ $contador -eq 0 ]; then
        echo "No se encontró la palabra en el archivo."
    else
        echo "La palabra se encontró $contador vez/veces en el archivo."
    fi
}

buscar_palabra_arch() {
    local ruta="$1"
    local nombre="$2"
    local palabra="$3"

    for archivo in $(find "$ruta" -type f -name "*$nombre*"); do
        echo "Buscando en: $archivo"
        buscar_palabra "$archivo" "$palabra"
    done
}

menu() {
    echo "Menú de actividades:"
    echo "1. Buscar archivo"
    echo "2. Buscar palabra en archivo"
    echo "3. Buscar palabra en archivos en una ruta"
    echo "4. Salir"
}

while true; do
    menu
    read -p "Selecciona una opción (1-4): " opcion

    case $opcion in
        1)
            read -p "Introduce la ruta: " ruta
            read -p "Introduce el nombre o parte del nombre del archivo: " nombre
            buscar_archivo "$ruta" "$nombre"
            ;;
        2)
            read -p "Introduce el nombre del archivo: " archivo
            read -p "Introduce la palabra o parte de la palabra a buscar: " palabra
            buscar_palabra "$archivo" "$palabra"
            ;;
        3)
            read -p "Introduce la ruta: " ruta
            read -p "Introduce el nombre o parte del nombre del archivo: " nombre
            read -p "Introduce la palabra o parte de la palabra a buscar: " palabra
            buscar_palabra_arch "$ruta" "$nombre" "$palabra"
            ;;
        4)
            echo "Saliendo del programa..."
            exit 0
            ;;
        *)
            echo "Opcion no válida. Introduce una opcion válida (1-4)."
            ;;
    esac
done