# Módulo para descargar e instalar Mozilla Firefox
# Autor: Bard
# Fecha: 18 de julio de 2024

# Importar módulos necesarios
Import-Module -Name Invoke-WebRequest

# Definir variables
$firefoxDownloadURL = "https://download-installer.cdn.mozilla.net/pub/firefox/releases/128.0/win32/es-ES/Firefox Installer.exe" # URL de descarga de Firefox
$firefoxInstallerPath = "$env:LOCALAPPDATA\Mozilla\Firefox\Firefox Installer.exe" # Ruta del ejecutable de instalación de Firefox
$firefoxInstallArgs = "/S" # Argumentos para la instalación silenciosa

# Función para descargar e instalar Mozilla Firefox
function DownloadFirefox {
    # Preguntar al usuario si desea descargar e instalar Firefox
    $download = Read-Host "¿Desea descargar e instalar Mozilla Firefox? (S/N): "

    # Si la respuesta es S
    if ($download -eq "S") {
        # Informar al usuario del inicio de la fase 1 (descarga)
        Write-Host "Fase 1 de 2: Descarga de Mozilla Firefox iniciada."

        # Descargar Firefox utilizando Invoke-WebRequest
        try {
            Invoke-WebRequest -Uri $firefoxDownloadURL -OutFile "$env:TEMP\Firefox Installer.exe" -UseBasicParsing
        } catch {
            Write-Error $_.Exception.Message
            Write-Host "Error al descargar Mozilla Firefox. Inténtalo de nuevo más tarde."
            return
        }

        # Informar al usuario de la finalización exitosa de la fase 1
        Write-Host "Fase 1 de 2: Descarga de Mozilla Firefox completada satisfactoriamente."

        # Informar al usuario del inicio de la fase 2 (instalación)
        Write-Host "Fase 2 de 2: Instalación de Mozilla Firefox iniciada."

        # Iniciar la instalación silenciosa de Firefox
        Start-Process -FilePath $firefoxInstallerPath -ArgumentList $firefoxInstallArgs -Wait

        # Informar al usuario de la finalización exitosa de la fase 2
        Write-Host "Fase 2 de 2: Instalación de Mozilla Firefox completada satisfactoriamente."

        # Informar al usuario sobre la disponibilidad de Firefox
        Write-Host "Mozilla Firefox ha sido instalado correctamente. Puedes encontrar el icono en el Escritorio y en la barra de tareas."
    } else {
        # Informar al usuario sobre la opción para volver a intentar
        Write-Host "Si deseas descargar e instalar Mozilla Firefox más tarde, puedes ejecutar la opción correspondiente en el menú de Descarga / Instalación de programas."
    }
}

# Exportar la función para que pueda ser utilizada desde otros scripts
Export-ModuleFunction -Name DownloadFirefox