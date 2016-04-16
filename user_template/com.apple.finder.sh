#!/bin/bash

function create_user_template () {
    plutil -convert binary1 "$1"
    sudo find "/System/Library/User Template" -name Preferences -exec cp -vf "$1" "{}/$2" \;
    rm "$1"
}

tmpuuid_plist="/tmp/$(uuidgen)"
tmpuuid_path="${tmpuuid_plist}.plist"

echo "Show external hard drives on desktop"
defaults write $tmpuuid_plist ShowExternalHardDrivesOnDesktop -bool true

echo "Show hard drives on desktop"
defaults write $tmpuuid_plist ShowHardDrivesOnDesktop -bool true

echo "Show mounted servers on desktop"
defaults write $tmpuuid_plist ShowMountedServersOnDesktop -bool true

echo "Show removable media on desktop"
defaults write $tmpuuid_plist ShowRemovableMediaOnDesktop -bool true

echo "Show status bar by default"
defaults write $tmpuuid_plist ShowStatusBar -bool true

echo "Show full POSIX path in window title"
defaults write $tmpuuid_plist _FXShowPosixPathInTitle -bool true

echo "When searching, search the current folder by default"
defaults write $tmpuuid_plist FXDefaultSearchScope -string "SCcf"

echo "Use list view in all Finder windows by default"
defaults write $tmpuuid_plist FXPreferredViewStyle -string "Nlsv"

create_user_template $tmpuuid_path com.apple.finder.plist
