# Módulo para descargar e instalar Microsoft Edge
# Autor: Bard (ahora Gemini)
# Fecha: 17 de julio de 2024

# Importar módulos necesarios
Import-Module -Name Invoke-WebRequest

# Definir variables
$edgeDownloadURL = "https://c2rsetup.officeapps.live.com/c2r/downloadEdge.aspx?platform=Default&source=EdgeStablePage&Channel=Stable&language=es&brand=M100" # URL de descarga de Edge (para consumidores)
$edgeInstallerPath = "$env:LOCALAPPDATA\Microsoft\Edge\Install\MicrosoftEdgeSetup.exe" # Ruta del ejecutable de instalación de Edge
$edgeInstallArgs = "/silent" # Argumentos para la instalación silenciosa

# Función para descargar Google Chrome
function DownMicrosoftEdge {
    # Preguntar al usuario si desea descargar e instalar Microsoft Edge
    $download = Read-Host "¿Deseas descargar e instalar Microsoft Edge? (S/N): "

    # Si la respuesta es S
    if ($download -eq "S") {
        # Informar al usuario del inicio de la fase 1 (descarga)
        Write-Host "Fase 1 de 2: Descarga de Microsoft Edge iniciada."

        # Descargar Microsoft Edge utilizando Invoke-WebRequest
        try {
            Invoke-WebRequest -Uri $edgeDownloadURL -OutFile "$env:TEMP\MicrosoftEdgeSetup.exe" -UseBasicParsing
        } catch {
            Write-Error $_.Exception.Message
            Write-Host "Error al descargar Microsoft Edge. Inténtalo de nuevo más tarde."
            return
        }

        # Informar al usuario de la finalización exitosa de la fase 1
        Write-Host "Fase 1 de 2: Descarga de Microsoft Edge completada satisfactoriamente."

        # Informar al usuario del inicio de la fase 2 (instalación)
        Write-Host "Fase 2 de 2: Instalación de Microsoft Edge iniciada."

        # Iniciar la instalación silenciosa de Microsoft Edge
        Start-Process -FilePath $edgeInstallerPath -ArgumentList $edgeInstallArgs -Wait

        # Informar al usuario de la finalización exitosa de la fase 2
        Write-Host "Fase 2 de 2: Instalación de Microsoft Edge completada satisfactoriamente."

        # Informar al usuario sobre la disponibilidad de Microsoft Edge
        Write-Host "Microsoft Edge ha sido instalado correctamente. Puedes encontrar el icono en el Escritorio y en la barra de tareas ;)."
        Start-Sleep -Seconds 5
        return
    } else {
        # Informar al usuario sobre la opción para volver a intentar
        Write-Host "Si deseas descargar e instalar Microsoft Edge más tarde, puedes ejecutar la opción correspondiente en el menú de Descarga / Instalación de programas."
        Start-Sleep -Seconds 5
        return
    }
}

# Exportar la función para que pueda ser utilizada desde otros scripts
Export-ModuleFunction -Name DownMicrosoftEdge