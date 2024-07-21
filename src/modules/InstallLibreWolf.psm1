# Módulo para descargar e instalar LibreWolf
# Autor: Bard
# Fecha: 18 de julio de 2024

# Importar módulos necesarios
Import-Module -Name Invoke-WebRequest

# Definir variables
$librewolfDownloadURL = "https://gitlab.com/api/v4/projects/44042130/packages/generic/librewolf/128.0-2/librewolf-128.0-2-windows-x86_64-setup.exe" # URL de descarga de LibreWolf
$librewolfInstallerPath = "$env:LOCALAPPDATA\LibreWolf\librewolf-128.0-2-windows-x86_64-setup.exe" # Ruta del ejecutable de instalación de LibreWolf
$librewolfInstallArgs = "/S" # Argumentos para la instalación silenciosa

# Función para descargar e instalar LibreWolf
function DownloadLibreWolf {
    # Preguntar al usuario si desea descargar e instalar LibreWolf
    $download = Read-Host "¿Desea descargar e instalar LibreWolf? (S/N): "

    # Si la respuesta es S
    if ($download -eq "S") {
        # Informar al usuario del inicio de la fase 1 (descarga)
        Write-Host "Fase 1 de 2: Descarga de LibreWolf iniciada."

        # Descargar LibreWolf utilizando Invoke-WebRequest
        try {
            Invoke-WebRequest -Uri $librewolfDownloadURL -OutFile "$env:TEMP\librewolf-128.0-2-windows-x86_64-setup.exe" -UseBasicParsing
        } catch {
            Write-Error $_.Exception.Message
            Write-Host "Error al descargar LibreWolf. Inténtalo de nuevo más tarde."
            return
        }

        # Informar al usuario de la finalización exitosa de la fase 1
        Write-Host "Fase 1 de 2: Descarga de LibreWolf completada satisfactoriamente."

        # Informar al usuario del inicio de la fase 2 (instalación)
        Write-Host "Fase 2 de 2: Instalación de LibreWolf iniciada."

        # Iniciar la instalación silenciosa de LibreWolf
        Start-Process -FilePath $librewolfInstallerPath -ArgumentList $librewolfInstallArgs -Wait

        # Informar al usuario de la finalización exitosa de la fase 2
        Write-Host "Fase 2 de 2: Instalación de LibreWolf completada satisfactoriamente."

        # Informar al usuario sobre la disponibilidad de LibreWolf
        Write-Host "LibreWolf ha sido instalado correctamente. Puedes encontrar el icono en el Escritorio y en la barra de tareas."
    } else {
        # Informar al usuario sobre la opción para volver a intentar
        Write-Host "Si deseas descargar e instalar LibreWolf más tarde, puedes ejecutar la opción correspondiente en el menú de Descarga / Instalación de programas."
    }
}

# Exportar la función para que pueda ser utilizada desde otros scripts
Export-ModuleFunction -Name DownloadLibreWolf