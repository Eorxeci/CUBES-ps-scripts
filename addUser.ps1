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
    elseif ($user -like "## ELEVES ID 01*") {
        $flag = "eleveJulesFerry"
    }
    elseif ($user -like "## ELEVES ID 02*") {
        $flag = "eleveSimoneVeil"
    }
    elseif ($user -like "## ELEVES ID 03*") {
        $flag = "eleveRobertBadinter"
    }
    elseif ($user -like "## ELEVES ID 04*") {
        $flag = "eleveRobertDebre"
    }
    elseif ($user -like "## ELEVES ID 05*") {
        $flag = "eleveLouisPasteur"
    }
    elseif ($user -like "## ELEVES ID 06*") {
        $flag = "eleveEmileZola"
    }
    elseif ($user -like "## ELEVES ID 07*") {
        $flag = "eleveLouiseMichel"
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
            $group = "Profs"
            $dn = "OU=Professeurs" + ",DC=" + $domain.split("=")[1].split("}")[0].split(".")[0] + ",DC=" + $domain.split("=")[1].split("}")[0].split(".")[1]
            Write-Output "-Name '$name'"
            New-ADUser -Name "$name" -GivenName "$givenName" -Surname "$surname" -SamAccountName "$samAccountName" -UserPrincipalName "$userPrincipalName" -AccountPassword (ConvertTo-SecureString -AsPlainText "$accountPassword" -Force) -Enabled $true -ChangePasswordAtLogon $true -Path "$dn"
        }
        elseif ($flag -eq "eleveJulesFerry") {
            $group = "Eleves"
            $dn = "OU=ElevesJF" + ",DC=" + $domain.split("=")[1].split("}")[0].split(".")[0] + ",DC=" + $domain.split("=")[1].split("}")[0].split(".")[1]
            Write-Output "-Name '$name'"
            New-ADUser -Name "$name" -GivenName "$givenName" -Surname "$surname" -SamAccountName "$samAccountName" -UserPrincipalName "$userPrincipalName" -AccountPassword (ConvertTo-SecureString -AsPlainText "$accountPassword" -Force) -Enabled $true -ChangePasswordAtLogon $true -Path "$dn"
        }
        elseif ($flag -eq "eleveSimoneVeil") {
            $group = "Eleves"
            $dn = "OU=ElevesSV" + ",DC=" + $domain.split("=")[1].split("}")[0].split(".")[0] + ",DC=" + $domain.split("=")[1].split("}")[0].split(".")[1]
            Write-Output "-Name '$name'"
            New-ADUser -Name "$name" -GivenName "$givenName" -Surname "$surname" -SamAccountName "$samAccountName" -UserPrincipalName "$userPrincipalName" -AccountPassword (ConvertTo-SecureString -AsPlainText "$accountPassword" -Force) -Enabled $true -ChangePasswordAtLogon $true -Path "$dn"
        }
        elseif ($flag -eq "eleveRobertBadinter") {
            $group = "Eleves"
            $dn = "OU=ElevesRB" + ",DC=" + $domain.split("=")[1].split("}")[0].split(".")[0] + ",DC=" + $domain.split("=")[1].split("}")[0].split(".")[1]
            Write-Output "-Name '$name'"
            New-ADUser -Name "$name" -GivenName "$givenName" -Surname "$surname" -SamAccountName "$samAccountName" -UserPrincipalName "$userPrincipalName" -AccountPassword (ConvertTo-SecureString -AsPlainText "$accountPassword" -Force) -Enabled $true -ChangePasswordAtLogon $true -Path "$dn"
        }
        elseif ($flag -eq "eleveRobertDebre") {
            $group = "Eleves"
            $dn = "OU=ElevesRD" + ",DC=" + $domain.split("=")[1].split("}")[0].split(".")[0] + ",DC=" + $domain.split("=")[1].split("}")[0].split(".")[1]
            Write-Output "-Name '$name'"
            New-ADUser -Name "$name" -GivenName "$givenName" -Surname "$surname" -SamAccountName "$samAccountName" -UserPrincipalName "$userPrincipalName" -AccountPassword (ConvertTo-SecureString -AsPlainText "$accountPassword" -Force) -Enabled $true -ChangePasswordAtLogon $true -Path "$dn"
        }
        elseif ($flag -eq "eleveLouisPasteur") {
            $group = "Eleves"
            $dn = "OU=ElevesLP" + ",DC=" + $domain.split("=")[1].split("}")[0].split(".")[0] + ",DC=" + $domain.split("=")[1].split("}")[0].split(".")[1]
            Write-Output "-Name '$name'"
            New-ADUser -Name "$name" -GivenName "$givenName" -Surname "$surname" -SamAccountName "$samAccountName" -UserPrincipalName "$userPrincipalName" -AccountPassword (ConvertTo-SecureString -AsPlainText "$accountPassword" -Force) -Enabled $true -ChangePasswordAtLogon $true -Path "$dn"
        }
        elseif ($flag -eq "eleveEmileZola") {
            $group = "Eleves"
            $dn = "OU=ElevesEZ" + ",DC=" + $domain.split("=")[1].split("}")[0].split(".")[0] + ",DC=" + $domain.split("=")[1].split("}")[0].split(".")[1]
            Write-Output "-Name '$name'"
            New-ADUser -Name "$name" -GivenName "$givenName" -Surname "$surname" -SamAccountName "$samAccountName" -UserPrincipalName "$userPrincipalName" -AccountPassword (ConvertTo-SecureString -AsPlainText "$accountPassword" -Force) -Enabled $true -ChangePasswordAtLogon $true -Path "$dn"
        }
        elseif ($flag -eq "eleveLouiseMichel") {
            $group = "Eleves"
            $dn = "OU=ElevesLM" + ",DC=" + $domain.split("=")[1].split("}")[0].split(".")[0] + ",DC=" + $domain.split("=")[1].split("}")[0].split(".")[1]
            Write-Output "-Name '$name'"
            New-ADUser -Name "$name" -GivenName "$givenName" -Surname "$surname" -SamAccountName "$samAccountName" -UserPrincipalName "$userPrincipalName" -AccountPassword (ConvertTo-SecureString -AsPlainText "$accountPassword" -Force) -Enabled $true -ChangePasswordAtLogon $true -Path "$dn"
        }
        else {
            Write-Output "Wrong flag"
        }

        Add-ADGroupMember -Identity "$group" -Members $samAccountName
        New-Item -name $samAccountName -Path "C:\PARTAGE\" -ItemType Directory

        $userGlobalInfo = Get-ADUser -Identity $samAccountName
        Write-Output $userGlobalInfo
        $homeDirectoryPath = "\\" + $(hostname) + "\PARTAGE\{0}" -f $SamAccountName
        Write-Output $homeDirectoryPath
        $homeDirectoryShortPath = "C:\PARTAGE\{0}\" -f $SamAccountName
        Write-Output $homeDirectoryShortPath
        Set-ADUser $userGlobalInfo -HomeDrive "U:" -HomeDirectory $homeDirectoryPath

        $acl = Get-Acl -Path $homeDirectoryShortPath
        $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule($samAccountName,"FullControl","Allow")
        $acl.SetAccessRule($AccessRule)
        $acl | Set-acl -Path $homeDirectoryShortPath
    }
}