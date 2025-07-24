# Operations

## Details

# - This script automates basic system maintenance tasks for a Linux machine using `apt`. It performs the following actions:

# 1. Updates the package list (`sudo apt update`)
# 2. Upgrades all installed packages to their latest versions (`sudo apt upgrade -y`)
# 3. Performs a distribution upgrade, handling changing dependencies (`sudo apt dist-upgrade -y`)
# 4. Removes unused packages (`sudo apt autoremove -y`)
# 5. Cleans up retrieved package files (`sudo apt autoclean -y`)

## Usage

set -e

sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoremove -y
sudo apt autoclean -y
