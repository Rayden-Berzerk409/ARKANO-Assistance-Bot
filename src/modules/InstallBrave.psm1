# Módulo para descargar e instalar Brave
# Autor: Bard (ahora Gemini)
# Fecha: 17 de julio de 2024

# Importar módulos necesarios
Import-Module -Name Invoke-WebRequest

# Definir variables
$braveDownloadURL = "https://referrals.brave.com/latest/BraveBrowserSetup-BRV002.exe" # URL de descarga de Brave
$braveInstallerPath = "$env:LOCALAPPDATA\BraveSoftware\Brave\BraveBrowserSetup-BRV002.exe" # Ruta del ejecutable de instalación de Brave
$braveInstallArgs = "/S" # Argumentos para la instalación silenciosa

# Función para descargar e instalar Brave
function DownloadBrave {
    # Preguntar al usuario si desea descargar e instalar Brave
    $download = Read-Host "¿Desea descargar e instalar Brave? (S/N): "

    # Si la respuesta es S
    if ($download -eq "S") {
        # Informar al usuario del inicio de la fase 1 (descarga)
        Write-Host "Fase 1 de 2: Descarga de Brave iniciada."

        # Descargar Brave utilizando Invoke-WebRequest
        try {
            Invoke-WebRequest -Uri $braveDownloadURL -OutFile "$env:TEMP\BraveBrowserSetup-BRV002.exe" -UseBasicParsing
        } catch {
            Write-Error $_.Exception.Message
            Write-Host "Error al descargar Brave. Inténtalo de nuevo más tarde."
            return
        }

        # Informar al usuario de la finalización exitosa de la fase 1
        Write-Host "Fase 1 de 2: Descarga de Brave completada satisfactoriamente."

        # Informar al usuario del inicio de la fase 2 (instalación)
        Write-Host "Fase 2 de 2: Instalación de Brave iniciada."

        # Iniciar la instalación silenciosa de Brave
        Start-Process -FilePath $braveInstallerPath -ArgumentList $braveInstallArgs -Wait

        # Informar al usuario de la finalización exitosa de la fase 2
        Write-Host "Fase 2 de 2: Instalación de Brave completada satisfactoriamente."

        # Informar al usuario sobre la disponibilidad de Brave
        Write-Host "Brave ha sido instalado correctamente. Puedes encontrar el icono en el Escritorio y en la barra de tareas."
    } else {
        # Informar al usuario sobre la opción para volver a intentar
        Write-Host "Si deseas descargar e instalar Brave más tarde, puedes ejecutar la opción correspondiente en el menú de Descarga / Instalación de programas."
    }
}

# Exportar la función para que pueda ser utilizada desde otros scripts
Export-ModuleFunction -Name DownloadBrave
