############### INITIALISATION ###############

Write-Output "Outil de listing de groupe..."

$group = read-host "Quel est le nom du groupe dont vous souhaitez connaitre le contenu ? "

################### SCRIPT ####################
#------- Listing du contenu du groupe --------#

Get-AdGroupMember -Identity $group

##################### FIN #####################