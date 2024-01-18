############### INITIALISATION ###############

Write-Output "Outil d'affichage des groupes d'un utilisateur..."

$samAccountName = read-host "Entrez le samAccountName de l'utilisateur "

################### SCRIPT ####################
#--- Listing des groupes de l'utilisateur ----#

Get-AdPrincipalGroupMemberShip $samAccountName | Select-Object name

##################### FIN #####################