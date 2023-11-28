### $PROFILE
####
# Script de Profile
###
$ip = Get-netipconfiguration | Select-Object ipv4address
$ip1 = $ip.IPv4Address.ipaddress
Write-Host "Bienvenu à" "$env:COMPUTERNAME" -ForegroundColor Green
Write-host "Avec le compte" "$env:USERNAME"
write-host "Nous sommes le" (Get-Date) 
write-host "Votre IP :" $ip1

write-host "Votre version majeure de PowerShell est  : " $Host.Version.major
write-host "Votre domaine est : " $(Get-ADDomainController | Select-Object Domain)
Set-Location C:\



