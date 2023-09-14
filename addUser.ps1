$PATH= "userList.txt"
$USER= Get-Content $PATH

Write-Output $USER

# New-ADUser -Name "Jean DUPONT" -GivenName "Jean" -Surname "DUPONT" -SamAccountName "jdupont" -UserPrincipalName "jdupont@lab.intra" -AccountPassword (ConvertTo-SecureString -AsPlainText "Pàssw0rd" -Force) -Enable $true -ChangePasswordAtLogon $true -Path "OU=Users,OU=IT,OU=Services,DC=LAB,DC=INTRA"