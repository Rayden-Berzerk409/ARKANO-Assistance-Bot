# Módulo para descargar e instalar 7-Zip
# Autor: Bard
# Fecha: 18 de julio de 2024

# Importar módulos necesarios
Import-Module -Name Invoke-WebRequest

# Definir variables
$sevenZipDownloadURL = "https://7-zip.org/a/7z2407-x64.exe" # URL de descarga de 7-Zip
$sevenZipInstallerPath = "$env:LOCALAPPDATA\7-Zip\7z2407-x64.exe" # Ruta del ejecutable de instalación de 7-Zip
$sevenZipInstallArgs = '/S /D="C:\Program Files\7-Zip"' # Argumentos para la instalación silenciosa

# Función para descargar e instalar 7-Zip
function Download7Zip {
    # Preguntar al usuario si desea descargar e instalar 7-Zip
    $download = Read-Host "¿Desea descargar e instalar 7-Zip? (S/N): "

    # Si la respuesta es S
    if ($download -eq "S") {
        # Informar al usuario del inicio de la fase 1 (descarga)
        Write-Host "Fase 1 de 2: Descarga de 7-Zip iniciada."

        # Descargar 7-Zip utilizando Invoke-WebRequest
        try {
            Invoke-WebRequest -Uri $sevenZipDownloadURL -OutFile "$env:TEMP\7z2407-x64.exe" -UseBasicParsing
        } catch {
            Write-Error $_.Exception.Message
            Write-Host "Error al descargar 7-Zip. Inténtalo de nuevo más tarde."
            return
        }

        # Informar al usuario de la finalización exitosa de la fase 1
        Write-Host "Fase 1 de 2: Descarga de 7-Zip completada satisfactoriamente."

        # Informar al usuario del inicio de la fase 2 (instalación)
        Write-Host "Fase 2 de 2: Instalación de 7-Zip iniciada."

        # Iniciar la instalación silenciosa de 7-Zip
        Start-Process -FilePath $sevenZipInstallerPath -ArgumentList $sevenZipInstallArgs -Wait

        # Informar al usuario de la finalización exitosa de la fase 2
        Write-Host "Fase 2 de 2: Instalación de 7-Zip completada satisfactoriamente."

        # Informar al usuario sobre la disponibilidad de 7-Zip
        Write-Host "7-Zip ha sido instalado correctamente. Puedes encontrar el ejecutable en la carpeta C:\Program Files (x86)\7-Zip."
    } else {
        # Informar al usuario sobre la opción para volver a intentar
        Write-Host "Si deseas descargar e instalar 7-Zip más tarde, puedes ejecutar la opción correspondiente en el menú de Descarga / Instalación de programas."
    }
}

# Exportar la función para que pueda ser utilizada desde otros scripts
Export-ModuleFunction -Name Download7Zip