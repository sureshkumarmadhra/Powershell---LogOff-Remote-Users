#Gets all workstations that need to have software installed, if you don't want to uninstall all of the software from you will need to use a text document and Get-Content
$Machines = Get-ADComputer -Filter * -SearchBase "OU=Workstations,DC=CONTOSO,DC=COM" | Select DNSHostName -ExpandProperty DNSHostname

#Gets computers to run on from text file
#$Machines = Get-Content '\\fileshare\Computers.txt'

$Service = "AdobeARMservice"

Get-Service -Name $Service -ComputerName $Machines | Restart-Service
