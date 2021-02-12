@REM Get the service pid
sc queryex wuauserv

@REM Kill the service
taskkill /pid 13728 /f

@REM Delete old updates
DEL /F /S /Q C:\Windows\SoftwareDistribution\Download

@REM restart the Windows Update service
net start wuauserv