#!/bin/bash

# Bootable USB Creation Script

# This script helps you create a bootable Windows USB installer on macOS.
#
# Usage:
#   1. Insert your USB drive.
#   2. Run this script in Terminal: bash ops.sh
#   3. Follow the prompts to identify your USB disk (e.g., /dev/disk5).
#   4. The script will erase and format the USB, copy Windows files, and split install.wim if needed.
#
# Requirements:
#   - macOS with diskutil and rsync
#   - Source Windows ISO mounted (e.g., /Volumes/J_CCSA_X86FRE_EN-US_DV5)
#   - (Optional) wimlib installed via Homebrew for splitting large install.wim files
#
# WARNING: This script will ERASE the selected USB drive. Double-check your disk identifier!

# Step 0:
# Ensure diskutil is available
if ! command -v diskutil &> /dev/null; then
    echo "Error: diskutil is not installed. Please install it via macOS or Xcode Command Line Tools."
    exit 1
fi

# Step 1: List disks and identify your USB drive (e.g., /dev/disk5)
diskutil list

# Step 2: Erase and format the USB drive (replace disk5 with your disk identifier)
diskutil eraseDisk MS-DOS "WINDOWS10" MBR disk5

# Step 3: Copy Windows installation files, excluding install.wim
rsync -avh --progress --exclude=sources/install.wim /Volumes/J_CCSA_X86FRE_EN-US_DV5/ /Volumes/WINDOWS10

# Step 4: (Optional) Install wimlib if not already installed
if ! command -v wimlib-imagex &> /dev/null; then
    echo "wimlib is not installed. Please install it with Homebrew:"
    echo '  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
    echo "  brew install wimlib"
    exit 1
fi

# Step 5: Split install.wim into smaller .swm files (max 4000MB each)
wimlib-imagex split /Volumes/J_CCSA_X86FRE_EN-US_DV5/sources/install.wim /Volumes/WINDOWS10/sources/install.swm 4000
