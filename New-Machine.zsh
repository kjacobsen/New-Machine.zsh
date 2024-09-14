#!/bin/zsh

if $(fdesetup isactive); then
    echo "KeyVault is active."
else
    echo "Enabling KeyVault."
    fdesetup enable
fi


if (( $+commands[brew] )); then
    echo "Homebrew already installed."
else
    echo "Installing Homebrew."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [ -f ~/Brewfile ]; then
    echo "Brewfile already exists. Renaming Brewfile.old. If you have been making changes to the Brewfile, please handle this yourself."
    mv -f Brewfile Brewfile.old
fi

echo "Downloading Brewfile to home directory"
curl https://raw.githubusercontent.com/kjacobsen/New-Machine.zsh/main/Brewfile -o ~/Brewfile

brew bundle --cleanup


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
echo "Making Powershell the login shell."
chsh -s /usr/local/bin/pwsh
/usr/local/bin/pwsh -C "touch \$PROFILE.CurrentUserAllHosts; Add-Content -Path \$PROFILE.CurrentUserAllHosts -Value '$($HOMEBREW_PREFIX/bin/brew shellenv) | Invoke-Expression'"


echo
echo "Setting up Dock:"
echo "Removing apps:"

apps=(
    'Mail'
    'FaceTime'
    'Maps'
    'Photos'
    'Contacts'
    'Calendar'
    'Reminders'
    'Notes'
    'Podcasts'
    'TV'
    'News'
    'Numbers'
    'Keynote'
    'Pages'
    'App Store'
    'System Preferences'
)

for app in $apps; do
    echo " - $app"
    exists=$(dockutil --find $app)
    if [[ $exists =~ 'was found' ]]; then
        dockutil --remove $app --no-restart
    fi
done


echo "Adding apps:"
apps=(
    'Edge'
    'Microsoft Outlook'
    'Slack'
    'Telegram'
    'Bitwarden'
    'Visual Studio Code'
    'GitKraken'
    'iTerm'
)

for app in $apps; do
    echo " - $app"
    exists=$(dockutil --find $app)
    if [[ $exists =~ 'was not found' ]]; then
        dockutil --add "/Applications/$app.app" --position end --no-restart
    fi
done

echo "Restarting Dock."
killall Dock
