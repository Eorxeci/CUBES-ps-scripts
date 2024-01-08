#Creation automatique des OU necessaires

$domain = [string] $(Get-ADDomainController | Select-Object Domain)
$DC = "DC=" + $domain.split("=")[1].split("}")[0].split(".")[0] + ",DC=" + $domain.split("=")[1].split("}")[0].split(".")[1]


Write-Output "Creation de l'OU Professeurs"
New-ADOrganizationalUnit -Name "Professeurs" -Path $DC

Write-Output "Creation de l'OU ElevesJF"
New-ADOrganizationalUnit -Name "ElevesJF" -Path $DC

Write-Output "Creation de l'OU ElevesSV"
New-ADOrganizationalUnit -Name "ElevesSV" -Path $DC

Write-Output "Creation de l'OU ElevesRB"
New-ADOrganizationalUnit -Name "ElevesRB" -Path $DC

Write-Output "Creation de l'OU ElevesRD"
New-ADOrganizationalUnit -Name "ElevesRD" -Path $DC

Write-Output "Creation de l'OU ElevesLP"
New-ADOrganizationalUnit -Name "ElevesLP" -Path $DC

Write-Output "Creation de l'OU ElevesEZ"
New-ADOrganizationalUnit -Name "ElevesEZ" -Path $DC

Write-Output "Creation de l'OU ElevesLM"
New-ADOrganizationalUnit -Name "ElevesLM" -Path $DC

Write-Output "Toutes les OU ont ete creees"

#Creation des groupes utilisateurs

New-ADGroup -Name "Profs" -SamAccountName profs -GroupCategory Security -GroupScope Global -DisplayName "Profs" -Path $DC
New-ADGroup -Name "Administratifs" -SamAccountName administratifs -GroupCategory Security -GroupScope Global -DisplayName "Administratifs" -Path $DC
New-ADGroup -Name "Eleves" -SamAccountName eleves -GroupCategory Security -GroupScope Global -DisplayName "Eleves" -Path $DC

Write-Output "Tous les groupes ont ete crees"

