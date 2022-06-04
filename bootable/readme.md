# Bootable usb

# Step 1:
diskutil list
- /dev/disk5

# Step 2:
diskutil eraseDisk MS-DOS "WINDOWS10" MBR disk5

# Step 3:
rsync -avh --progress --exclude=sources/install.wim /Volumes/J_CCSA_X86FRE_EN-US_DV5/ /Volumes/WINDOWS10

# Step 4:
{optional} /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hom...)"
brew install wimlib

# Step 5:
wimlib-imagex split /Volumes/J_CCSA_X86FRE_EN-US_DV5/sources/install.wim /Volumes/WINDOWS10/sources/install.swm 4000