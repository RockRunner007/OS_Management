<#
README

ops.ps1 - Windows Operations Automation Script

This script automates the installation and management of Chocolatey packages on Windows.

Features:
- Sets execution policy for script compatibility.
- Installs Chocolatey if not already installed.
- Lists all locally installed Chocolatey packages.
- Upgrades all installed Chocolatey packages to their latest versions.
- Refreshes environment variables for new tools.
- Lists outdated packages after upgrade.
- Cleans up old package versions.

Usage:
1. Open PowerShell as Administrator.
2. Run: .\ops.ps1

Note:
- Internet connection is required for Chocolatey installation and package upgrades.
- Some package upgrades may require a system restart.

#>

# Ensure the script can run and install Chocolatey by setting execution policy and downloading the installer
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# List all locally installed Chocolatey packages
choco list --local-only

# Upgrade all installed Chocolatey packages to their latest versions
choco upgrade all

# Refresh environment variables so newly installed tools are available
& "$env:ChocolateyInstall\helpers\refreshenv.cmd"

# List outdated packages after upgrade
choco outdated

# Optional: Clean up old package versions
choco clean --yes