#Comandos de busqueda o visualizacion de archivos POWERSHELL

param (
    [string]$ruta,
    [string]$nombre
)

Function Buscar-Archivo {
    param (
        [string]$ruta,
        [string]$nombre
    )
    
    $contador = 0

    Get-ChildItem -Path $ruta -Recurse | Where-Object { $_.Name -like "*$nombre*" } | ForEach-Object {
        Write-Host "Ubicación: $($_.FullName)"
        $contador++
    }

    if ($contador -eq 0) {
        Write-Host "No se encontraron archivos con el nombre o parte del nombre especificado."
    } else {
        Write-Host "Se encontraron $contador archivo(s) con el nombre o parte del nombre especificado."
    }
}

Function Buscar-Palabra {
    param (
        [string]$archivo,
        [string]$palabra
    )

    $contador = 0

    Get-Content -Path $archivo | ForEach-Object {
        if ($_ -match $palabra) {
            Write-Host "Palabra encontrada en línea: $_"
            $contador++
        }
    }

    if ($contador -eq 0) {
        Write-Host "No se encontró la palabra en el archivo."
    } else {
        Write-Host "La palabra se encontró $contador vez/veces en el archivo."
    }
}

Function Buscar-Palabra-Arch {
    param (
        [string]$ruta,
        [string]$nombre,
        [string]$palabra
    )

    Get-ChildItem -Path $ruta -Recurse | Where-Object { $_.Name -like "*$nombre*" } | ForEach-Object {
        Write-Host "Buscando en: $($_.FullName)"
        Buscar-Palabra -archivo $_.FullName -palabra $palabra
    }
}

$opcion = 0

while ($opcion -ne 4) {
    Write-Host "Menu de actividades:"
    Write-Host "1. Buscar archivo"
    Write-Host "2. Buscar palabra en archivo"
    Write-Host "3. Buscar palabra en archivos en una ruta"
    Write-Host "4. Salir"
    $opcion = Read-Host "Selecciona una opcion (1-4)"

    switch ($opcion) {
        1 {
            $ruta = Read-Host "Introduce la ruta:"
            $nombre = Read-Host "Introduce el nombre o parte del nombre del archivo:"
            Buscar-Archivo -ruta $ruta -nombre $nombre
            break
        }
        2 {
            $archivo = Read-Host "Introduce el nombre del archivo:"
            $palabra = Read-Host "Introduce la palabra o parte de la palabra a buscar:"
            Buscar-Palabra -archivo $archivo -palabra $palabra
            break
        }
        3 {
            $ruta = Read-Host "Introduce la ruta:"
            $nombre = Read-Host "Introduce el nombre o parte del nombre del archivo:"
            $palabra = Read-Host "Introduce la palabra o parte de la palabra a buscar:"
            Buscar-Palabra-Arch -ruta $ruta -nombre $nombre -palabra $palabra
            break
        }
        4 {
            Write-Host "Saliendo del programa..."
            break
        }
        default {
            Write-Host "Opcion no valida. Introduce una opcion valida (1-4)."
            break
        }
    }
}