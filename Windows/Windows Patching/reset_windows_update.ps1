#0. Make sure you have the stuff
$PSVersionTable
# Import-Module Microsoft.PowerShell.Management
# $arch = get-ciminstance -Class Win32_Processor -ComputerName LocalHost | Select-Object AddressWidth

#1. Stopping Windows Update Services...
Stop-Service -Name BITS
Stop-Service -Name wuauserv
Stop-Service -Name appidsvc
Stop-Service -Name cryptsvc

#2. Remove QMGR Data file...
Remove-Item "$env:allusersprofile\Microsoft\Network\Downloader\qmgr*.dat" -ErrorAction SilentlyContinue

#3. Renaming the Software Distribution and CatRoot Folder...
Remove-Item $env:systemroot\SoftwareDistribution.bak -ErrorAction SilentlyContinue
Rename-Item $env:systemroot\SoftwareDistribution SoftwareDistribution.bak -ErrorAction SilentlyContinue

# This may not work if the folder is locked by having a contained file being accessed
Remove-Item $env:systemroot\System32\Catroot2.bak -ErrorAction SilentlyContinue
Rename-Item $env:systemroot\System32\Catroot2 catroot2.bak -ErrorAction SilentlyContinue

#4. Removing old Windows Update log...
Remove-Item $env:systemroot\WindowsUpdate.log -ErrorAction SilentlyContinue

#5. Resetting the Windows Update Services to default settings...
[void]("sc.exe sdset bits D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;AU)(A;;CCLCSWRPWPDTLOCRRC;;;PU)")
[void]("sc.exe sdset wuauserv D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;AU)(A;;CCLCSWRPWPDTLOCRRC;;;PU)")
Set-Location $env:systemroot\system32

#6. Registering some DLLs...
regsvr32.exe /s atl.dll
regsvr32.exe /s urlmon.dll
regsvr32.exe /s mshtml.dll
regsvr32.exe /s shdocvw.dll
regsvr32.exe /s browseui.dll
regsvr32.exe /s jscript.dll
regsvr32.exe /s vbscript.dll
regsvr32.exe /s scrrun.dll
regsvr32.exe /s msxml.dll
regsvr32.exe /s msxml3.dll
regsvr32.exe /s msxml6.dll
regsvr32.exe /s actxprxy.dll
regsvr32.exe /s softpub.dll
regsvr32.exe /s wintrust.dll
regsvr32.exe /s dssenh.dll
regsvr32.exe /s rsaenh.dll
regsvr32.exe /s gpkcsp.dll
regsvr32.exe /s sccbase.dll
regsvr32.exe /s slbcsp.dll
regsvr32.exe /s cryptdlg.dll
regsvr32.exe /s oleaut32.dll
regsvr32.exe /s ole32.dll
regsvr32.exe /s shell32.dll
regsvr32.exe /s initpki.dll
regsvr32.exe /s wuapi.dll
regsvr32.exe /s wuaueng.dll
regsvr32.exe /s wuaueng1.dll
regsvr32.exe /s wucltui.dll
regsvr32.exe /s wups.dll
regsvr32.exe /s wups2.dll
regsvr32.exe /s wuweb.dll
regsvr32.exe /s qmgr.dll
regsvr32.exe /s qmgrprxy.dll
regsvr32.exe /s wucltux.dll
regsvr32.exe /s muweb.dll
regsvr32.exe /s wuwebv.dll

#7) Removing WSUS client settings...
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v AccountDomainSid /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v PingID /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v SusClientId /f

#8) Resetting the WinSock...
[void](netsh winsock reset)
[void](netsh winhttp reset proxy)

#9) Delete all BITS jobs...
Get-BitsTransfer | Remove-BitsTransfer

#10) Attempting to install the Windows Update Agent...
# if($arch -eq 64){
#     wusa Windows8-RT-KB2937636-x64 /quiet
# }
# else{
#     wusa Windows8-RT-KB2937636-x86 /quiet
# }

#11) Starting Windows Update Services...
Start-Service -Name BITS
Start-Service -Name wuauserv
Start-Service -Name appidsvc
Start-Service -Name cryptsvc

#12) Forcing discovery...
wuauclt /resetauthorization /detectnow
Write-Output "Windows Update settings restored to default."