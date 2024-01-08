Write-Output "Outil de listing de groupe..."
$group = read-host "Quel est le nom du groupe dont vous souhaitez connaitre le contenu ? "

Get-AdGroupMember -Identity $group