@echo off
cls
title Instalador de Apps via Winget + Otimizacoes do Windows
color 0A

:: AVISO: Esse script altera configurações do sistema, registros e serviços. Use com cautela.

:: =========================
:: Checar se o script está rodando como Administrador
:: =========================
>nul 2>&1 net session || (
    echo Este script precisa ser executado como Administrador.
    echo Tentando reiniciar com privilegios elevados...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: =========================
:: Backup do Registro
:: =========================
set "BACKUPDIR=%~dp0"
set "BACKUPDATE=%date:~-4%-%date:~3,2%-%date:~0,2%"  :: AAAA-MM-DD
set "HKLM_BACKUP=%BACKUPDIR%HKLM_SOFTWARE_backup_%BACKUPDATE%.reg"
set "HKCU_BACKUP=%BACKUPDIR%HKCU_SOFTWARE_backup_%BACKUPDATE%.reg"

echo Criando backup do registro em:
echo  %HKLM_BACKUP%
echo  %HKCU_BACKUP%

:: Backup HKLM\SOFTWARE
reg export HKLM\SOFTWARE "%HKLM_BACKUP%" /y >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERRO] Falha ao exportar HKLM\SOFTWARE
) else (
    echo [OK] Backup de HKLM\SOFTWARE concluido
)

:: Backup HKCU\SOFTWARE
reg export HKCU\SOFTWARE "%HKCU_BACKUP%" /y >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERRO] Falha ao exportar HKCU\SOFTWARE
) else (
    echo [OK] Backup de HKCU\SOFTWARE concluido
)

:: =========================
:: Checar se o winget está instalado
:: =========================
where winget >nul 2>&1
if %errorlevel% neq 0 (
    echo Winget nao foi encontrado no sistema.
    echo Instale o App Installer da Microsoft Store e tente novamente.
    pause
    exit /b
)

:: Manifest
winget --version >nul 2>&1
if %errorlevel% equ 0 (
    winget settings --enable LocalManifest >nul 2>&1
)

:: =========================
:: Instalar aplicativos
:: =========================
echo =========================================
echo Instalando aplicativos com Winget...
echo =========================================
set "apps=Valve.Steam Discord.Discord RARLab.WinRAR VideoLAN.VLC Brave.Brave qBittorrent.qBittorrent"

for %%i in (%apps%) do (
    echo Instalando %%i ...
    winget install --id=%%i -e --silent --accept-package-agreements --accept-source-agreements
    echo -----------------------------------------
)

:: =========================
:: Remover bloatware do Windows
:: =========================
echo =========================================
echo Removendo aplicativos desnecessarios...
echo =========================================
set "bloat=Microsoft.BingNews Microsoft.BingWeather Microsoft.GetHelp Microsoft.MicrosoftOfficeHub Microsoft.MicrosoftSolitaireCollection Microsoft.MicrosoftStickyNotes Microsoft.People Microsoft.PowerAutomateDesktop Microsoft.SkypeApp Microsoft.Todos Microsoft.WindowsAlarms Microsoft.WindowsCamera Microsoft.windowscommunicationsapps Microsoft.WindowsFeedbackHub Microsoft.WindowsMaps Microsoft.XboxGameOverlay Microsoft.XboxGamingOverlay Microsoft.XboxSpeechToTextOverlay Microsoft.ZuneMusic Microsoft.ZuneVideo Microsoft.Clipchamp Microsoft.YourPhone Microsoft.Microsoft3DViewer Microsoft.Paint3D Microsoft.MixedReality.Portal MicrosoftTeams"

for %%b in (%bloat%) do (
    powershell -Command "Get-AppxPackage -AllUsers %%b | Remove-AppxPackage -ErrorAction SilentlyContinue"
    powershell -Command "Get-AppxProvisionedPackage -Online | Where-Object PackageName -like '*%%b*' | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue"
)

:: =========================
:: Desativar coleta de dados e anúncios
:: =========================
echo =========================================
echo Ajustando configuracoes de privacidade...
echo =========================================

:: Desativar ID de publicidade
powershell -Command "Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo' -Name 'Enabled' -Value 0"

:: Desativar sugestões de conteúdo no menu iniciar
powershell -Command "Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-338388Enabled' -Value 0"

:: Desativar telemetria (nível mínimo permitido)
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection' -Name 'AllowTelemetry' -Value 0"
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name 'AllowTelemetry' -Value 0"

:: Desativar localização
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location' -Name 'Value' -Value 'Deny'"
powershell -Command "Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location' -Name 'Value' -Value 'Deny'"

:: Desativar histórico de atividades
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'PublishUserActivities' -Value 0"
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'UploadUserActivities' -Value 0"

:: Desativar sugestões na tela de bloqueio
powershell -Command "Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'RotatingLockScreenEnabled' -Value 0"
powershell -Command "Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'RotatingLockScreenOverlayEnabled' -Value 0"

:: Desativar sincronização com a conta Microsoft
powershell -Command "Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\SettingSync' -Name 'Enabled' -Value 0"

:: Desativar tarefas agendadas de telemetria
schtasks /Change /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable
schtasks /Change /TN "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable
schtasks /Change /TN "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable
schtasks /Change /TN "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable
schtasks /Change /TN "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /Disable

:: Desativar Windows Spotlight (tela de bloqueio)
reg add "HKCU\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsSpotlightFeatures" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsSpotlight" /t REG_DWORD /d 1 /f

:: Desativar "Obtenha dicas, truques e sugestões ao usar o Windows"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d 0 /f

:: Desativar anúncios no Explorador de Arquivos
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSyncProviderNotifications" /t REG_DWORD /d 0 /f

:: Desativar animações do Windows
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d 0 /f

:: Desativar transparência no menu iniciar e barra de tarefas
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d 0 /f

:: Desativar histórico da Área de Transferência
reg add "HKCU\Software\Microsoft\Clipboard" /v "EnableClipboardHistory" /t REG_DWORD /d 0 /f

:: Desativar notificações de sugestão do Windows
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v "ToastEnabled" /t REG_DWORD /d 0 /f

:: =========================
:: Desativar servicos desnecessarios do Windows 11
:: =========================
echo =========================================
echo Desativando servicos desnecessarios...
echo =========================================

:: Lista de serviços a desativar (seguro para maioria dos PCs domésticos)
set "services=DiagTrack RetailDemo DiagnosticPolicyService SysMain Fax MapsBroker WSearch WMPNetworkSvc SCardSvr PrintSpooler RemoteRegistry RemoteAccess RemoteDesktopServices SharedAccess WindowsInsiderService TabletInputService bthserv PhoneSvc WbioSrvc BcastDVRUserService lfsvc"

for %%s in (%services%) do (
    echo Desativando o servico %%s ...
    sc stop %%s >nul 2>&1 || echo Servico %%s ja esta parado.
    sc config %%s start= disabled >nul 2>&1
    echo -----------------------------------------
)

:: =========================
:: Remover Cortana, Copilot e Recall
:: =========================
echo =========================================
echo Removendo Cortana, Copilot e Recall...
echo =========================================

:: Desativar Copilot
powershell -Command "Set-ItemProperty -Path 'HKCU:\Software\Policies\Microsoft\Windows\WindowsCopilot' -Name 'TurnOffWindowsCopilot' -Value 1 -Force"
powershell -Command "Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'ShowCopilotButton' -Value 0 -Force"

:: Desativar Windows Recall
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsAI' -Name 'DisableAIDataAnalysis' -Value 1 -Force"
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsAI' -Name 'DisableRecall' -Value 1 -Force"
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsAI' -Name 'DisableTextCapture' -Value 1 -Force"
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name 'DisableAIDataCapture' -Value 1 -Force"

:: Remover Cortana
winget uninstall --id=Microsoft.549981C3F5F10 -e --silent
powershell -Command "Get-AppxPackage -AllUsers Microsoft.549981C3F5F10 | Remove-AppxPackage -ErrorAction SilentlyContinue"
powershell -Command "Remove-AppxProvisionedPackage -Online -PackageName Microsoft.549981C3F5F10 -ErrorAction SilentlyContinue"
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Name 'AllowCortana' -Value 0 -Force"

:: =========================
echo Desligar aceleração do mouse e configurar a sensibilidade do mouse
:: =========================
REG ADD "HKCU\Control Panel\Mouse" /v MouseSpeed /d 0 /t REG_SZ /f
REG ADD "HKCU\Control Panel\Mouse" /v MouseThreshold1 /d 0 /t REG_SZ /f
REG ADD "HKCU\Control Panel\Mouse" /v MouseThreshold2 /d 0 /t REG_SZ /f
REG ADD "HKCU\Control Panel\Mouse" /v MouseSensitivity /d 10 /t REG_SZ /f

:: =========================
:: Configurar DNS no adaptador de rede ativo
:: =========================
echo =========================================
echo Configurando DNS no adaptador de rede ativo...
echo =========================================

setlocal enabledelayedexpansion
set "adapter="

:: Obter o nome do adaptador ativo usando PowerShell
for /f "tokens=*" %%A in ('powershell -Command "Get-NetAdapter | Where-Object { $_.Status -eq 'Up' -and $_.LinkSpeed -ne '0 Bps' -and $_.Name -notlike '*Loopback*' } | Select-Object -ExpandProperty Name"') do (
    set "adapter=%%A"
)

if defined adapter (
    set "adapter=!adapter!"
) else (
    echo Nenhum adaptador conectado ou ativo encontrado.
    goto :end_dns_config
)

echo Adaptador detectado: "!adapter!"

:: Configurar DNS (Cloudflare)
netsh interface ip set dns name="!adapter!" static 1.1.1.1
netsh interface ip add dns name="!adapter!" 1.0.0.1 index=2

echo DNS configurado com sucesso no adaptador "!adapter!".

:: Configurar DNS IPv6 (Cloudflare)
netsh interface ipv6 set dns name="!adapter!" static 2606:4700:4700::1111
netsh interface ipv6 add dns name="!adapter!" 2606:4700:4700::1001 index=2

echo DNS IPv6 configurado com sucesso no adaptador "!adapter!".

:: Limpar cache DNS e reiniciar o serviço DNS Client
ipconfig /flushdns >nul 2>&1
net stop Dnscache >nul 2>&1
net start Dnscache >nul 2>&1

:: Configurar DNS over HTTPS via registro
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v EnableAutoDoh /t REG_DWORD /d 2 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v DoHTemplate_1 /t REG_SZ /d "https://security.cloudflare-dns.com/dns-query" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v DoHTemplate_2 /t REG_SZ /d "https://security.cloudflare-dns.com/dns-query" /f

echo DNS over HTTPS configurado via registro.

:end_dns_config
endlocal

:: =========================
echo Identificar a fabricante da GPU e abrir o site dos drivers
:: =========================

setlocal

:: Obter a fabricante da GPU via PowerShell
for /f "usebackq delims=" %%G in (`powershell -NoProfile -Command "Get-CimInstance Win32_VideoController | Select-Object -ExpandProperty Name"`) do (
    set "GPU=%%G"
    goto :FoundGPU
)

:FoundGPU
echo GPU detectada: %GPU%

echo %GPU% | findstr /I "NVIDIA" >nul
if %errorlevel%==0 (
    start https://www.nvidia.com/pt-br/drivers/
    goto :continue
)

echo %GPU% | findstr /I "AMD" >nul
if %errorlevel%==0 (
    start https://www.amd.com/pt/support/download/drivers.html
    goto :continue
)

echo %GPU% | findstr /I "Intel" >nul
if %errorlevel%==0 (
    start https://www.intel.com.br/content/www/br/pt/download-center/
    goto :continue
)

:continue
endlocal

echo.
echo =========================================
echo Todas as operacoes foram concluidas.
echo Reinicie o computador para aplicar todas as configuracoes.
echo =========================================
pause





