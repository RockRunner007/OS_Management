$url = "https://www.nartac.com/Downloads/IISCrypto/IISCryptoCli.exe"
$path = "C:\Program Files\IISCrypto\"
$output = "C:\Program Files\IISCrypto\IISCryptoCli.exe"
 
If(!(test-path $path))
{
      New-Item -ItemType Directory -Force -Path $path
}
 
Invoke-WebRequest -Uri $url -OutFile $output
Write-Output "Downloaded the cli tool"
 
Set-Location -Path $output
.\IISCryptoCli.exe /template pci31
 
Write-Output "Applied the policy"