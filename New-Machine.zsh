#!/bin/zsh

if 
    $(fdesetup isactive)
then
    echo "KeyVault is active."
else
    echo "Enabling KeyVault."
    fdesetup enable
fi


if
    (( $+commands[brew] ))
then
    echo "Homebrew already installed."
else
    echo "Installing Homebrew."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi


echo
echo "Installing brews:"

echo " - Azure Cli"
brew install azure-cli
echo " - Gitversion"
brew install gitversion
echo " - Hugo"
brew install hugo
echo " - mas"
brew install mas


echo
echo "Installing casks:"

echo " - Adobe Creative Cloud"
brew cask install adobe-creative-cloud
echo " - Azure Data Studio"
brew cask install azure-data-studio
echo " - Azure Storage Explorer"
brew cask install microsoft-azure-storage-explorer
echo " - Backblaze"
brew cask install backblaze
echo " - Balena Etcher"
brew cask install balenaetcher
echo " - BitWarden"
brew cask install bitwarden
echo " - Brave"
brew cask install brave-browser
echo " - Cisco Proximity"
brew cask install cisco-proximity
echo " - Discord"
brew cask install discord
echo " - Docker"
brew cask install docker
echo " - Elmedia Player"
brew cask install elmedia-player
echo " - GitKraken"
brew cask install gitkraken
echo " - Kodi"
brew cask install kodi
echo " - iStat Menus"
brew cask install istat-menus
echo " - iTerm 2"
brew cask install iterm2
echo " - LastPass"
brew cask install lastpass
echo " - Minecraft"
brew cask install minecraft
echo " - Office"
brew cask install microsoft-office
echo " - Parallels"
brew cask install parallels
echo " - Postman"
brew cask install postman
echo " - Powershell"
brew cask install powershell
echo " - Raspberry Pi Imager"
brew cask install raspberry-pi-imager
echo " - QMK Toolbox"
brew cask install homebrew/cask-drivers/qmk-toolbox
echo " - SD Formatter"
brew cask install sdformatter
echo " - Steam"
brew cask install steam
echo " - Telegram"
brew cask install telegram
echo " - VS Code"
brew cask install visual-studio-code


echo
echo "Install casks from taps:"

echo " - Cask Version"
brew tap homebrew/cask-versions
echo " - - Powershell Preview"
brew cask install powershell-preview


echo
echo "Setting some settings:"

echo " - Show All Files"
defaults write Com.Apple.Finder AppleShowAllFiles -bool true
echo " - Show file extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
echo " - Show Drives on Desktop"
defaults write Com.Apple.Finder ShowHardDrivesOnDesktop -bool true
echo " - Show External Drives on Desktop"
defaults write Com.Apple.Finder ShowExternalHardDrivesOnDesktop -bool true
echo " - Show Removable Drives on Desktop"
defaults write Com.Apple.Finder ShowRemovableMediaOnDesktop -bool true
echo " - Add Quit to Finder Menu"
defaults write com.apple.finder QuitMenuItem -bool true
echo " - Disable Photos auto open"
defaults write com.apple.ImageCapture disableHotPlug -bool true
echo " - Disable automatic Spaces arrangement"
defaults write com.apple.dock mru-spaces -bool false


echo
echo "Installing App Store Apps:"

echo " - Amphetamine"
mas install 937984704
echo " - Commander Pro"
mas install 1035237815
echo " - Keynote"
mas install 409183694
echo " - LastPass"
mas install 926036361
echo " - Magnet"
mas install 441258766
echo " - Microsoft RDP"
mas install 1295203466
echo " - Numbers"
mas install 409203825
echo " - Pages"
mas install 409201541
echo " - Stuffit Expander"
mas install 919269455
echo " - Xcode"
mas install 497799835
