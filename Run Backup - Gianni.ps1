$user = $env:UserName
$Logfile = "C:\Users\Gianni\Documents\Backup from Server\Logs\$(gc env:computername).log\"
$Date = Get-Date

Function LogWrite
{
   Param ([string]$logstring)

   Add-content $Logfile -value $logstring
}

$BackupsAdminPath = "C:\Users\Gianni\Documents\Backup from Server\administration\"
$BackupsDocsPath = "C:\Users\Gianni\Documents\Backup from Server\Docs-Testing\"
$BackupsDocumentationPath = "C:\Users\Gianni\Documents\Backup from Server\documentation\"
$BackupsGianniPath = "C:\Users\Gianni\Documents\Backup from Server\Gianni\"

$ServerAdminPath = "\\192.168.201.14\share\IT\administration\"
$ServerDocsPath = "\\192.168.201.14\share\IT\Docs-Testing\"
$ServerDocumentationPath = "\\192.168.201.14\share\IT\documentation\"
$ServerGianniPath = "\\192.168.201.14\share\IT\Gianni\"

LogWrite "Started backup on $Date"

Get-ChildItem -Path $ServerAdminPath | Copy-Item -Destination $BackupsAdminPath -Recurse -Force
Get-ChildItem -Path $ServerDocsPath | Copy-Item -Destination $BackupsDocsPath -Recurse -Force
Get-ChildItem -Path $ServerDocumentationPath | Copy-Item -Destination $BackupsDocumentationPath -Recurse -Force
Get-ChildItem -Path $ServerGianniPath | Copy-Item -Destination $BackupsGianniPath -Recurse -Force

LogWrite "Completed backup on $Date"