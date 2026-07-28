newgroup(){
    local nombre="$1"
    local id="$2"

    groupadd -g $id $nombre 
}