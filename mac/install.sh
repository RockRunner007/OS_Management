/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> /Users/{profile}/.zprofile

brew list
brew install autoconf
brew install ccleaner
brew install coreutils
brew install dos2unix
brew install git
brew install go
brew install docker
brew install jq
brew install node
brew install node-build
brew install openssl
brew install python@3.10
brew install snyk
brew install terraform
brew install terraform-docs
brew install wimlib

brew update
brew upgrade
brew cleanup
