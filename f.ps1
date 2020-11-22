Set-Location -Path $env:TEMP
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }
Write-Host "Za chwile program rozpocznie pobieranie i skanowanie twojego komputera , może byc konieczne ponowne uruchomienie"
Write-Host "Pojawia sie dwa okna instalatorow - sa bezpieczne zainstaluj a reszta sie zajmiemy"
Write-Host "Pobieram AntyMalware"
Invoke-WebRequest -Verbose https://data-cdn.mbamupdates.com/web/mb4-setup-consumer/MBSetup.exe -o mbam.exe
Write-Host "Pobieram Antiwirusa"
Invoke-WebRequest -Verbose https://download.eset.com/com/eset/tools/online_scanner/latest/esetonlinescanner.exe -o eset.exe
Start-Process .\mbam.exe -Wait
Start-Process .\eset.exe -Wait
Remove-Item .\eset.exe
Write-Host "Sprzatanie"
Remove-Item .\mbam.exe
.\end.exe