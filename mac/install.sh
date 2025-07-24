#!/bin/bash

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
eval "$(/opt/homebrew/bin/brew shellenv)"

# Third-Party Repositories
# brew tap snyk/tap

# CPU setup (Rosetta for Apple Silicon)
sudo softwareupdate --install-rosetta --agree-to-license

# Check current install
brew list

# Network Tools
# brew install --cask nordvpn

# General Tools
# brew install --cask 1password
# brew install 1password-cli
brew install ccleaner
brew install drawio
# brew install --cask discord
brew install firefox
brew install google-drive
brew install google-chrome
# brew install microsoft-edge
brew install postman
brew install slack
brew install --cask spotify
brew install visual-studio-code
brew install zoom

# Development Specific Tools
brew install git
brew install gh
brew install --cask github
brew install --cask docker
brew install jq
# brew install node
# brew install node-build
brew install openssl
brew install python
# brew install poetry
# brew install snyk
brew install terraform
brew install terraform-docs
brew install wimlib
brew install wget

# Ops Specific Tools
# brew install --cask google-cloud-sdk
# brew install awscli

# Upgrade and cleanup
brew upgrade
brew cleanup
