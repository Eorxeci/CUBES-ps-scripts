##### INITIALISATION #####

$path = "userList.txt"
$data = cat $path
$flag = "none"
$name = "none"
$givenNameFirstLetter = "none"
$givenNameLastLetters = "none"
$givenName = "none"
$surname = "none"
$samAccountName = "none"
$domain = "none"
$userPrincipalName = "none"
$accountPassword = "none"
$dn = "none"

######### SCRIPT #########

foreach ($user in $data) {
    if ($user -like "## PERSONNEL*") {
        $flag = "personnel"
    }
    elseif ($user -like "## ELEVES*") {
        $flag = "eleve"
    }
    else {
        $givenName = $user.split(" ")[1]
        $givenNameFirstLetter = $givenName.Substring(0, 1).ToUpper()
        $givenNameLastLetters = $givenName.Substring(1)
        $givenName = $givenNameFirstLetter + $givenNameLastLetters
        $surname = $user.split(" ")[0].ToUpper()
        $name = $givenName + " " + $surname
        $samAccountName = $givenName.ToLower() + "." + $surname.ToLower()
        $domain = [string] $(Get-ADDomainController | Select-Object Domain)
        #$domain= "@{Domain=eorxeci.lan}"
        $userPrincipalName = $samAccountName + $domain.split("{")[0] + $domain.split("=")[1].split("}")[0]
        $accountPassword = $( -join ("ABCDabcd&@#$%1234".tochararray() | Get-Random -Count 8 | ForEach-Object { [char]$_ }))
        if ($flag -eq "personnel") {
            $dn = "OU=Professeurs" + ",DC=" + $domain.split("=")[1].split("}")[0].split(".")[0] + ",DC=" + $domain.split("=")[1].split("}")[0].split(".")[1]
            Write-Output "-Name '$name' -GivenName '$givenName' -Surname '$surname' -SamAccountName '$samAccountName' -UserPrincipalName '$userPrincipalName' -AccountPassword (ConvertTo-SecureString -AsPlainText '$accountPassword' -Force) -Enable $true -ChangePasswordAtLogon $true -Path '$dn'"
            New-ADUser -Name "$name" -GivenName "$givenName" -Surname "$surname" -SamAccountName "$samAccountName" -UserPrincipalName "$userPrincipalName" -AccountPassword (ConvertTo-SecureString -AsPlainText "$accountPassword" -Force) -Enabled $true -ChangePasswordAtLogon $true -Path "$dn"
        }
        #Write-Output $user.split(" ")[1]
        #New-ADUser -Name $USER -GivenName "Jean" -Surname "DUPONT" -SamAccountName "jdupont" -UserPrincipalName "jdupont@lab.intra" -AccountPassword (ConvertTo-SecureString -AsPlainText "Pàssw0rd" -Force) -Enable $true -ChangePasswordAtLogon $true -Path "OU=Users,OU=IT,OU=Services,DC=LAB,DC=INTRA"
    }
    #Write-Output $flag >> userList.txt
}


# New-ADUser -Name "Jean DUPONT" -GivenName "Jean" -Surname "DUPONT" -SamAccountName "jdupont" -UserPrincipalName "jdupont@lab.intra" -AccountPassword (ConvertTo-SecureString -AsPlainText "Pàssw0rd" -Force) -Enable $true -ChangePasswordAtLogon $true -Path "OU=Users,OU=IT,OU=Services,DC=LAB,DC=INTRA"