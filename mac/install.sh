/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> /Users/{profile}/.zprofile

brew install git
brew install ccleaner
brew install dos2unix
brew install terraform-docs
brew install docker
brew install snyk
brew install python@3.9
brew install node-build

brew update
brew upgrade
brew cleanup
