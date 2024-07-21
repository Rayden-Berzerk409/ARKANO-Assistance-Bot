# Módulo para descargar e instalar Internet Download Manager (IDM)
# Autor: Bard
# Fecha: 18 de julio de 2024

# Importar módulos necesarios
Import-Module -Name Invoke-WebRequest

# Definir variables
$idmDownloadURL = "https://mirror2.internetdownloadmanager.com/idman642build15.exe?v=lt&filename=idman642build15.exe" # URL de descarga de IDM
$idmInstallerPath = "$env:LOCALAPPDATA\IDM\idman642build15.exe" # Ruta del ejecutable de instalación de IDM
$idmInstallArgs = "/skipdlgs" # Argumentos para la instalación silenciosa

# Función para descargar e instalar IDM
function DownloadIDM {
    # Preguntar al usuario si desea descargar e instalar IDM
    $download = Read-Host "¿Desea descargar e instalar Internet Download Manager (IDM)? (S/N): "

    # Si la respuesta es S
    if ($download -eq "S") {
        # Informar al usuario del inicio de la fase 1 (descarga)
        Write-Host "Fase 1 de 2: Descarga de Internet Download Manager (IDM) iniciada."

        # Descargar IDM utilizando Invoke-WebRequest
        try {
            Invoke-WebRequest -Uri $idmDownloadURL -OutFile "$env:TEMP\idman642build15.exe" -UseBasicParsing
        } catch {
            Write-Error $_.Exception.Message
            Write-Host "Error al descargar Internet Download Manager (IDM). Inténtalo de nuevo más tarde."
            return
        }

        # Informar al usuario de la finalización exitosa de la fase 1
        Write-Host "Fase 1 de 2: Descarga de Internet Download Manager (IDM) completada satisfactoriamente."

        # Informar al usuario del inicio de la fase 2 (instalación)
        Write-Host "Fase 2 de 2: Instalación de Internet Download Manager (IDM) iniciada."

        # Iniciar la instalación silenciosa de IDM
        Start-Process -FilePath $idmInstallerPath -ArgumentList $idmInstallArgs -Wait

        # Informar al usuario de la finalización exitosa de la fase 2
        Write-Host "Fase 2 de 2: Instalación de Internet Download Manager (IDM) completada satisfactoriamente."

        # Informar al usuario sobre la disponibilidad de IDM
        Write-Host "Internet Download Manager (IDM) ha sido instalado correctamente. Puedes encontrar el icono en el Escritorio."
    } else {
        # Informar al usuario sobre la opción para volver a intentar
        Write-Host "Si deseas descargar e instalar Internet Download Manager (IDM) más tarde, puedes ejecutar la opción correspondiente en el menú de Descarga / Instalación de programas."
    }
}

# Exportar la función para que pueda ser utilizada desde otros scripts
Export-ModuleFunction -Name DownloadIDM