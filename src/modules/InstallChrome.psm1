# Módulo para descargar e instalar Google Chrome
# Autor: Bard (ahora Gemini)
# Fecha: 17 de julio de 2024

# Importar módulos necesarios
Import-Module -Name Invoke-WebRequest

# Definir variables
$chromeDownloadURL = "https://dl.google.com/tag/s/appguid%3D%7B8A69D345-D564-463C-AFF1-A69D9E530F96%7D%26iid%3D%7B85FB8BDE-0A1B-59F0-A9F1-C8BF7268775B%7D%26lang%3Den%26browser%3D5%26usagestats%3D1%26appname%3DGoogle%2520Chrome%26needsadmin%3Dprefers%26ap%3Dx64-statsdef_1%26installdataindex%3Dempty/update2/installers/ChromeSetup.exe" # URL de descarga de Chrome (para consumidores)
$chromeInstallerPath = "$env:LOCALAPPDATA\Google\Chrome\Install\GoogleChromeSetup.exe" # Ruta del ejecutable de instalación de Chrome
$chromeInstallArgs = "/silent" # Argumentos para la instalación silenciosa

# Función para descargar Google Chrome
function DownGoogleChrome {
    # Preguntar al usuario si desea descargar e instalar Google Chrome
    $download = Read-Host "¿Deseas descargar e instalar Google Chrome? (S/N): "

    # Si la respuesta es S
    if ($download -eq "S") {
        # Informar al usuario del inicio de la fase 1 (descarga)
        Write-Host "Fase 1 de 2: Descarga de Google Chrome iniciada."

        # Descargar Google Chrome utilizando Invoke-WebRequest
        try {
            Invoke-WebRequest -Uri $chromeDownloadURL -OutFile "$env:TEMP\ChromeSetup.exe" -UseBasicParsing
        } catch {
            Write-Error $_.Exception.Message
            Write-Host "Error al descargar Google Chrome. Inténtalo de nuevo más tarde."
            return
        }

        # Informar al usuario de la finalización exitosa de la fase 1
        Write-Host "Fase 1 de 2: Descarga de Google Chrome completada satisfactoriamente."

        # Informar al usuario del inicio de la fase 2 (instalación)
        Write-Host "Fase 2 de 2: Instalación de Google Chrome iniciada."

        # Iniciar la instalación silenciosa de Google Chrome
        Start-Process -FilePath $chromeInstallerPath -ArgumentList $chromeInstallArgs -Wait

        # Informar al usuario de la finalización exitosa de la fase 2
        Write-Host "Fase 2 de 2: Instalación de Google Chrome completada satisfactoriamente."

        # Informar al usuario sobre la disponibilidad de Google Chrome
        Write-Host "Google Chrome ha sido instalado correctamente. Puedes encontrar el icono en el Escritorio y en la barra de tareas ;)."
        Start-Sleep -Seconds 5
        return
    } else {
        # Informar al usuario sobre la opción para volver a intentar
        Write-Host "Si deseas descargar e instalar Google Chrome más tarde, puedes ejecutar la opción correspondiente en el menú de Descarga / Instalación de programas."
        Start-Sleep -Seconds 5
        return
    }
}

# Exportar la función para que pueda ser utilizada desde otros scripts
Export-ModuleFunction -Name DownGoogleChrome
