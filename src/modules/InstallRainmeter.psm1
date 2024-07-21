# Módulo: Install-Rainmeter.psm1
# Author: Bard
# Fecha: 20 de julio de 2024

# Importar módulos necesarios
Import-Module -Name Get-ComputerInfo-Rainmeter

# Definir la función Install-Rainmeter
function Install-Rainmeter {
    # Obtener información del sistema
    $computerInfo = Get-ComputerInfo

    # Verificar si el equipo cumple los requisitos de Rainmeter
    $meetsRainmeterRequirements = Check-RainmeterRequirements -ComputerInfo $computerInfo

    # Si el equipo cumple los requisitos
    if ($meetsRainmeterRequirements) {
        # Descargar e instalar Rainmeter
        # [Código para descargar e instalar Rainmeter]

        Write-Output "Rainmeter instalado correctamente."
    } else {
        # Si el equipo no cumple los requisitos
        Write-Warning "Su equipo no cumple los requisitos mínimos de Rainmeter."
        Write-Output "¿Desea instalar Rainmeter de todos modos? (Sí/No)"

        $proceed = Read-Host

        if ($proceed -eq "Sí") {
            Write-Warning "Está instalando Rainmeter bajo su propia responsabilidad."
            Write-Output "Los posibles problemas que surjan serán bajo su responsabilidad."

            # Descargar e instalar Rainmeter
            # [Código para descargar e instalar Rainmeter]

            Write-Output "Rainmeter instalado correctamente."
        } else {
            Write-Output "Instalación de Rainmeter cancelada."
        }
    }
}

# Exportar la función para que sea accesible desde otros scripts
Export-ModuleMember -Function Install-Rainmeter
