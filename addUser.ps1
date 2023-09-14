$PATH= "userList.txt"
$DATA= cat $PATH
$FLAG= "none"

foreach ($USER in $DATA)
{
    if ($USER -like "## PERSONNEL*")
    {
        $FLAG= "personnel"
    }
    elseif ($User -like "## ELEVES*") {
        $FLAG="eleve"
    }
    echo $FLAG >> userList.txt
}



# New-ADUser -Name "Jean DUPONT" -GivenName "Jean" -Surname "DUPONT" -SamAccountName "jdupont" -UserPrincipalName "jdupont@lab.intra" -AccountPassword (ConvertTo-SecureString -AsPlainText "Pàssw0rd" -Force) -Enable $true -ChangePasswordAtLogon $true -Path "OU=Users,OU=IT,OU=Services,DC=LAB,DC=INTRA"