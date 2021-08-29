Watch-OSDCloudProvisioning {
    Write-Host -ForegroundColor Cyan "Windows 10 - AutoPilot Zero Touch"

    #Start OSDCloud ZTI, Update Module first
    Update-OSDProgress -Text "Starting AutoPilot Pre-Installation checks." # output to UI
    Write-Host  -ForegroundColor Cyan "Starting AutoPilot Pre-Installation checks." # output to console
    Start-Sleep -Seconds 3

    Update-OSDProgress -Text "Downloading and Installing required Modules"#
    Install-Module OSD -Force
    Import-Module OSD -Force
    Install-Module AutopilotOOBE -Force
    Update-OSDProgress -Phase -Text "Disk Managment"
    Update-OSDProgress -Text "Getting disk ready for installation."

    Start-OSDCloud -OSBuild 21H1 -OSEdition Education -ZTI

    Update-OSDProgress -Text "Enrolling in AutoPilot MDM"
    Write-Host  -ForegroundColor Cyan "Enrolling in AutoPilot MDM"
    
    Update-OSDProgress -Text " " # hide first text

    #Restart from WinPE
    Update-OSDProgress -Text "Reboot in 20 seconds"
    Start-Sleep -Seconds 20
    wpeutil reboot
    
}
Install-Module OSDProgress
Watch-OSDCloudProvisioning -Window