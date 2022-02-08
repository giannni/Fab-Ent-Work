#Printer 0 Information
$PrinterName0 = "Printer 0"
$PrinterPort0 = "192.168.201.51"
$PortHost0 = "192.168.201.51"
$DriverLocation0 = "\\someshare\Software\Drivers\Printers\HP_LJPM570\hpcm570u.inf"
$DriverName0 = "HP LaserJet 500 color MFP M570 PCL 6"

#Printer 1 Information
$PrinterName1 = "Printer 1"
$PrinterPort1 = "192.168.201.52"
$PortHost1 = "192.168.201.52"
$DriverLocation1 = "\\someshare\Software\Drivers\Printers\HP_LJPM570\hpcm570u.inf"
$DriverName1 = "HP LaserJet 500 color MFP M570 PCL 6"

#Xerox Primelink Information
$PrinterNamePrime = "Xerox Primelink"
$PrinterPortPrime = "192.168.201.71"
$PortHostPrime = "192.168.201.71"
$DriverLocationPrime = "\\someshare\Software\Drivers\Printers\HP_LJPM570\hpcm570u.inf"
$DriverNamePrime = "HP LaserJet 500 color MFP M570 PCL 6"


# Import Print Management Module
Import-Module PrintManagement

# Remove any existing printer port
# you will see an error is it does not exist, just ignore
# todo wrap in if statement
Remove-PrinterPort -name $PrinterPort0
Remove-PrinterPort -name $PrinterPort1
Remove-PrinterPort -name $PrinterPortPrime

# Add the printer port
Add-PrinterPort -Name $PrinterPort0 -PrinterHostAddress $PortHost0
Add-PrinterPort -Name $PrinterPort1 -PrinterHostAddress $PortHost1
Add-PrinterPort -Name $PrinterPortPrime -PrinterHostAddress $PortHostPrime

# Add the driver to the driver store
# using this because had failures with -InfPath in Add-PrinterDriver
Invoke-Command {pnputil.exe -a $DriverLocation0 }
Invoke-Command {pnputil.exe -a $DriverLocation1 }
Invoke-Command {pnputil.exe -a $DriverLocationPrime }

# Add the print driver 
Add-PrinterDriver -name $DriverName0
Add-PrinterDriver -name $DriverName1
Add-PrinterDriver -name $DriverNamePrime

# Add the printer
Add-Printer -name $PrinterName0 -PortName $PrinterPort0 -DriverName $DriverName0
Add-Printer -name $PrinterName1 -PortName $PrinterPort1 -DriverName $DriverName1
Add-Printer -name $PrinterNamePrime -PortName $PrinterPortPrime -DriverName $DriverNamePrime

# Set printer to print mono or color
Set-PrintConfiguration -PrinterName $PrinterName0 -Color $false
Set-PrintConfiguration -PrinterName $PrinterName1 -Color $false
Set-PrintConfiguration -PrinterName $PrinterNamePrime -Color $false