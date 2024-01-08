#####script silencieux#####

##creation des repertoires et application des droits##
New-Item -name "PARTAGE" -Path "C:\" -ItemType Directory
New-Item -name "ESPACEPROFESSEURS" -Path "C:\PARTAGE\" -ItemType Directory
New-Item -name "ESPACEADMINISTRATIF" -Path "C:\PARTAGE\" -ItemType Directory
New-Item -name "ESPACEELEVES" -Path "C:\PARTAGE\" -ItemType Directory

New-SmbShare -Name PartageGlobal -Path "C:\PARTAGE\" -FullAccess "Utilisateurs"
New-SmbShare -Name PartageProfesseurs -Path "C:\PARTAGE\ESPACEPROFESSEURS\" -FullAccess "Profs"
New-SmbShare -Name PartageAdministratifs -Path "C:\PARTAGE\ESPACEADMINISTRATIF\" -FullAccess "Administratifs"
New-SmbShare -Name PartageEleves -Path "C:\PARTAGE\ESPACEELEVES\" -FullAccess "Eleves"

$ACL = Get-ACL -Path "C:\PARTAGE\ESPACEPROFESSEURS\"
$acl.SetAccessRuleProtection($true, $false)
$ACL | Set-Acl -Path "C:\PARTAGE\ESPACEPROFESSEURS\"
$ACL = Get-ACL -Path "C:\PARTAGE\ESPACEPROFESSEURS\"
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("Profs", "ReadAndExecute", "Allow")
$ACL.SetAccessRule($AccessRule)
$ACL | Set-Acl -Path "C:\PARTAGE\ESPACEPROFESSEURS\"
$ACL = Get-ACL -Path "C:\PARTAGE\ESPACEPROFESSEURS\"
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("Administrateurs", "FullControl", "Allow")
$ACL.SetAccessRule($AccessRule)
$ACL | Set-Acl -Path "C:\PARTAGE\ESPACEPROFESSEURS\"

$ACL = Get-ACL -Path "C:\PARTAGE\ESPACEADMINISTRATIF\"
$acl.SetAccessRuleProtection($true, $false)
$ACL | Set-Acl -Path "C:\PARTAGE\ESPACEADMINISTRATIF\"
$ACL = Get-ACL -Path "C:\PARTAGE\ESPACEADMINISTRATIF\"
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("Administratifs", "ReadAndExecute", "Allow")
$ACL.SetAccessRule($AccessRule)
$ACL | Set-Acl -Path "C:\PARTAGE\ESPACEADMINISTRATIF\"
$ACL = Get-ACL -Path "C:\PARTAGE\ESPACEADMINISTRATIF\"
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("Administrateurs", "FullControl", "Allow")
$ACL.SetAccessRule($AccessRule)
$ACL | Set-Acl -Path "C:\PARTAGE\ESPACEADMINISTRATIF\"

$ACL = Get-ACL -Path "C:\PARTAGE\ESPACEELEVES\"
$acl.SetAccessRuleProtection($true, $false)
$ACL | Set-Acl -Path "C:\PARTAGE\ESPACEELEVES\"
$ACL = Get-ACL -Path "C:\PARTAGE\ESPACEELEVES\"
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("Eleves", "ReadAndExecute", "Allow")
$ACL.SetAccessRule($AccessRule)
$ACL | Set-Acl -Path "C:\PARTAGE\ESPACEELEVES\"
$ACL = Get-ACL -Path "C:\PARTAGE\ESPACEELEVES\"
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("Administrateurs", "FullControl", "Allow")
$ACL.SetAccessRule($AccessRule)
$ACL | Set-Acl -Path "C:\PARTAGE\ESPACEELEVES\"

$ACL = Get-ACL -Path "C:\PARTAGE\"
$acl.SetAccessRuleProtection($true, $false)
$ACL | Set-Acl -Path "C:\PARTAGE\"
$ACL = Get-ACL -Path "C:\PARTAGE\"
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("Utilisateurs", "ReadAndExecute", "Allow")
$ACL.SetAccessRule($AccessRule)
$ACL | Set-Acl -Path "C:\PARTAGE\"
$ACL = Get-ACL -Path "C:\PARTAGE\"
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("Administrateurs", "FullControl", "Allow")
$ACL.SetAccessRule($AccessRule)
$ACL | Set-Acl -Path "C:\PARTAGE\"