@echo off
cls
title Instalador de Apps via Winget
color 0A

:: Checar se o script está rodando como Administrador
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Este script precisa ser executado como Administrador.
    echo Tentando reiniciar com privilegios elevados...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: Checar se o winget está instalado
where winget >nul 2>&1
if %errorLevel% neq 0 (
    echo O Winget nao foi encontrado no sistema.
    echo Instale o App Installer da Microsoft Store e tente novamente.
    pause
    exit /b
)

winget --version >nul 2>&1
if %errorlevel% equ 0 (
    winget settings --enable LocalManifest >nul 2>&1
)

echo Instalando os aplicativos usando Winget...
echo =========================================
echo

:: Lista de programas para instalar
set "apps=Bitwarden.Bitwarden ProtonTechnologies.ProtonVPN Microsoft.PCManager Microsoft.Sysinternals.Autoruns Valve.Steam Discord.Discord RARLab.WinRAR Notepad++.Notepad++ VideoLAN.VLC O&O.ShutUp10 Brave.Brave qBittorrent.qBittorrent"

:: Loop para instalar cada programa
for %%i in (%apps%) do (
    echo Instalando %%i ...
    winget install --id=%%i -e --silent
    echo.
)

echo =========================================
echo
:: Remover aplicativos pré-instalados (bloatware) do Windows 11
echo Removendo apps desnecessarios do Windows 11...

:: Lista expandida
set "bloat=Microsoft.BingNews Microsoft.BingWeather Microsoft.GetHelp Microsoft.MicrosoftOfficeHub Microsoft.MicrosoftSolitaireCollection Microsoft.MicrosoftStickyNotes Microsoft.MixedReality.Portal Microsoft.People Microsoft.PowerAutomateDesktop Microsoft.SkypeApp Microsoft.Todos Microsoft.WindowsAlarms Microsoft.WindowsCamera Microsoft.windowscommunicationsapps Microsoft.WindowsFeedbackHub Microsoft.WindowsMaps Microsoft.XboxGameOverlay Microsoft.XboxGamingOverlay Microsoft.XboxSpeechToTextOverlay Microsoft.ZuneMusic Microsoft.ZuneVideo Microsoft.Clipchamp"

for %%b in (%bloat%) do (
    powershell -Command "Get-AppxPackage -AllUsers %%b | Remove-AppxPackage -ErrorAction SilentlyContinue"
)

echo Remocao concluida.
echo =========================================
echo

:: Coleta de dados e anúncios
echo Desligar a coleta de dados e anúncios

:: Desativar ID de publicidade
powershell -Command "Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo' -Name 'Enabled' -Value 0"

:: Desativar sugestões de conteúdo no menu iniciar
powershell -Command "Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-338388Enabled' -Value 0"

:: Desativar telemetria (nível mínimo permitido)
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection' -Name 'AllowTelemetry' -Value 0"
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name 'AllowTelemetry' -Value 0"

:: Desativar localização (HKLM e HKCU)
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location' -Name 'Value' -Value 'Deny'"
powershell -Command "Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location' -Name 'Value' -Value 'Deny'"

:: Desativar reconhecimento de voz online
powershell -Command "Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy' -Name 'HasAccepted' -Value 0"

:: Desativar histórico de atividades
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'PublishUserActivities' -Value 0"
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'UploadUserActivities' -Value 0"

:: Desativar sugestões na tela de bloqueio
powershell -Command "Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'RotatingLockScreenEnabled' -Value 0"
powershell -Command "Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'RotatingLockScreenOverlayEnabled' -Value 0"

:: Desativar sincronização com a conta Microsoft
powershell -Command "Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\SettingSync' -Name 'Enabled' -Value 0"

echo Configurado
echo =========================================
echo
color 0B
echo Todos os aplicativos foram instalados (se disponiveis).
:: ============================================
:: Nome: Instalador de Apps, otimização e debloat do Windows
:: Autor: Deathheavy
:: ============================================
echo
pause

