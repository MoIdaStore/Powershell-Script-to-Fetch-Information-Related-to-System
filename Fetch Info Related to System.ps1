##The following script is used to fetch important and basic information related to systems such as the model of the system, the available disk space, the BIOS information, processors configuration, memory details, Operating System details, the list of users and owners of the system, current user session and the status of the various running processes and various hotfixes that are installed.

##Example #1
#Code:

Write-Host "Welcome to the script of fetching computer Information"
Write-host "The BIOS Details are as follows"
Get-CimInstance -ClassName Win32_BIOS

##Example #2
#Code:

Write-Host "The systems processor is"
Get-CimInstance -ClassName Win32_ComputerSystem | Select-Object -Property SystemType

##Example #3
#Code:

Write-Host "The computer Manufacture and physical memory details are as follows"
Get-CimInstance -ClassName Win32_ComputerSystem

##Example #4
#Code:

Write-Host "The installed hotfixes are"
Get-CimInstance -ClassName Win32_QuickFixEngineering

##Example #5
#Code:

Write-Host "The OS details are below"
Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -Property Build*,OSType,ServicePack*

##Example #6
#Code:

Write-Host "The following are the users and the owners"
Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -Property *user*

##Example #7
#Code:

Write-Host "The disk space details are as follows"
Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3" |Measure-Object -Property FreeSpace,Size -Sum |Select-Object -Property Property,Sum

##Example #8
#Code:

Write-Host "Current user logged in to the system"
Get-CimInstance -ClassName Win32_ComputerSystem -Property UserName

##Example #9
#Code:

Write-Host "Status of the running services are as follows"
Get-CimInstance -ClassName Win32_Service | Format-Table -Property Status,Name,DisplayName -AutoSize -Wrap
