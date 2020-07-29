#Retrieve required Dependencies
Write-Host "Gathering Dependencies" -f Green
Invoke-Expression ('$GHDLUri="https://github.com/Inventologist/ControlWEMO/archive/master.zip";$GHUser="Inventologist";$GHRepo="ControlWEMO";$ForceRefresh = "Yes"' + (new-object net.webclient).DownloadString('https://raw.githubusercontent.com/Inventologist/Get-Git/master/Get-Git.ps1'))

Set-WemoOn 192.168.1.81 | Out-Null
Set-WemoOff 192.168.1.81 | Out-Null