#Change active directory to temp folder
Set-Location -Path C:\temp

#Download msu for the KIB that is not install automatically from #https://www.catalog.update.microsoft.com/Search.aspx?q=KB4601318
Invoke-WebRequest http://download.windowsupdate.com/c/msdownload/update/software/secu/2021/02/windows10.0-kb4601318-x64_0e3c1261a7405cf824f2ab40c2cfc0efff18214b.msu -OutFile kb4601318.msu

#Install the msu using wusa
wusa.exe kb4601318.msu 
