newuser(){
    local nombre="$1"
    local grupo="$2"
    local descripcion="$3"
    local directorio="$4"
    local shell="$5"
    local permisoU="$6"
    local permisoG="$7"
    local permisoO="$8"
    echo "que contraseña deseeas?"
    read contraseña

    echo "creando usuario"
    useradd -m -d $directorio -s $shell -c $descripcion -g $frupo $nombre 
    

}