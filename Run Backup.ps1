$user = $env:UserName
$Logfile = "\\192.168.201.14\share\IT\backups\$user\Logs\$(gc env:computername).log"
$Date = Get-Date

Function LogWrite
{
   Param ([string]$logstring)

   Add-content $Logfile -value $logstring
}

$DocumentsPath = [Environment]::GetFolderPath("MyDocuments")
$DesktopPath = [Environment]::GetFolderPath("Desktop")
$DocumentsDest = "\\192.168.201.14\share\IT\backups\$user\Documents"
$DesktopDest = "\\192.168.201.14\share\IT\backups\$user\Desktop"

LogWrite "Started backup on $Date"

Get-ChildItem -Path $DocumentsPath | Copy-Item -Destination $DocumentsDest -Recurse -Force
LogWrite "Completed backup of $DocumentsPath to $DocumentsDest at $Date"
Get-ChildItem -Path $DesktopPath | Copy-Item -Destination $DesktopDest -Recurse -Force
LogWrite "Completed backup of $DesktopPath to $DesktopDest at $Date"

LogWrite "Completed backup on $Date"