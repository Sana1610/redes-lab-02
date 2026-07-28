

listar() {
    # Hecho por Santiago Parra y Paula Paez
    local directorio="$1"
    while : 
    do
        echo "¿Que te gustaria hacer? (1) Ordenar y indicar cantidad de grupos; (2) encontrar cadenas y sus subdivisiones; (*) Salir"
        read opcion
        case $opcion in
            1)
                echo "ahora, ¿como deseas listar?:" 
                echo "(1) Mas reciente"
                echo "(2) Mas antiguo"
                echo "(3)Tamaño de mayor a menor"
                echo "(4)Tamaño de menor a mayor"
                echo "(5) Version"
                echo "(*) Salir"
                read opcion2
                case $opcion2 in
                    1) 
                        lista=$(ls -l --time-style=+"%Y-%m-%d %H:%M:%S")
                        # Ordenar la lista por fecha de modificación (columna 6)
                        ordenada=$(echo "$lista" | sort -k 6,7 -r)
                        grupos=$(echo "$ordenada" | awk '{print $6}' | uniq -c)
                        echo "hay $grupos grupos"

                    ;;
                    2)
                        lista=$(ls -l --time-style=+"%Y-%m-%d %H:%M:%S")
                        ordenada=$(echo "$lista" | sort -k 6,7)
                        grupos=$(echo "$ordenada" | awk '{print $6}' | uniq -c)

                        echo "hay $grupos grupos"
                    ;;
                    3)
                        lista=$(ls -l --time-style=+"%Y-%m-%d %H:%M:%S")
                        # Ordenar la lista por tamaño de archivo (columna 5)
                        sorted_list=$(echo "$file_list" | sort -k 5,5 -r)
                        grouped_list=$(echo "$ordenada" | awk '{print $5}' | uniq -c)
                        echo "hay $grupos grupos"
                    ;;
                    4)
                        lista=$(ls -l --time-style=+"%Y-%m-%d %H:%M:%S")
                        # Ordenar la lista por tamaño de archivo (columna 5)
                        ordenada=$(echo "$lista" | sort -k 5,5n)
                        grupos=$(echo "$ordenada" | awk '{print $5}' | uniq -c)
                        echo "hay $grupos grupos"
                    ;;
                    5)
                        lista=$(ls -l --time-style=+"%Y-%m-%d %H:%M:%S")
                        # Ordenar la lista por tamaño de archivo (columna 5)
                        ordenada=$(echo "$lista" | sort -t _ -k 2,2n)
                        grupos=$(echo "$ordenada" | awk '{print $5}' | uniq -c)
                        echo "hay $grupos grupos"
                    ;;
                    *)
                        echo "saliendo"
                        exit 0
                        break
                    ;;
                esac
                ;;
            2)
                echo "ahora, ¿como deseas listar?:"
                echo "(1) Inicie con una cadena dada"
                echo "(2) Termine con una cadena dada"
                echo "(3) Contenga una cadena dada"
                echo "(*) Salir"
                read opcion2
                case $opcion2 in
                    1) 

                    ;;
                    2)

                    ;;
                    3)

                    ;;
                    *)
                        echo "saliendo"
                        exit 0
                        break
                    ;;
                esac
            ;;
            *)
                echo "saliendo"
                exit 0
                break
            ;;
        esac
    done
}