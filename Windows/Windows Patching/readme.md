# Steps
1.) Automation
2.) Reboot and One-Time through automation for specific machine
3.) Reboot and One Update at time through Windows Admin Center
4.) Reboot and install updates sconfig
5.) Deep Dive
    a.) Clear Old Updates - clear_oldupdates.bat
    b.) Reset Windows Update Catelog - reset_windows_update.ps1
    c.) Install update manually - manual_install.ps1
    d.) Last attemp is rebasing the image - cleanup_image.ps1

# Research
1) powershell: Get-WindowsUpdateLog | open output
2) powershell: get-winevent setup -MaxEvents 10
3) Eventviewer: Events -> Applications and Services Logs -> Microsoft -> WindowsUpdateClient -> Operational
4) Windows Service: Get-Service wuauserv | select -property name,starttype,status
