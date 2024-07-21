Import-Module -DisableNameChecking "$PSScriptRoot\src\modules\InstallChrome.psm1" -Force
Import-Module -DisableNameChecking "$PSScriptRoot\src\modules\InstallEdge.psm1" -Force
Import-Module -DisableNameChecking "$PSScriptRoot\src\modules\InstallBrave.psm1" -Force
Import-Module -DisableNameChecking "$PSScriptRoot\src\modules\InstallFirefox.psm1" -Force
Import-Module -DisableNameChecking "$PSScriptRoot\src\modules\InstallLibreWolf.psm1" -Force
Import-Module -DisableNameChecking "$PSScriptRoot\src\modules\InstallVLC.psm1" -Force
Import-Module -DisableNameChecking "$PSScriptRoot\src\modules\InstallKLCP.psm1" -Force
Import-Module -DisableNameChecking "$PSScriptRoot\src\modules\Install7Zip.psm1" -Force
Import-Module -DisableNameChecking "$PSScriptRoot\src\modules\InstallIDM.psm1" -Force

# Obtener el estado de ejecución como administrador
$isElevated = Test-Path -Path 'HKLM:\SAM\Administrators'

# Establecer el título base
$baseTitle = "ARKANO Assistance Bot for ArkanoidOS, v1.0"

# Establecer el título condicional
if ($isElevated) {
  $title = "Administrador: $baseTitle"
} else {
  $title = "[No Administrador] $baseTitle"
}

# Cambiar el título de la ventana
Set-Title -Title $title

# Logo de ARKANO Assistance Bot en arte ASCII
function Show-ARKANO-Logo {
    Write-Host "                                                                                                                                                         "
    Write-Host "                                                                                                                                                         "
    Write-Host "                                     :===      -==========:  :==:     :===     :===      -===-     ===.  -=========.                                  "
    Write-Host "                                     +@@*      %@@@@@@@@@@@: +@@*    .@@@#     +@@#.     %@@@%.    @@@- *@@@@@@@@@@%.                                 "
    Write-Host "                                    .@@@=      %@@@@@@@@@@@@ +@@*    #@@@=    .%@@=      %@@@@+    @@@-:@@@@@@@@@@@@+                                 "
    Write-Host "                                    -@@%..+    =+++++++++@@@ +@@*   =@@@+     :@@@:.*    %@@@@@-   @@@-=@@@++++++#@@@                                 "
    Write-Host "                                    @@@% #%              @@@ +@@*  -@@@%      %@@% #%    %@@@@@@   @@@-+@@#.     +@@@                                 "
    Write-Host "                                   .@@@: %@-   ..........@@@ +@@*..*@@@.      @@@- %@=   %@@+@@@%  @@@-+@@#.     +@@@                                 "
    Write-Host "                                   #@@@ =@@+   %@@@@@@@@@@@@ +@@@@@@@@=      *@@@ -@@+   %@@:*@@@= @@@-+@@#.     +@@@                                 "
    Write-Host "                                  .%@@- +@@@.  %@@@@@@@@@@@+ +@@@@@@@@=      %@@= +@@@.  %@@: #@@@.@@@-+@@#.     +@@@                                 "
    Write-Host "                                  +@@@-.=@@@:  %@@%%%@@@@%+  +@@@%%@@@@:    =@@@-.-@@@:  %@@: -@@@%@@@-+@@#.     +@@@                                 "
    Write-Host "                                  *@@@@@@@@@%  %@@.   @@@@:  +@@*   =@@@*  .@@@@@@@@@@@. %@@:   %@@@@@-+@@@******%@@@                                 "
    Write-Host "                                 .@@@@@@@@@@@  %@@.   .@@@*  +@@*    %@@@- -@@@%%%%%@@@# %@@:   .@@@@@-:@@@@@@@@@@@@+                                 "
    Write-Host "                                 @@@*     +@@%.%@@.    +@@@+ +@@*    .%@@#.@@@#     =@@%.%@@:    =@@@@- =@@@@@@@@@@#.                                 "
    Write-Host "                                .+++      .+++:=++.     ++++ -++-     -+++-+++.     .+++:=++.     ++++:  :=+++++++:                                   "
    Write-Host "                                                                                                                                                      "
    Write-Host "                                                                                                     Assistance Bot for ArkanoidOS, v1.0            "
    Write-Host "                                                                                                                                                    "
}
function Show-Welcome-Message {
    $originalEncoding = $OutputEncoding
    $OutputEncoding = [System.Text.Encoding]::Unicode
    Write-Host "--------------------------------------- BIENVENIDO AL ARKANO ASSISTANCE BOT FOR ArkanoidOS, v1.0 ------------------------------------------------------"
    Write-Host "¡Hola! Te doy la bienvenida. Soy ARKANO, el script tipo bot automatizado oficial de ArkanoidOS," 
    Write-Host "y estoy aquí para ayudarte a dar tus primeros pasos con ArkanoidOS, o ayudarte mientras lo usas."
    Write-Host "Esto es de lo que soy capaz:"
    Write-Host "- Puedo ayudarte a descargar e instalar el software y programas que usas de forma automática."
    Write-Host "- Puedo configurar por ti ciertos perfiles de personalización en el sistema, para hacerlo más único."
    Write-Host "- Puedo ayudarte a optimizarlo en casos de emergencia, para desbloquear su potencial."
    Write-Host "- Puedo ayudarte a habilitar algunos parámetros útiles en el sistema, y así brindarte acceso a algunas herramientas o cosas útiles."
    Write-Host ""
    Write-Host "Cabe aclararte que, en mi menú principal, luego de esta pantalla, habrá una opción que te permitirá habilitar la Protección del sistema (en caso de que no la tengas activada) y crear un punto de restauración, en caso de que alguna de las cosas que realizo cause algún daño en el sistema."
    Write-Host ""
    Write-Host "¡Estoy aquí para ayudarte! Si me necesitas, abre el Menú Extendido de ArkanoidOS y allí me encontrarás. Dale a la opción 'Iniciar ARKANO Assistance Bot'."
    Write-Host ""
    Write-Host "Cuando estés listo para comenzar, responde abajo con una S y pulsa Enter para comenzar."
    Write-Host ""

    # Restablecer la codificación de la consola a la original
    $OutputEncoding = $originalEncoding
}

function Show-Main-Menu {
    Write-Host "-----------------------------------------------------------------------------------------------------"
    Write-Host "|                                                                                                   |"
    Write-Host "|                                          MENÚ PRINCIPAL                                           |"
    Write-Host "|                                                                                                   |"
    Write-Host "-----------------------------------------------------------------------------------------------------"
    Write-Host "1. Descarga / Instalación de programas"
    Write-Host "2. Configurar aspecto / personalización del sistema"
    Write-Host "3. Optimizar el sistema"
    Write-Host "4. Caja de Herramientas de ArkanoidOS"
    Write-Host "5. Activar Protección del sistema / Crear punto de restauración (¡Recomendado!)"
    Write-Host "6. Salir"
    Write-Host "-----------------------------------------------------------------------------------------------------"
}

function Show-SubMenu-1 {
    Write-Host "-----------------------------------------------------------------------------------------------------"
    Write-Host "|                                                                                                   |"
    Write-Host "|                         DESCARGA E INSTALACIÓN DE SOFTWARE O PROGRAMAS                            |"
    Write-Host "|                                                                                                   |"
    Write-Host "-----------------------------------------------------------------------------------------------------"
    Write-Host "1. Descargar / instalar Google Chrome"
    Write-Host "2. Descargar / instalar Microsoft Edge"
    Write-Host "3. Descargar / instalar Brave"
    Write-Host "4. Descargar / instalar Mozilla Firefox"
    Write-Host "5. Descargar / instalar Navegador LibreWolf"
    Write-Host "6. Descargar / instalar VLC Media Player"
    Write-Host "7. Descargar / instalar K-Lite Codec Pack"
    Write-Host "8. Descargar / instalar Rainmeter"
    Write-Host "9. Descargar / instalar Lively Wallpaper"
    Write-Host "10. Descargar / instalar 7-Zip"
    Write-Host "11. Descargar / instalar IDM (Internet Download Manager)"
    Write-Host "12. Descargar / instalar Microsoft PowerToys"
    Write-Host "13. Regresar al menú principal"
    Write-Host "-----------------------------------------------------------------------------------------------------"
}

function Show-Submenu-2 {
    Write-Host "-------------------------------------------------------------------------------------------------------------------"
    Write-Host "|                                                                                                                 |"
    Write-Host "|                             CONFIGURAR EL ASPECTO / PERSONALIZACIÓN DEL SISTEMA                                 |"        
    Write-Host "|                                                                                                                 |"
    Write-Host "-------------------------------------------------------------------------------------------------------------------"
    Write-Host "1. Activar el modo oscuro o claro para todas las aplicaciones"
    Write-Host "2. Cambiar la orientación de los elementos en la barra de tareas (sólo Resurrection OS 11)"
    Write-Host "3. Activar/Desactivar efectos de transparencia"
    Write-Host "4. Aplicar los temas para Windows oficiales de Resurrection OS"
    Write-Host "5. Desactivar Mostrar sugerencias ocasionalmente en Inicio"
    Write-Host "6. Instalar skin de Rainmeter (¡úsalo sólo si tienes Rainmeter instalado!)"
    Write-Host "7. Regresar al menú principal"
    Write-Host "-------------------------------------------------------------------------------------------------------------------"
}

function Show-Submenu-3 {
    Clear-Host
    Write-Host "-----------------------------------------------------------------------------------------------------------------"
    Write-Host "|                                                                                                               |"
    Write-Host "|                                    OPTIMIZACIÓN DEL SISTEMA                                                   |"
    Write-Host "|                                                                                                               |"
    Write-Host "-----------------------------------------------------------------------------------------------------------------"
    Write-Host "1. Apagar el servicio de ubicación para tu cuenta y aplicaciones"
    Write-Host "2. Añadir prioridad en el Registro de Windows para los juegos"
    Write-Host "3. Evitar que las aplicaciones innecesarias se autoinicien con el sistema"
    Write-Host "4. Desactivar el Xbox Game Bar"
    Write-Host "5. Desactivar la limitación de energía (Power Throttling)" 
    Write-Host "(¡úsalo sólo si tienes PC de bajos o bajos-medios recursos, y corriendo Resurrection OS Go!)"
    Write-Host "6. Deshabilitar Bloatware (apps no deseadas)"
    Write-Host "7. Desactivar la sincronización"
    Write-Host "8. Desactivar el Game DVR (Xbox Game Bar, para grabar clips y capturar pantalla)"
    Write-Host "9. Desactivar la telemetría (Modo suave)"
    Write-Host "10. Desactivar optimizaciones de pantalla completa para el Game DVR"
    Write-Host "11. Deshabilitar aplicaciones en segundo plano (Modo Suave)"
    Write-Host "12. Aplicar tweaks de rendimiento generales (priorizar reloj del sistema, mejorar tiempo de apagado,"
    Write-Host "cierre de servicios previo a apagado, etc.)"
    Write-Host "13. Habilitar paginaciones grandes para mejores niveles de FPS para juegos populares"
    Write-Host "(Warframe, League of Legends, The Witcher 3 y GTA V)"
    Write-Host "14. Optimizar la conexión a Internet (limitar las conexiones simultáneas permitidas," 
    Write-Host "activar envío de datos no bloqueantes, etc.)"
    Write-Host "15. Personalizar la rapidez, fluidez y apariencia del cursor del mouse"
    Write-Host "16. Aumentar tu rendimiento al 20% (Resurrection OS Rocket Boost Mode)"
    Write-Host "17. Desactivar Windows Search"
    Write-Host "18. Desactivar Windows Security Health Hub"
    Write-Host "19. Desactivar Servicios de diagnóstico"
    Write-Host "20. Desactivar la telemetría (Modo AGRESIVO)"
    Write-Host "21. Desactivar efectos de transparencia"
    Write-Host "22. Desactivar servicios de Xbox"
    Write-Host "23. Desactivar Windows Defender (¡por completo!)"
    Write-Host "24. Establecer en ALTA la prioridad de la CPU y la GPU"
    Write-Host "25. Desactivar el Administrador de mapas descargados"
    Write-Host "26. Desactivar TODA la ejecución en segundo plano"
    Write-Host "27. Regresar al menú anterior"
    Write-Host "-----------------------------------------------------------------------------------------------------------------"
}

function ShowToolBoxMenu {
    Write-Host "-----------------------------------------------------------------------------------------------------------------"
    Write-Host "|                                                                                                               |"
    Write-Host "|                                                  CAJA DE HERRAMIENTAS DE RESURRECTION OS                      |"
    Write-Host "|                                                                                                               |"
    Write-Host "-----------------------------------------------------------------------------------------------------------------"
    Write-Host "1. Ejecutar CHKDSK"
    Write-Host "2. Ejecutar la herramienta SFC (System File Checker)"
    Write-Host "3. Escanear el sistema en busca de daños (argumento /ScanHealth de DISM"
    Write-Host "(Herramienta Administración y mantenimiento de imágenes de implementación))"
    Write-Host "4. Escanear el sistema en busca de daños y repararlos (argumento /RestoreHealth de DISM"
    Write-Host "(Herramienta Administración y mantenimiento de imágenes de implementación))"
    Write-Host "5. Ejecutar DISKPART (Administrador de discos, volúmenes y particiones desde la línea de comandos)"
    Write-Host "6. Liberar espacio en disco (ejecutar cleanmgr)"
    Write-Host "7. Activar Office"
    Write-Host "8. Conoce tu IP (ipconfig)"
    Write-Host "9. Limpia la caché del DNS (ipconfig /flushdns)"
    Write-Host "10. Formatea unidades (¡úsala con cuidado!)"
    Write-Host "11. Lista de todos los procesos activos en el sistema"
    Write-Host "12. Matar o terminar procesos o árboles de procesos activos"
    Write-Host "13. Ejecuta el WinSAT (hacer un benchmark del PC)"
    Write-Host "14. Realiza un ping de la red (ping google.com)"
    Write-Host "15. Limpiar archivos temporales"
    Write-Host "16. Regresar al menú principal"
    Write-Host "-----------------------------------------------------------------------------------------------------------------"
}

function Show-Submenu-5 {
    Write-Host "-----------------------------------------------------------------------------------------------------------------"
    Write-Host "|                                                                                                               |"                                                                                                   
    Write-Host "|                   ACTIVAR LA PROTECCIÓN DEL SISTEMA | CREAR PUNTOS DE RESTAURACIÓN                            |"
    Write-Host "|                                                                                                               |"                                                                                        
    Write-Host "-----------------------------------------------------------------------------------------------------------------"
    Get-RestorePointStatus
    Write-Host "1. Activar la Proteccion del sistema"
    Write-Host "2. Crear un punto de restauración (¡NO USAR EN EXCESO, YA QUE PUEDE LLENAR EL DISCO!)"
    Write-Host "3. Regresar al menú anterior"
    Write-Host "-----------------------------------------------------------------------------------------------------------------"
}
# Función principal del bot
function Show-ARKANO-Assistance-Bot {
    # Verificar si se ejecuta como Administrador
    if ($isElevated) {
        # Se ejecuta desde el menú extendido (elevado)
        Show-ARKANO-Logo
        Show-Welcome-Message

        # Preguntar si el usuario está listo para comenzar
        $ready = Read-Host "¿Estás listo para comenzar? (S/N): "

        # Si el usuario está listo
        if ($ready -eq "S") {
            do {
                # Mostrar el menú principal
                Show-Main-Menu

                # Leer la opción del usuario
                $option = Read-Host "Ingresa el número de la opción que desees usar: "

                # Procesar la opción seleccionada
                switch ($option) {
                    # Opción 1
                    "1" {
                        do {
                            Clear-Host

                            # Mostrar el submenú 1 del menú principal
                            Show-SubMenu-1

                            # Leer la opción del usuario
                            $softwareSelect = Read-Host "¿Qué deseas hacer?"

                            # Procesar la opción seleccionada
                            switch ($softwareSelect) {
                                "1" {
                                    Clear-Host
                                    DownGoogleChrome -Wait
                                    continue
                                }
                                "2" {
                                    Clear-Host
                                    DownMicrosoftEdge -Wait
                                    continue
                                }
                                "3" {
                                    Clear-Host
                                    DownloadBrave -Wait
                                    continue
                                }
                                "4" {
                                    Clear-Host
                                    DownloadFirefox -Wait
                                    continue
                                }
                                "5" {
                                    Clear-Host
                                    DownloadLibreWolf -Wait
                                    continue
                                }
                                "6" {
                                    Clear-Host
                                    DownloadVLC -Wait
                                    continue
                                }
                                "7" {
                                    Clear-Host
                                    DownloadKLCP -Wait
                                    continue
                                }
                                "8" {
                                    Clear-Host
                                    & "$optionsMiscTasksFolderPath\misc_tasks_option_8.ps1" -Wait
                                    if ($env:ScriptMiscOpción8 = "script-miscelaneo-terminado"){
                                        Clear-Host
                                        continue
                                    }
                                }
                                "9" {
                                    Clear-Host
                                    & "$installersFolderPath\instalador_7zip.ps1" -Wait
                                    if ($env:Instalador7ZEstado -eq "regresar-al-menu"){
                                        Clear-Host
                                        continue
                                    }
                                }
                                "10" {
                                    Clear-Host
                                    Download7Zip -Wait
                                    continue
                                }
                                "11" {
                                    Clear-Host
                                    DownloadIDM -Wait
                                    continue
                                }
                                "12"{
                                    Clear-Host
                                    
                                }
                                "13" {
                                    Clear-Host
                                    Write-Host "De acuerdo. Regresando al menú principal..." -ForegroundColor Yellow
                                    Start-Sleep -Seconds 4
                                    Clear-Host
                                    # Establecer variable de entorno que indica el regreso al menú principal
                                    $env:Opcion1RegresoMPrincipal = "regresar-al-menu-principal"
                                    $installSoftwareReturnValue = $true
                                }
                                default {
                                    Write-Host "¡Opción inválida! Por favor, selecciona una opción válida." -ForegroundColor Red
                                    Start-Sleep -Seconds 5
                                    Clear-Host
                                    continue
                                } 
                            } 
                        } while ($softwareSelect -eq "1" -or $softwareSelect -eq "2" -or $softwareSelect -eq "3" -or $softwareSelect -eq "4" -or $softwareSelect -eq "5" -or $softwareSelect -eq "6" -or $softwareSelect -eq "7" -or $softwareSelect -eq "8" -or $softwareSelect -eq "9" -or $softwareSelect -eq "10" -or $softwareSelect -eq "11" -or $softwareSelect -eq "12")
                    } "2" {
                        do
                        {
                            Clear-Host

                            # Mostrar el submenú 2 del menú principal
                            Show-Submenu-2

                            # Leer la respuesta del usuario
                            $PersonalizeSelect = Read-Host "¿Qué deseas hacer?"

                            # Procesar la respuesta del usuario
                            switch ($PersonalizeSelect) {
                                "1" {
                                    Clear-Host
                                    & "$toolsFolderPath\activar_modo_oscuro_claro_aplicaciones.ps1" -Wait
                                    if ($env:ModoOscuroClaro -eq "regresar-al-menu-op2"){
                                        Clear-Host
                                        continue
                                    }
                                } "2" {
                                    Clear-Host
                                    & "$toolsFolderPath\cambiar_orientacion_elementos_barra_tareas.ps1" -Wait
                                    if ($env:CambiarOrientacionElementosBarraTareas -eq "regresar-al-menu-opcion-2"){
                                        Clear-Host
                                        continue
                                    }
                                } "3" {
                                    Clear-Host
                                    & "$toolsFolderPath\activar_desactivar_efectos_transparencia.ps1" -Wait
                                    if ($env:ActDesactEfectosTransparencia -eq "regresar-al-menu-opcion-2"){
                                        Clear-Host
                                        continue
                                    }
                                } "4" {
                                    Clear-Host
                                    & "$toolsFolderPath\aplicar_temas_oficiales_resurrection_os.ps1" -Wait
                                    if ($env:AplicTemasOfcROS -eq "regresar-al-menu-opcion-2"){
                                        Clear-Host
                                        continue
                                    }
                                } "5" {
                                    Clear-Host
                                    & "$toolsFolderPath\desactivar_mostrar_sugerencias_ocasionalmente_inicio.ps1" -Wait
                                    if ($env:DesactMostrarSugOcasInicio -eq "regresar-al-menu-opcion-2"){
                                        Clear-Host
                                        continue
                                    }
                                } "6" {
                                    Clear-Host
                                    & "$toolsFolderPath\instalar_skin_rainmeter.ps1" -Wait
                                    if ($env:InstalSkinRMeter -eq "regresar-al-menu-opcion-2"){
                                        Clear-Host
                                        continue
                                    }
                                } "7" {
                                    & "$exiterFolderPath\retorno_opcion_2.ps1"
                                    if ($env:Opcion2RegresoMPrincipal -eq "regresar-al-menu"){
                                        Write-Host "De acuerdo. Regresando al menú principal..." 
                                        Start-Sleep -Seconds -5
                                        Clear-Host
                                        $returnMainMenu = $true
                                    }
                                } default {
                                    Clear-Host
                                    Write-Host "¡Opción inválida! Por favor, selecciona una opción válida." -ForegroundColor Red
                                    Start-Sleep -Seconds 2
                                    Clear-Host
                                    continue
                                }
                            }
                        } while ($PersonalizeSelect -eq "1" -or $PersonalizeSelect -eq "2" -or $PersonalizeSelect -eq "3" -or $PersonalizeSelect -eq "4" -or $PersonalizeSelect -eq "5" -or $PersonalizeSelect -eq "6")
                    } "3" {
                        do
                        {
                            Clear-Host

                            # Mostrar el submenú de la opción 3 del menú principal
                            Show-Submenu-3

                            # Leer la respuesta del usuario
                            $OptimizeSelect = Read-Host "¿Qué quieres hacer?"

                            # Procesar la respuesta del usuario
                            switch ($OptimizeSelect) {
                                "1" {
                                    $confirm1 = Read-Host "¿Deseas apagar el servicio de ubicación para tu cuenta y aplicaciones? (S/N)"
                                    if ($confirm1 -eq "S"){
                                        Merge-RegistryFile "Turn_Off_Location_service_for_your_account_and_apps.reg" -Wait
                                        if ($env:RegFileSucessMerged -eq "configuración-incorporada-satisfactioriamente"){
                                            Start-Sleep -Seconds 5
                                        }
                                    }
                                    elseif ($env:ErrorArchivoRegNoEncontrado -eq "configuración-no-encontrada"){
                                        Start-Sleep -Seconds 5
                                    }
                                    else {
                                        Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo de nuevo!"
                                        Start-Sleep -Seconds 5
                                        $confirm1
                                    }
                                }
                                "2" {
                                    $confirm2 = Read-Host "¿Deseas priorizar los juegos en el Registro? (S/N)"
                                    if ($confirm2 -eq "S"){
                                        Merge-RegistryFile "4. Priorizar juegos.reg" -Wait
                                        if ($env:RegFileSucessMerged -eq "configuración-incorporada-satisfactioriamente"){
                                            Start-Sleep -Seconds 5
                                        }
                                    }
                                    elseif ($env:ErrorArchivoRegNoEncontrado -eq "configuración-no-encontrada"){
                                        Start-Sleep -Seconds 5
                                    }
                                    else {
                                        Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo de nuevo!"
                                        Start-Sleep -Seconds 5
                                        $confirm2
                                    }
                                }
                                "3" {
                                    $confirm3 = Read-Host "¿Deseas evitar que las aplicaciones innecesarias se autoinicien? (S/N)"
                                    if ($confirm3 -eq "S"){
                                        Merge-RegistryFile "Evitar apps innecesarias se inicien automáticamente.reg" -Wait
                                        if ($env:RegFileSucessMerged -eq "configuración-incorporada-satisfactioriamente"){
                                            Start-Sleep -Seconds 5
                                        }
                                    }
                                    elseif ($env:ErrorArchivoRegNoEncontrado -eq "configuración-no-encontrada"){
                                        Start-Sleep -Seconds 5
                                    }
                                    else {
                                        Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo de nuevo!"
                                        Start-Sleep -Seconds 5
                                        $confirm3
                                    }
                                }
                                "4" {
                                    $confirm4 = Read-Host "¿Deseas desactivar el Xbox Game Bar? (S/N)"
                                    if ($confirm4 -eq "S"){
                                        Merge-RegistryFile "Desactivar la barra de juegos (opcional).reg" -Wait
                                        if ($env:RegFileSucessMerged -eq "configuración-incorporada-satisfactioriamente"){
                                            Start-Sleep -Seconds 5
                                        }
                                    }
                                    elseif ($env:ErrorArchivoRegNoEncontrado -eq "configuración-no-encontrada"){
                                        Start-Sleep -Seconds 5
                                    }
                                    else {
                                        Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo de nuevo!"
                                        Start-Sleep -Seconds 5
                                        $confirm4
                                    }
                                }
                                "5" {
                                    Write-Host "Este tweak desactiva ciertas limitaciones de energía (o Power Throttling)."
                                    Write-Host "Es útil y se recomienda usarlo sólamente si tienes una PC de bajos o bajos-medios recursos,"
                                    Write-Host "y también si usas Resurrection OS Go; no se recomienda usarlo en otro tipo de PCs ni en Resurrection OS Full."
                                    $confirm5 = Read-Host "¿Continuar? (S/N)"
                                    if ($confirm5 -eq "S"){
                                        Merge-RegistryFile "10. Deshabilitar limitación de energía.reg" -Wait
                                        if ($env:RegFileSucessMerged -eq "configuración-incorporada-satisfactioriamente"){
                                            Start-Sleep -Seconds 5
                                        }
                                    }
                                    elseif ($env:ErrorArchivoRegNoEncontrado -eq "configuración-no-encontrada"){
                                        Start-Sleep -Seconds 5
                                    }
                                    else {
                                        Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo de nuevo!"
                                        Start-Sleep -Seconds 5
                                        $confirm5
                                    }
                                }
                                "6" {
                                    $confirm6 = Read-Host "¿Deseas deshabilitar el bloatware? (S/N)"
                                    if ($confirm6 -eq "S"){
                                        Merge-RegistryFile "6. Deshabilitar Bloatware (apps no deseadas).reg" -Wait
                                        if ($env:RegFileSucessMerged -eq "configuración-incorporada-satisfactioriamente"){
                                            Start-Sleep -Seconds 5
                                        }
                                    }
                                    elseif ($env:ErrorArchivoRegNoEncontrado -eq "configuración-no-encontrada"){
                                        Start-Sleep -Seconds 5
                                    }
                                    else {
                                        Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo de nuevo!"
                                        Start-Sleep -Seconds 5
                                        $confirm6
                                    }
                                }
                                "7" {
                                    $confirm7 = Read-Host "¿Deseas deshabilitar la sincronización? (S/N)"
                                    if ($confirm7 -eq "S"){
                                        Merge-RegistryFile "2. Deshabilitar Sincronización.reg" -Wait
                                        if ($env:RegFileSucessMerged -eq "configuración-incorporada-satisfactioriamente"){
                                            Start-Sleep -Seconds 5
                                        }
                                    }
                                    elseif ($env:ErrorArchivoRegNoEncontrado -eq "configuración-no-encontrada"){
                                        Start-Sleep -Seconds 5
                                    }
                                    else {
                                        Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo de nuevo!"
                                        Start-Sleep -Seconds 5
                                        $confirm7
                                    }
                                }
                                "8" {
                                    $confirm8 = Read-Host "¿Deseas desactivar el Game DVR? (S/N)"
                                    if ($confirm8 -eq "S"){
                                        Merge-RegistryFile "11. Desactivar Game DVR.reg" -Wait
                                        if ($env:RegFileSucessMerged -eq "configuración-incorporada-satisfactioriamente"){
                                            Start-Sleep -Seconds 5
                                        }
                                    }
                                    elseif ($env:ErrorArchivoRegNoEncontrado -eq "configuración-no-encontrada"){
                                        Start-Sleep -Seconds 5
                                    }
                                    else {
                                        Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo de nuevo!"
                                        Start-Sleep -Seconds 5
                                        $confirm8
                                    }
                                }
                                "9" {
                                    Write-Host "Este tweak desactiva la telemetría del sistema."
                                    Write-Host "Ten en cuenta que el trabajo que realiza esta opción es a modo suave. Si buscas algo más agresivo,"
                                    Write-Host "usa la opción 20."
                                    $confirm9 = Read-Host "¿Continuar? (S/N)"
                                    if ($confirm9 -eq "S"){
                                        Merge-RegistryFile "3. Deshabilitar Telemetría.reg" -Wait
                                        if ($env:RegFileSucessMerged -eq "configuración-incorporada-satisfactioriamente"){
                                            Start-Sleep -Seconds 5
                                        }
                                    }
                                    elseif ($env:ErrorArchivoRegNoEncontrado -eq "configuración-no-encontrada"){
                                        Start-Sleep -Seconds 5
                                    }
                                    else {
                                        Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo de nuevo!"
                                        Start-Sleep -Seconds 5
                                        $confirm9
                                    }
                                }
                                "10" {
                                    $confirm10 = Read-Host "¿Deseas desactivar las optimizaciones para el modo de pantalla completa del Game DVR? (S/N)"
                                    if ($confirm10 -eq "S"){
                                        Merge-RegistryFile "9. Deshabilitar optimizaciones de pantalla completa.reg" -Wait
                                        if ($env:RegFileSucessMerged -eq "configuración-incorporada-satisfactioriamente"){
                                            Start-Sleep -Seconds 5
                                        }
                                    }
                                    elseif ($env:ErrorArchivoRegNoEncontrado -eq "configuración-no-encontrada"){
                                        Start-Sleep -Seconds 5
                                    }
                                    else {
                                        Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo de nuevo!"
                                        Start-Sleep -Seconds 5
                                        $confirm10
                                    }
                                }
                                "11" {
                                    Write-Host "Este tweak impedirá que las aplicaciones se ejecuten en segundo plano."
                                    Write-Host "Ten en cuenta que esta opción realiza un trabajo suave. Si buscas algo más agresivo, usa la opción 26."
                                    $confirm11 = Read-Host "¿Continuar? (S/N)"
                                    if ($confirm11 -eq "S"){
                                        Merge-RegistryFile "7. Deshabiliatr apps en segundo plano.reg" -Wait
                                        if ($env:RegFileSucessMerged -eq "configuración-incorporada-satisfactioriamente"){
                                            Start-Sleep -Seconds 5
                                        }
                                    }
                                    elseif ($env:ErrorArchivoRegNoEncontrado -eq "configuración-no-encontrada"){
                                        Start-Sleep -Seconds 5
                                    }
                                    else {
                                        Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo de nuevo!"
                                        Start-Sleep -Seconds 5
                                        $confirm11
                                    }
                                }
                                "12" {
                                    Write-Host "Este tweak realiza ciertas optimizaciones generales, como:"
                                    Write-Host "- Priorizar el reloj del sistema."
                                    Write-Host "- Mejorar el tiempo de apagado."
                                    Write-Host "- Optimizar el tiempo de cierre de los servicios, previo al apagado."
                                    Write-Host "entre otros."
                                    $confirm12 = Read-Host "¿Continuar? (S/N)"
                                    if ($confirm12 -eq "S"){
                                        Merge-RegistryFile "Tweakes.reg" -Wait
                                        if ($env:RegFileSucessMerged -eq "configuración-incorporada-satisfactioriamente"){
                                            Start-Sleep -Seconds 5
                                        }
                                    }
                                    elseif ($env:ErrorArchivoRegNoEncontrado -eq "configuración-no-encontrada"){
                                        Start-Sleep -Seconds 5
                                    }
                                    else {
                                        Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo de nuevo!"
                                        Start-Sleep -Seconds 5
                                        $confirm12
                                    }
                                }
                                "13" {
                                    Write-Host "Este tweak habilita las paginaciones grandes, para que juegos como Warframe,"
                                    Write-Host "League of Legends, The Witcher 3 y GTA V tengan mejores niveles de FPS."
                                    $confirm13 = Read-Host "¿Continuar? (S/N)"
                                    if ($confirm13 -eq "S"){
                                        Merge-RegistryFile "fpsboost.reg" -Wait
                                        if ($env:RegFileSucessMerged -eq "configuración-incorporada-satisfactioriamente"){
                                            Start-Sleep -Seconds 5
                                        }
                                    }
                                    elseif ($env:ErrorArchivoRegNoEncontrado -eq "configuración-no-encontrada"){
                                        Start-Sleep -Seconds 5
                                    }
                                    else {
                                        Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo de nuevo!"
                                        Start-Sleep -Seconds 5
                                        $confirm13
                                    }
                                }
                                "14" {
                                    Write-Host "Este tweak realiza algunos ajustes para mejorar la conexión a Internet, como:"
                                    Write-Host "- Limitar las conexiones simultáneas permitidas."
                                    Write-Host "- Activar el envío de datos no bloqueantes."
                                    Write-Host "entre otros. Puedes consultar las demás cosas que realiza el tweak en la Base de Conocimientos."
                                    $confirm14 = Read-Host "¿Continuar? (S/N)"
                                    if ($confirm14 -eq "S"){
                                        Merge-RegistryFile "Internet.reg" -Wait
                                        if ($env:RegFileSucessMerged -eq "configuración-incorporada-satisfactioriamente"){
                                            Start-Sleep -Seconds 5
                                        }
                                    }
                                    elseif ($env:ErrorArchivoRegNoEncontrado -eq "configuración-no-encontrada"){
                                        Start-Sleep -Seconds 5
                                    }
                                    else {
                                        Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo de nuevo!"
                                        Start-Sleep -Seconds 5
                                        $confirm14
                                    }
                                }
                                "15" {
                                    Write-Host "Este tweak mejora la rapidez, fluidez y apariencia del cursor del mouse"
                                    $confirm15 = Read-Host "¿Continuar? (S/N)"
                                    if ($confirm15 -eq "S"){
                                        Merge-RegistryFile "mousefix.reg" -Wait
                                        if ($env:RegFileSucessMerged -eq "configuración-incorporada-satisfactioriamente"){
                                            Start-Sleep -Seconds 5
                                        }
                                    }
                                    elseif ($env:ErrorArchivoRegNoEncontrado -eq "configuración-no-encontrada"){
                                        Start-Sleep -Seconds 5
                                    }
                                    else {
                                        Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo de nuevo!"
                                        Start-Sleep -Seconds 5
                                        $confirm15
                                    }
                                }
                                "16" {
                                    Write-Host "¿Deseas activar el Rocket Boost Mode de Resurrection OS?"
                                    $confirm16 = Read-Host "Este tweak mejora tu rendimiento a un 20%, así que úsalo sólo como medida de emergencia. ¿Continuar? (S/N)"
                                    if ($confirm16 -eq "S"){
                                        Merge-RegistryFile "aumenta un 20% de rendimiento.reg" -Wait
                                        if ($env:RegFileSucessMerged -eq "configuración-incorporada-satisfactioriamente"){
                                            Start-Sleep -Seconds 5
                                        }
                                    }
                                    elseif ($env:ErrorArchivoRegNoEncontrado -eq "configuración-no-encontrada"){
                                        Start-Sleep -Seconds 5
                                    }
                                    else {
                                        Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo de nuevo!"
                                        Start-Sleep -Seconds 5
                                        $confirm16
                                    }
                                }
                                "17" {
                                    $confirm17 = Read-Host "¿Deseas desactivar Windows Search? (S/N)"
                                    if ($confirm17 -eq "S"){
                                        Merge-RegistryFile "block search.reg" -Wait
                                        if ($env:RegFileSucessMerged -eq "configuración-incorporada-satisfactioriamente"){
                                            Start-Sleep -Seconds 5
                                        }
                                    }
                                    elseif ($env:ErrorArchivoRegNoEncontrado -eq "configuración-no-encontrada"){
                                        Start-Sleep -Seconds 5
                                    }
                                    else {
                                        Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo de nuevo!"
                                        Start-Sleep -Seconds 5
                                        $confirm17
                                    }
                                }
                                "18" {
                                    $confirm18 = Read-Host "¿Deseas desactivar el Windows Security Health Hub? (S/N)"
                                    if ($confirm18 -eq "S"){
                                        Merge-RegistryFile "block security health.reg" -Wait
                                        if ($env:RegFileSucessMerged -eq "configuración-incorporada-satisfactioriamente"){
                                            Start-Sleep -Seconds 5
                                        }
                                    }
                                    elseif ($env:ErrorArchivoRegNoEncontrado -eq "configuración-no-encontrada"){
                                        Start-Sleep -Seconds 5
                                    }
                                    else {
                                        Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo de nuevo!"
                                        Start-Sleep -Seconds 5
                                        $confirm18
                                    }
                                }
                                "19" {
                                    $confirm19 = Read-Host "¿Deseas desactivar los Servicios de diagnóstico? (S/N)"
                                    if ($confirm19 -eq "S"){
                                        Merge-RegistryFile "block diagnostic.reg" -Wait
                                        if ($env:RegFileSucessMerged -eq "configuración-incorporada-satisfactioriamente"){
                                            Start-Sleep -Seconds 5
                                        }
                                    }
                                    elseif ($env:ErrorArchivoRegNoEncontrado -eq "configuración-no-encontrada"){
                                        Start-Sleep -Seconds 5
                                    }
                                    else {
                                        Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo de nuevo!"
                                        Start-Sleep -Seconds 5
                                        $confirm19
                                    }
                                }
                                "20" {
                                    Write-Host "Este tweak desactiva la telemetría del sistema."
                                    Write-Host "Ten en cuenta que esta opción realiza el trabajo de modo AGRESIVO (es decir, desactiva TODA la telemetría)."
                                    Write-Host "Si buscas algo más gentil, usa la opción 9."
                                    $confirm20 = Read-Host "¿Continuar? (S/N)"
                                    if ($confirm20 -eq "S"){
                                        Merge-RegistryFile "block telemetria 1.reg" -Wait
                                        Merge-RegistryFile "block telemetria 2.reg" -Wait
                                        Merge-RegistryFile "block telemetry pro.reg" -Wait
                                        Merge-RegistryFile "Disable Telemetry Services.reg" -Wait
                                        Merge-RegistryFile "telemetry block 3.reg" -Wait
                                        if ($env:RegFileSucessMerged -eq "configuración-incorporada-satisfactioriamente"){
                                            Start-Sleep -Seconds 5
                                        }
                                    }
                                    elseif ($env:ErrorArchivoRegNoEncontrado -eq "configuración-no-encontrada"){
                                        Start-Sleep -Seconds 5
                                    }
                                    else {
                                        Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo de nuevo!"
                                        Start-Sleep -Seconds 5
                                        $confirm20
                                    }
                                }
                                "21" {
                                    $confirm21 = Read-Host "¿Deseas desactivar los efectos de transparencia? (S/N)"
                                    if ($confirm21 -eq "S"){
                                        Merge-RegistryFile "8. Deshabilitar Transparencia.reg" -Wait
                                        if ($env:RegFileSucessMerged -eq "configuración-incorporada-satisfactioriamente"){
                                            Start-Sleep -Seconds 5
                                        }
                                    }
                                    elseif ($env:ErrorArchivoRegNoEncontrado -eq "configuración-no-encontrada"){
                                        Start-Sleep -Seconds 5
                                    }
                                    else {
                                        Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo de nuevo!"
                                        Start-Sleep -Seconds 5
                                        $confirm21
                                    }
                                }
                                "22" {
                                    $confirm22 = Read-Host "¿Deseas desactivar los servicios de Xbox? (S/N)"
                                    if ($confirm22 -eq "S"){
                                        Merge-RegistryFile "Disable Xbox Services.reg" -Wait
                                        if ($env:RegFileSucessMerged -eq "configuración-incorporada-satisfactioriamente"){
                                            Start-Sleep -Seconds 5
                                        }
                                    }
                                    elseif ($env:ErrorArchivoRegNoEncontrado -eq "configuración-no-encontrada"){
                                        Start-Sleep -Seconds 5
                                    }
                                    else {
                                        Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo de nuevo!"
                                        Start-Sleep -Seconds 5
                                        $confirm22
                                    }
                                }
                                "23" {
                                    Write-Host "Este tweak deshabilitará POR COMPLETO a Windows Defender."
                                    Write-Host "Una vez aplique el tweak, encarecidamente te recomiendo instalarte un antivirus de terceros,"
                                    Write-Host "así mantienes tu equipo protegido."
                                    $confirm23 = Read-Host "¿Continuar? (S/N)"
                                    if ($confirm23 -eq "S"){
                                        Merge-RegistryFile "1 Disable UAC.reg" -Wait
                                        Merge-RegistryFile "Disable SmartScreen.reg" -Wait
                                        Merge-RegistryFile "Disable Windows Defender.reg" -Wait
                                        if ($env:RegFileSucessMerged -eq "configuración-incorporada-satisfactioriamente"){
                                            Start-Sleep -Seconds 5
                                        }
                                    }
                                    elseif ($env:ErrorArchivoRegNoEncontrado -eq "configuración-no-encontrada"){
                                        Start-Sleep -Seconds 5
                                    }
                                    else {
                                        Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo de nuevo!"
                                        Start-Sleep -Seconds 5
                                        $confirm23
                                    }
                                }
                                "24" {
                                    $confirm24 = Read-Host "¿Deseas establecer en ALTA la prioridad de la CPU/GPU? (S/N)"
                                    if ($confirm24 -eq "S"){
                                        Merge-RegistryFile "poner prioridad alta gpu y cpu.reg" -Wait
                                        if ($env:RegFileSucessMerged -eq "configuración-incorporada-satisfactioriamente"){
                                            Start-Sleep -Seconds 5
                                        }
                                    }
                                    elseif ($env:ErrorArchivoRegNoEncontrado -eq "configuración-no-encontrada"){
                                        Start-Sleep -Seconds 5
                                    }
                                    else {
                                        Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo de nuevo!"
                                        Start-Sleep -Seconds 5
                                        $confirm24
                                    }
                                }
                                "25" {
                                    $confirm25 = Read-Host "¿Deseas desactivar el Administrador de mapas descargados? (S/N)"
                                    if ($confirm25 -eq "S"){
                                        Merge-RegistryFile "quitar mapas descargados.reg" -Wait
                                        if ($env:RegFileSucessMerged -eq "configuración-incorporada-satisfactioriamente"){
                                            Start-Sleep -Seconds 5
                                        }
                                    }
                                    elseif ($env:ErrorArchivoRegNoEncontrado -eq "configuración-no-encontrada"){
                                        Start-Sleep -Seconds 5
                                    }
                                    else {
                                        Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo de nuevo!"
                                        Start-Sleep -Seconds 5
                                        $confirm25
                                    }
                                }
                                "26" {
                                    Write-Host "Este tweak desactivará la ejecución en segundo plano de las aplicaciones."
                                    Write-Host "Ten en cuenta que esta opción realiza el trabajo de una manera más AGRESIVA."
                                    Write-Host "Si buscas algo más gentil, usa la opción 11."
                                    $confirm26 = Read-Host "¿Continuar? (S/N)"
                                    if ($confirm26 -eq "S"){
                                        Merge-RegistryFile "quitar aplicaciones en segundo plano (toda las apps).reg" -Wait
                                        if ($env:RegFileSucessMerged -eq "configuración-incorporada-satisfactioriamente"){
                                            Start-Sleep -Seconds 5
                                        }
                                    }
                                    elseif ($env:ErrorArchivoRegNoEncontrado -eq "configuración-no-encontrada"){
                                        Start-Sleep -Seconds 5
                                    }
                                    else {
                                        Write-Host "Disculpa, no entendí tu respuesta. ¡Inténtalo de nuevo!"
                                        Start-Sleep -Seconds 5
                                        $confirm26
                                    }
                                }
                                "27" {
                                    Write-Host "De acuerdo. Regresando al menú principal..."
                                    Start-Sleep -Seconds 5
                                    $env:Opcion3RegresoMPrincipal = "regresar-al-menu"
                                    $Op3ReturnValue = $true
                                }
                                default {
                                    Write-Host "Opción inválida. Por favor, ingresa un número válido del 1 al 27."
                                }
                            }
                        } while ($OptimizeSelect -ge "1" -and $OptimizeSelect -le "26")
                    } "4" {
                        do
                        {
                            Clear-Host

                            # Mostrar el submenú de la caja de herramientas
                            ShowToolBoxMenu

                            # Leer la respuesta del usuario
                            $ToolboxSelect = Read-Host "¿Qué deseas hacer?"

                            # Procesar la respuesta del usuario
                            switch ($ToolboxSelect) {
                                "1"{
                                    & "$toolBoxScriptsFolderPath\chkdsk_script.ps1" -Wait
                                    if ($env:CHKDSKRetorno -eq "regresar-a-caja-herramientas"){
                                        continue
                                    }
                                } "2"{
                                    ExecuteSFC
                                } "3"{
                                    ExecuteDISMScanHealth
                                } "4"{
                                    ExecuteDISMRestoreHealth
                                } "5"{
                                    ExecuteDiskpart
                                } "6"{
                                    ExecuteCleanmgr
                                } "7"{
                                    & "$toolBoxScriptsFolderPath\activar_office.ps1" -Wait
                                    if (($env:OfficeNoEncontradoError -eq "office-no-encontrado-regresar-a-caja-herramientas") -or ($env:OfficeActivado = "office-activado-regresar-a-caja-herramientas") -or ($env:ErrorActivacionOffice = "error-office-no-activado-regresar-a-caja-herramientas")){
                                        continue
                                    }
                                } "8"{
                                    ExecuteIPCONFIG
                                } "9"{
                                    ExecuteIPCFlushDNS
                                } "10"{
                                    FormatOnDifferentDrive
                                } "11"{
                                    ShowAllActiveProcesses
                                } "12"{
                                    & "$toolBoxScriptsFolderPath\kill_single_processes_or_process_trees_script.ps1" -Wait
                                    if ($env:MatarProcesos -eq "regresar-a-caja-herramientas"){
                                        continue
                                    }
                                } "13"{
                                    ExecuteWinSAT
                                } "14"{
                                    Write-Host "De acuerdo. Realizando ping de la red a google.com..."
                                    Start-Process -FilePath "ping" -ArgumentList "google.com" -Wait
                                    Write-Host "¡Prueba de ping terminada! Tu resultado en milisegundos determinará qué tan rápida es tu red en el envío y recepción de información."
                                    Write-Host "Si tienes un ping por debajo de los 15ms, ¡tu red es perfectamente estable y rápida!"
                                    Write-Host "Sin embargo, si tu ping es más alto que 15ms, te recomiendo reducir tu carga de trabajo cerrando aplicaciones inútiles y liberando carga de trabajo general en tu equipo."
                                    Write-Host "Presiona cualquier tecla para refrescar el menú..."
                                    $null = $Host.UI.RawUI.ReadKey("NoEcho, IncludeKeyDown")
                                } "15"{
                                    Clear-TempFiles
                                } "16"{
                                    Write-Host "De acuerdo. Regresando al menú principal..."
                                    Start-Sleep -Seconds 5
                                    $env:OpcionCajaHerramientasRegresoMPrincipal -eq "regresar-al-menu"
                                    $toolboxReturnValue = $true
                                } default {
                                    Write-Host "Oops, opción inválida. ¡Inténtalo de nuevo!"
                                    Start-Sleep -Seconds 5
                                    continue
                                }
                            }
                        } while ($ToolboxSelect -ge "1" -and $ToolboxSelect -le "16")
                    } "5" {
                        do {
                            Clear-Host

                            Show-Submenu-5

                            # Leer la respuesta del usuario
                            $RestorePointSelect = Read-Host "¿Qué deseas hacer?"

                            # Procesar la respuesta del usuario
                            switch ($RestorePointSelect) {
                                "1"{
                                    Enable-SystemProtection
                                } "2"{
                                    Write-Host "De acuerdo, vamos a crear un punto de restauración."
                                    $restorePointName = Read-Host "¿Cómo quieres llamar a tu punto de restauración? Recuerda usar nombres fáciles de identificar."
                                    $restorePointConfirmation = Read-Host "¿Deseas confirmar el nombre del punto de restauración? Una vez confirmado, no podrás cambiarlo luego. (S/N)"
                                    if ($restorePointConfirmation -eq "S"){
                                        CreateRestorePoint
                                    }
                                    elseif ($restorePointConfirmation -eq "N"){
                                        Write-Host "Ok. Por el momento, no he creado el punto de restauración. Vuelve a ejecutar esta opción, ingresa el nombre correcto y confírmalo para poder crearlo."
                                        Write-Host "Refrescando el menú..."
                                        Start-Sleep -Seconds 5
                                        continue
                                    }
                                    else {
                                        Write-Host "Oops, respuesta inválida. ¡Inténtalo de nuevo!"
                                        Start-Sleep -Seconds 5
                                        $restorePointConfirmation
                                    }
                                } "3" {
                                    Write-Host "De acuerdo. Regresando al menú principal..."
                                    Start-Sleep -Seconds 5
                                    $env:Opcion5RegresoMPrincipal -eq "regresar-al-menu"
                                    $restorePointCreatorReturnValue = $true
                                } default {
                                    Write-Host "Disculpa... respuesta inválida. ¡Ingresa una opción válida!"
                                    Start-Sleep -Seconds 5
                                    continue
                                }
                            }
                        } while ($RestorePointSelect -eq "1" -or $RestorePointSelect -eq "2" -or $RestorePointSelect -eq "3")
                    } "6" {
                        Write-Host "¡Nos vemos! Recuerda, si me necesitas de nuevo, me puedes encontrar en el Menú Extendido de Resurrection OS, haciendo clic en la opción 'Iniciar ARES Bionic-Flow Bot'. ¡Nos vemos luego!" -ForegroundColor Yellow
                        Start-Sleep -Seconds 5
                        return
                    } default {
                        Write-Host "¡Opción inválida! Por favor, selecciona una opción válida." -ForegroundColor Red
                        Start-Sleep -Seconds 2
                        Clear-Host
                        continue
                    }
                }
            } while ($option -eq "1" -or $option -eq "2" -or $option -eq "3" -or $option -eq "4" -or $option -eq "5")
        } else {
            Write-Host "¡Nos vemos! Recuerda, si me necesitas de nuevo, me puedes encontrar en el Menú Extendido de Resurrection OS, haciendo clic en la opción 'Iniciar ARES Bionic-Flow Bot'. ¡Nos vemos luego!" -ForegroundColor Yellow
            Start-Sleep -Seconds 4
            exit
        }
    } else {
        # Se ejecuta desde la consola (no elevado)
        Write-Host "¡Oh no! Algo ha pasado. :("
        Write-Host "Esto pasó: No me has ejecutado con privilegios de Administrador."
        Write-Host "¡No puedo funcionar correctamente si no me ejecutas con privilegios de Administrador!"
        Write-Host "Ya que muchas de las cosas que hago requieren realizar cambios en el sistema, que requieren de aprobación."
        Write-Host "Por favor, cierra esta ventana y ejecútame nuevamente, pero dando en la opción 'Ejecutar como Administrador', e intenta nuevamente."
        Write-Host ""
        Write-Host "¡Espero verte por acá de nuevo! Recuerda ejecutarme como Administrador." -ForegroundColor Yellow
        Write-Host "Presiona cualquier tecla para salir..."
        $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") | Out-Null
    }
}
