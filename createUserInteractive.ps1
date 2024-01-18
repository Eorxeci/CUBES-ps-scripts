############### INITIALISATION ###############

$givenName = read-host "Entrez le prenom de l'utilisateur "
$surname = read-host "Entrez le nom de l'utilisateur "
$name = $givenName + " " + $surname
$samAccountName = $givenName.ToLower() + "." + $surname.ToLower()
$domain = [string] $(Get-ADDomainController | Select-Object Domain)
$userPrincipalName = $samAccountName + $domain.split("{")[0] + $domain.split("=")[1].split("}")[0]
$accountPassword = read-host "Entrez le mot de passe de l'utiisateur "
$groupe = read-host "Entrez le groupe de l'utiisateur : [personnel, eleveJulesFerry, eleveSimoneVeil, eleveRobertBadinter, eleveRobertDebre, eleveLouisPasteur, eleveEmileZola, eleveLouiseMichel] "

################### SCRIPT ####################
#-- Définition des variables personnalisées --#

if ($groupe -like "personnel") {
    $dn = "OU=Professeurs" + ",DC=" + $domain.split("=")[1].split("}")[0].split(".")[0] + ",DC=" + $domain.split("=")[1].split("}")[0].split(".")[1]
    $OU = "Professeurs"
}
elseif ($groupe -like "eleveJulesFerry") {
    $dn = "OU=ElevesJF" + ",DC=" + $domain.split("=")[1].split("}")[0].split(".")[0] + ",DC=" + $domain.split("=")[1].split("}")[0].split(".")[1]
    $OU = "ElevesJF"
}
elseif ($groupe -like "eleveSimoneVeil") {
    $dn = "OU=ElevesSV" + ",DC=" + $domain.split("=")[1].split("}")[0].split(".")[0] + ",DC=" + $domain.split("=")[1].split("}")[0].split(".")[1]
    $OU = "ElevesSV"
}
elseif ($groupe -like "eleveRobertBadinter") {
    $dn = "OU=ElevesRB" + ",DC=" + $domain.split("=")[1].split("}")[0].split(".")[0] + ",DC=" + $domain.split("=")[1].split("}")[0].split(".")[1]
    $OU = "ElevesRB"
}
elseif ($groupe -like "eleveRobertDebre") {
    $dn = "OU=ElevesRD" + ",DC=" + $domain.split("=")[1].split("}")[0].split(".")[0] + ",DC=" + $domain.split("=")[1].split("}")[0].split(".")[1]
    $OU = "ElevesRD"
}
elseif ($groupe -like "eleveLouisPasteur") {
    $dn = "OU=ElevesLP" + ",DC=" + $domain.split("=")[1].split("}")[0].split(".")[0] + ",DC=" + $domain.split("=")[1].split("}")[0].split(".")[1]
    $OU = "ElevesLP"
}
elseif ($groupe -like "eleveEmileZola") {
    $dn = "OU=ElevesEZ" + ",DC=" + $domain.split("=")[1].split("}")[0].split(".")[0] + ",DC=" + $domain.split("=")[1].split("}")[0].split(".")[1]
    $OU = "ElevesEZ"
}
elseif ($groupe -like "eleveLouiseMichel") {
    $dn = "OU=ElevesLM" + ",DC=" + $domain.split("=")[1].split("}")[0].split(".")[0] + ",DC=" + $domain.split("=")[1].split("}")[0].split(".")[1]
    $OU = "ElevesLM"
}
else {
    Write-Output "Wrong OU"
}

#--------- Creation de l'utilisateur ---------#

Write-Output "-Name '$name'"
New-ADUser -Name "$name" -GivenName "$givenName" -Surname "$surname" -SamAccountName "$samAccountName" -UserPrincipalName "$userPrincipalName" -AccountPassword (ConvertTo-SecureString -AsPlainText "$accountPassword" -Force) -Enabled $true -ChangePasswordAtLogon $true -Path "$dn"

#-------- Creation du dossier partagé --------#

New-Item -name $samAccountName -Path "C:\PARTAGE\" -ItemType Directory

#----- Initialisation des variables acl ------#

$userGlobalInfo = Get-ADUser -Identity $samAccountName
Write-Output $userGlobalInfo
$homeDirectoryPath = "\\" + $(hostname) + "\PARTAGE\{0}" -f $SamAccountName
Write-Output $homeDirectoryPath
$homeDirectoryShortPath = "C:\PARTAGE\{0}\" -f $SamAccountName
Write-Output $homeDirectoryShortPath
Set-ADUser $userGlobalInfo -HomeDrive "U:" -HomeDirectory $homeDirectoryPath

#---- Mise en place des accès au partage -----#

$acl = Get-Acl -Path $homeDirectoryShortPath
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule($samAccountName,"FullControl","Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-acl -Path $homeDirectoryShortPath

##################### FIN #####################