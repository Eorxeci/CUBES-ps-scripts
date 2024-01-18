############### INITIALISATION ###############

Write-Output "Outil de reinitialisation de mot de passe..."

$samAccountName = Read-Host "Entrez le samAccountName de l'utilisateur pour lequel le mot de passe doit etre reinitialise "
$newPass = Read-Host "Entrez le nouveau mot de passe "
$reason = Read-Host "Entrez la raison de changement du mot de passe "

################### SCRIPT ####################
#------- Modification du mot de passe --------#

$pass = ConvertTo-SecureString $newPass -AsPlainText -Force 
Set-ADAccountPassword -Identity $samAccountName -NewPassword $pass -Reset
Set-ADUser -Identity $samAccountName -ChangePasswordAtLogon $true

#------- Création du fichier de log ----------#

New-Item -Name "LOG" -Path C:\ -ItemType Directory -erroraction 'silentlycontinue'
New-Item -Name "resetPassword.log" -Path C:\LOG\ -ItemType File -erroraction 'silentlycontinue'

#------ Ajout des logs dans le fichier -------#

Add-Content -Path "C:\LOG\resetPassword.log" -Value ((Get-Date).ToString() + " " + $reason)

##################### FIN #####################