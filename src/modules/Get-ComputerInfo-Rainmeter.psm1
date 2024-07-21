# Módulo: Get-ComputerInfo-Rainmeter.psm1
# Author: Bard
# Fecha: 20 de julio de 2024

# Requerir módulos necesarios
Import-Module -Name WinRM

# Definir la función Get-ComputerInfo
function Get-ComputerInfo-Rainmeter {
    # Obtener información del sistema
    $computerInfo = Get-ComputerInfo

    # Obtener la versión de Windows
    $windowsVersion = $computerInfo.WindowsProductName + " " + $computerInfo.WindowsVersionNumber

    # Obtener la velocidad del reloj del CPU
    $cpuClockSpeed = $computerInfo.ProcessorBaseClock

    # Obtener la memoria RAM total y disponible
    $totalRAM = Get-WmiObject Win32_PhysicalMemory | Measure-Object -Sum -Property TotalPhysicalMemory
    $availableRAM = Get-WmiObject Win32_Process | Measure-Object -Sum -Property WorkingSet

    # Obtener la edición de ArkanoidOS
    $arkanoidOSEdition = Get-RegistryValue -Key HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation -Name Model

    # Analizar la edición de ArkanoidOS
    $arkanoidOSEdition = $arkanoidOSEdition -replace 'ArkanoidOS\s+', ''
    $arkanoidOSEditionParts = $arkanoidOSEdition.Split(' ')

    # Determinar la edición de ArkanoidOS
    if ($arkanoidOSEditionParts[1] -eq "Pro") {
        $arkanoidOSEdition = $arkanoidOSEditionParts[2] + " " + $arkanoidOSEditionParts[3]
    } else {
        $arkanoidOSEdition = $arkanoidOSEditionParts[1]
    }

    # Crear objeto de salida
    $computerInfoObject = New-Object -TypeName PSCustomObject
    $computerInfoObject | Add-Member -MemberType NoteProperty -Name "WindowsVersion" -Value $windowsVersion
    $computerInfoObject | Add-Member -MemberType NoteProperty -Name "CPUClockSpeed" -Value $cpuClockSpeed
    $computerInfoObject | Add-Member -MemberType NoteProperty -Name "TotalRAM" -Value $totalRAM.Sum -Unit GB
    $computerInfoObject | Add-Member -MemberType NoteProperty -Name "AvailableRAM" -Value $availableRAM.Sum -Unit GB
    $computerInfoObject | Add-Member -MemberType NoteProperty -Name "ArkanoidOSEdition" -Value $arkanoidOSEdition

    # Devolver el objeto de salida
    return $computerInfoObject
}

# Exportar la función para que sea accesible desde otros scripts
Export-ModuleMember -Function Get-ComputerInfo