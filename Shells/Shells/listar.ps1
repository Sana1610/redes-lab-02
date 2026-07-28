function ListarArchivos1($ruta, $opcion) {
    $archivos = Get-ChildItem -Path $ruta -Force
    switch ($opcion) {
        1 {
            $archivos = $archivos | Sort-Object -Property LastWriteTime -Descending
            break
        }
        2 {
            $archivos = $archivos | Sort-Object -Property LastWriteTime
            break
        }
        3 {
            $archivos = $archivos | Sort-Object -Property Length -Descending
            break
        }
        4 {
            $archivos = $archivos | Sort-Object -Property Length
            break
        }
        default {
            Write-Host "Opcion no valida."
            return
        }
    }

    # Mostrar resultados
    Write-Host "Lista de archivos en $ruta (incluyendo archivos ocultos):"
    $archivos | ForEach-Object { $_.Name }
    
    Write-Host "Cantidad de archivos: $($archivos.Count)"
}

# Función para listar archivos y aplicar condiciones de búsqueda
function ListarArchivos2($ruta, $condicion, $cadena) {
    # Obtener la lista de archivos, incluyendo los ocultos, en el directorio y sus subdirectorios
    $archivos = Get-ChildItem -Path $ruta -File -Recurse -Force

    # Filtrar archivos según la condición seleccionada
    switch ($condicion) {
        "Iniciar con" {
            $archivos = $archivos | Where-Object { $_.Name -like "$cadena*" }
            break
        }
        "Terminar con" {
            $archivos = $archivos | Where-Object { $_.Name -like "*$cadena" }
            break
        }
        "Contener" {
            $archivos = $archivos | Where-Object { $_.Name -like "*$cadena*" }
            break
        }
        default {
            Write-Host "Condición no válida."
            return
        }
    }

    # Mostrar resultados agrupados
    Write-Host "Archivos que $condicion '$cadena' en $ruta y subdirectorios:"
    $archivos | ForEach-Object { $_.Name }
    
    # Contar la cantidad de archivos agrupados por nombre
    $agrupados = $archivos | Group-Object -Property Name
    Write-Host "Cantidad de archivos encontrados: $($archivos.Count)"
    Write-Host "Cantidad de grupos de archivos: $($agrupados.Count)"
}

# Función para mostrar el menú
function MostrarMenu2() {
    Write-Host "Seleccione una opción:"
    Write-Host "1. Iniciar con"
    Write-Host "2. Terminar con"
    Write-Host "3. Contener"
    Write-Host "4. Salir"
}



# Función para mostrar el menú
function MostrarMenu1() {
    Write-Host "Seleccione una opción:"
    Write-Host "1. Mostrar archivos mas recientes"
    Write-Host "2. Mostrar archivos mas antiguos"
    Write-Host "3. Mostrar archivos por tamano (mayor a menor)"
    Write-Host "4. Mostrar archivos por tamano (menor a mayor)"
    Write-Host "5. Salir"
}

function MenuPrin() {
    Write-Host "Seleccione una opcion:"
    Write-Host "1. Ordenar por diferentes opciones"
    Write-Host "2. Ordenar por diferentes Condiciones"
    Write-Host "*. Salir"
}

# Bucle para mostrar el menú hasta que el usuario elija salir
while ($true) {
    MenuPrin
    $opcionM = Read-Host "Ingrese el numero de la opcion"
    if($opcionM -eq 1){
        MostrarMenu1
        $opcion = Read-Host "Ingrese el numero de la opcion"
        
        if ($opcion -eq 5) {
            break
        }
        
        $ruta = Read-Host "Ingrese la ruta del directorio a listar"
        
        if (Test-Path $ruta -PathType Container) {
            ListarArchivos1 $ruta $opcion
        } else {
            Write-Host "La ruta no es valida o el directorio no existe."
        }
    }elseif ($opcionM -eq 2) {
        MostrarMenu2
        $opcion = Read-Host "Ingrese el numero de la opcion"
        
        if ($opcion -eq 5) {
            break
        }
        
        $ruta = Read-Host "Ingrese la ruta del directorio a listar"
        
        if (Test-Path $ruta -PathType Container) {
            ListarArchivos2 $ruta $opcion
        } else {
            Write-Host "La ruta no es valida o el directorio no existe."
        }
    }else{
        break;
    }
}




