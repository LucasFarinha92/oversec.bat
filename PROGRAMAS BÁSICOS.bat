@echo off

chcp 1252 > nul

cls

echo "   ____   __      __  ______   _____     _____   ______    _____ ";
echo "  / __ \  \ \    / / |  ____| |  __ \   / ____| |  ____|  / ____|";
echo " | |  | |  \ \  / /  | |__    | |__) | | (___   | |__    | |     ";
echo " | |  | |   \ \/ /   |  __|   |  _  /   \___ \  |  __|   | |     ";
echo " | |__| |    \  /    | |____  | | \ \   ____) | | |____  | |____ ";
echo "  \____/      \/     |______| |_|  \_\ |_____/  |______|  \_____|";
echo "                                                                 ";

:menu
echo.                                                                
echo 1 - Instalar todos os programas                             
echo.
set /p opcao= Escolha uma opção:   

echo.
if %opcao% equ 1 goto opcao1

:opcao1
echo.
echo "Instalando Acesso Remoto (Team Viewer)"
setlocal

REM Definir variáveis
set "downloadURL=https://dl.teamviewer.com/download/version_11x/TeamViewerQS-idcz3nxbq4.exe?ref=https%3A%2F%2Fget.teamviewer.com%2F"
set "downloadedFile=%TEMP%\TeamViewerQS-idcz3nxbq4.exe"
set "targetFolder=C:\Oversec"
set "shortcutName=OVERSEC - Suporte Remoto"

REM Baixar o arquivo usando certutil
certutil -urlcache -split -f "%downloadURL%" "%downloadedFile%"

REM Verificar se o download foi bem-sucedido
if not exist "%downloadedFile%" (
    echo Falha ao baixar o arquivo TeamViewer QuickSupport.
    pause
    exit /b 1
)

REM Criar a pasta se não existir
if not exist "%targetFolder%" (
    mkdir "%targetFolder%"
)

REM Mover o arquivo para a pasta desejada
move "%downloadedFile%" "%targetFolder%"

REM Criar o atalho na área de trabalho pública
echo Set oWS = WScript.CreateObject("WScript.Shell") > "%PUBLIC%\Desktop\%shortcutName%.vbs"
echo sLinkFile = "%PUBLIC%\Desktop\%shortcutName%.lnk" >> "%PUBLIC%\Desktop\%shortcutName%.vbs"
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> "%PUBLIC%\Desktop\%shortcutName%.vbs"
echo oLink.TargetPath = "%targetFolder%\TeamViewerQS-idcz3nxbq4.exe" >> "%PUBLIC%\Desktop\%shortcutName%.vbs"
echo oLink.Save >> "%PUBLIC%\Desktop\%shortcutName%.vbs"

REM Executar o script .vbs para criar o atalho
cscript "%PUBLIC%\Desktop\%shortcutName%.vbs"

REM Limpar o arquivo .vbs temporário
del "%PUBLIC%\Desktop\%shortcutName%.vbs" 

echo.
echo "Instalando Acesso Remoto (Remotely)"
setlocal

REM Definir variáveis
set "downloadURL=https://rmt.oversec.com.br/api/ClientDownloads/Desktop/WindowsDesktop-x64/80daa5a0-b12a-40a2-8c88-862646ba3b67"
set "downloadedFile=%TEMP%\Remotely_Desktop.exe"
set "targetFolder=C:\Oversec"
set "shortcutName=OVERSEC - Suporte Remoto Alternativo"

REM Baixar o arquivo usando certutil
certutil -urlcache -split -f "%downloadURL%" "%downloadedFile%"

REM Verificar se o download foi bem-sucedido
if not exist "%downloadedFile%" (
    echo Falha ao baixar o arquivo Remotely.
    pause
    exit /b 1
)

REM Criar a pasta se não existir
if not exist "%targetFolder%" (
    mkdir "%targetFolder%"
)

REM Mover o arquivo para a pasta desejada
move "%downloadedFile%" "%targetFolder%"

REM Criar o atalho na área de trabalho pública
echo Set oWS = WScript.CreateObject("WScript.Shell") > "%PUBLIC%\Desktop\%shortcutName%.vbs"
echo sLinkFile = "%PUBLIC%\Desktop\%shortcutName%.lnk" >> "%PUBLIC%\Desktop\%shortcutName%.vbs"
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> "%PUBLIC%\Desktop\%shortcutName%.vbs"
echo oLink.TargetPath = "%targetFolder%\Remotely_Desktop.exe" >> "%PUBLIC%\Desktop\%shortcutName%.vbs"
echo oLink.Save >> "%PUBLIC%\Desktop\%shortcutName%.vbs"

REM Executar o script .vbs para criar o atalho
cscript "%PUBLIC%\Desktop\%shortcutName%.vbs"

REM Limpar o arquivo .vbs temporário
del "%PUBLIC%\Desktop\%shortcutName%.vbs" 

echo.
echo "Instalando Team Viewer QS"
setlocal

REM Definir variáveis
set "downloadURL=https://download.teamviewer.com/download/TeamViewerQS_x64.exe"
set "downloadedFile=%TEMP%\TeamViewerQS_x64.exe"
set "targetFolder=C:\Oversec"
set "shortcutName=Team Viewer QS"

REM Baixar o arquivo usando certutil
certutil -urlcache -split -f "%downloadURL%" "%downloadedFile%"

REM Verificar se o download foi bem-sucedido
if not exist "%downloadedFile%" (
    echo Falha ao baixar o arquivo Team Viewer QS.
    pause
    exit /b 1
)

REM Criar a pasta se não existir
if not exist "%targetFolder%" (
    mkdir "%targetFolder%"
)

REM Mover o arquivo para a pasta desejada
move "%downloadedFile%" "%targetFolder%"

REM Criar o atalho na área de trabalho pública
echo Set oWS = WScript.CreateObject("WScript.Shell") > "%PUBLIC%\Desktop\%shortcutName%.vbs"
echo sLinkFile = "%PUBLIC%\Desktop\%shortcutName%.lnk" >> "%PUBLIC%\Desktop\%shortcutName%.vbs"
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> "%PUBLIC%\Desktop\%shortcutName%.vbs"
echo oLink.TargetPath = "%targetFolder%\TeamViewerQS_x64.exe" >> "%PUBLIC%\Desktop\%shortcutName%.vbs"
echo oLink.Save >> "%PUBLIC%\Desktop\%shortcutName%.vbs"

REM Executar o script .vbs para criar o atalho
cscript "%PUBLIC%\Desktop\%shortcutName%.vbs"

REM Limpar o arquivo .vbs temporário
del "%PUBLIC%\Desktop\%shortcutName%.vbs" 

echo.
echo "Instalando Firefox"
	start /wait cmd /c winget install -e --id Mozilla.Firefox

echo.
echo "Instalando Google Chrome"
	start /wait cmd /c winget install -e --id Google.Chrome

echo.
echo "Instalando 7-Zip"
	start /wait cmd /c winget install -e --id 7zip.7zip

echo.
echo "Instalando leitor de PDF"
	start /wait cmd /c winget install -e --id Adobe.Acrobat.Reader.64-bit

echo.
echo "Instalando manipulador de PDF"
set "installerUrl=https://download.pdf24.org/pdf24-creator.exe"
set "tempFile=%TEMP%\pdf24-creator.exe"

REM Passo 1: Baixar o instalador
echo Baixando PDF24 Creator...
powershell -command "(New-Object Net.WebClient).DownloadFile('%installerUrl%', '%tempFile%')"

REM Passo 2: Instalar de forma silenciosa
echo Instalando PDF24 Creator...
"%tempFile%" /S /SP- /silent /norestart /D=C:\Caminho_para_instalar

REM Passo 3: Remover o arquivo temporário, se necessário
del "%tempFile%

echo.	
echo "Instalando VLC"
	start /wait cmd /c winget install -e --id VideoLAN.VLC

echo.
echo "Instalando JAVA 64 Bits"
	start /wait cmd /c winget install --id Oracle.JavaRuntimeEnvironment -e --architecture x64

echo.
echo "Registrando Unidade de Rede no Explorer"
	REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLinkedConnections /t REG_DWORD /d 1 /f

echo.
echo "Ativando NET Framework"
	 dism /online /enable-feature /featurename:NetFx3 /all /norestart

echo.
echo "Ativar Compartilhamento SMB 1.0/CIF"
	dism /online /enable-feature /featurename:"SMB1Protocol" /norestart

echo.

echo ================================================================
echo *                   INSTALAÇÕES FINALIZADAS                    *
echo ================================================================
echo.
pause
exit