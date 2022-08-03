# Get system information
systemInfo > .\"$env:ComputerName.SystemInfo.txt"

# Gets service list
Write-Progress -Activity "Getting Services" -Completed 0
Get-Service | Select DisplayName, ServiceName, Status | Sort DisplayName > .\"$env:ComputerName.Services.txt"

# Gets process list
Write-Progress -Activity "Getting Processes" -Completed 25
Get-Process | Select Name, Id | Sort Name > .\"$env:ComputerName.Process.txt"

# Gets installed applications. This is an older way but it has better compatibility with older systems.
Write-Progress -Activity "Getting Installed Applications" -Completed 50
wmic Product get Name,Version,Vendor  > .\"$env:ComputerName.Applications.txt"

# Gets a list of installed server features. Only works on Windows Server OS, not Windows Client OS.
Write-Progress -Activity "Getting Installed Server Features and Roles" -Completed 75
try{
    $windowsFeatures = Get-WindowsFeature
    if($windowsFeatures){
        $windowsFeatures > .\"$env:ComputerName.ServerFeatures.txt"
    }
}
catch [System.Exception] {
    Write-Warning "Unable to get Windows Server Feature details because this is: $env:OS" 
}
