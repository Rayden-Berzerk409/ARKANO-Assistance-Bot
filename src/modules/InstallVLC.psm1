# Módulo para descargar e instalar VLC Media Player
# Autor: Bard
# Fecha: 18 de julio de 2024

# Importar módulos necesarios
Import-Module -Name Invoke-WebRequest

# Definir variables
$vlcDownloadURL = "https://edgeuno-bog2.mm.fcix.net/videolan-ftp/vlc/3.0.21/win64/vlc-3.0.21-win64.exe" # URL de descarga de VLC Media Player
$vlcInstallerPath = "$env:LOCALAPPDATA\vlc\vlc-3.0.21-win64.exe" # Ruta del ejecutable de instalación de VLC Media Player
$vlcInstallArgs = "/L=9226 /S" # Argumentos para la instalación silenciosa

# Función para descargar e instalar VLC Media Player
function DownloadVLC {
    # Preguntar al usuario si desea descargar e instalar VLC Media Player
    $download = Read-Host "¿Desea descargar e instalar VLC Media Player? (S/N): "

    # Si la respuesta es S
    if ($download -eq "S") {
        # Informar al usuario del inicio de la fase 1 (descarga)
        Write-Host "Fase 1 de 2: Descarga de VLC Media Player iniciada."

        # Descargar VLC Media Player utilizando Invoke-WebRequest
        try {
            Invoke-WebRequest -Uri $vlcDownloadURL -OutFile "$env:TEMP\vlc-3.0.21-win64.exe" -UseBasicParsing
        } catch {
            Write-Error $_.Exception.Message
            Write-Host "Error al descargar VLC Media Player. Inténtalo de nuevo más tarde."
            return
        }

        # Informar al usuario de la finalización exitosa de la fase 1
        Write-Host "Fase 1 de 2: Descarga de VLC Media Player completada satisfactoriamente."

        # Informar al usuario del inicio de la fase 2 (instalación)
        Write-Host "Fase 2 de 2: Instalación de VLC Media Player iniciada."

        # Iniciar la instalación silenciosa de VLC Media Player
        Start-Process -FilePath $vlcInstallerPath -ArgumentList $vlcInstallArgs -Wait

        # Informar al usuario de la finalización exitosa de la fase 2
        Write-Host "Fase 2 de 2: Instalación de VLC Media Player completada satisfactoriamente."

        # Informar al usuario sobre la disponibilidad de VLC Media Player
        Write-Host "VLC Media Player ha sido instalado correctamente. Puedes encontrar el icono en el Escritorio y en la barra de tareas."
    } else {
        # Informar al usuario sobre la opción para volver a intentar
        Write-Host "Si deseas descargar e instalar VLC Media Player más tarde, puedes ejecutar la opción correspondiente en el menú de Descarga / Instalación de programas."
    }
}

# Exportar la función para que pueda ser utilizada desde otros scripts
Export-ModuleFunction -Name DownloadVLC