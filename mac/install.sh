# Homebrew itself and alias
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> /Users/{profile}/.zprofile

# Third-Party Repositories
brew tap snyk/tap 

# CPU setup
sudo softwareupdate --install-rosetta

# Check current install
brew list

# Network Tools
brew install --cask nordvpn

# General Tools
brew install ccleaner
brew install drawio
brew install firefox
brew install google-drive
brew install google-chrome
brew install microsoft-edge
brew install postman
brew install slack
brew install --cask spotify
brew install visual-studio-code
brew install zoom

# Development Specific Tools
brew install git
brew install --cask docker
brew install jq
brew install node
brew install node-build
brew install openssl
brew install python
brew install snyk
brew install terraform
brew install terraform-docs
brew install wimlib
brew install wget

# Upgrade and cleanup
brew upgrade
brew cleanup
