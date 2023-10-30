/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> /Users/{profile}/.zprofile

brew tap snyk/tap
sudo softwareupdate --install-rosetta

brew list

brew install ccleaner
brew install firefox
brew install google-drive
brew install google-chrome
brew install microsoft-edge
brew install visual-studio-code
brew install slack
brew install postman
brew install drawio
brew install zoom

brew install git
brew install docker
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

brew update
brew upgrade
brew cleanup
