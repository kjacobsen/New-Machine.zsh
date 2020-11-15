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

brews=(
    'azure-cli'
    'gitversion'
    'hugo'
    'mas'
)

for brew in $brews; do
    brew install $brew
done


echo
echo "Installing casks:"

casks=(
    'adobe-creative-cloud'
    'azure-data-studio'
    'backblaze'
    'balenaetcher'
    'bitwarden'
    'brave-browser'
    'cisco-proximity'
    'discord'
    'docker'
    'elmedia-player'
    'gitkraken'
    'homebrew/cask-drivers/qmk-toolbox'
    'istat-menus'
    'iterm2'
    'kodi'
    'lastpass'
    'microsoft-azure-storage-explorer'
    'microsoft-office'
    'minecraft'
    'parallels'
    'postman'
    'powershell'
    'raspberry-pi-imager'
    'sdformatter'
    'steam'
    'telegram'
    'visual-studio-code'
)

for cask in $casks; do
    brew install --cask $cask
done


echo
echo "Tapping Cask Versions"
brew tap homebrew/cask-versions
echo "Installing Powershell Preview"
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

declare -A apps
apps=(
    [Amphetamine]=937984704
    [Commander-Pro]=1035237815
    [Keynote]=409183694
    [LastPass]=926036361
    [Magnet]=441258766
    [Microsoft-RDP]=1295203466
    [Numbers]=409203825
    [Pages]=409201541
    [Stuffit-Expander]=919269455
    [Xcode]=497799835
)

for name id in ${(kv)apps}; do
    echo " - $name"
    mas install $id
done