# Limpia la pantalla
Clear-Host

# Función para mostrar las primeras y últimas n líneas de un archivo de log
function MostrarPrimerasYUltimasNLíneas($rutaArchivo, $n) {
    $contenido = Get-Content $rutaArchivo
    $totalLíneas = $contenido.Count
    if ($n -ge $totalLíneas) {
        Write-Host "Mostrando todas las líneas del archivo:"
        $contenido
    } else {
        Write-Host "Primeras $n líneas del archivo:"
        $contenido[0..($n-1)]
        Write-Host "Últimas $n líneas del archivo:"
        $contenido[($totalLíneas-$n)..($totalLíneas-1)]
    }
}

# Función para mostrar las líneas que contienen una palabra particular
function MostrarLíneasConPalabra($rutaArchivo, $palabra) {
    $contenido = Get-Content $rutaArchivo | Select-String -Pattern $palabra
    Write-Host "Líneas que contienen la palabra '$palabra' en el archivo:"
    $contenido.Line
}

# Rutas de archivos de log (sustituye con las rutas correctas)
$rutaLog1 = " C:\Windows\System32\winevt\Logs"

# Menú de actividades
do {
    Write-Host "Menú de actividades:"
    Write-Host "1. Mostrar primeras y últimas n líneas de Log"
    Write-Host "2. Buscar líneas con una palabra en Log"
    Write-Host "3. Salir"
    
    $opcion = Read-Host "Selecciona una opción (1-3):"

    switch ($opcion) {
        1 { 
            $n = Read-Host "Introduce el número de líneas a mostrar para Log:"
            MostrarPrimerasYUltimasNLíneas $rutaLog1 $n
        }
        2 { 
            $palabra = Read-Host "Introduce la palabra a buscar en Log:"
            MostrarLíneasConPalabra $rutaLog1 $palabra
        }
        3 { Write-Host "Saliendo del programa..." }
        default { Write-Host "Opción no válida. Introduce una opción válida (1-3)." }
    }
} while ($opcion -ne "3")