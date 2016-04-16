#!/bin/bash

function create_user_template () {
    plutil -convert binary1 "$1"
    sudo find "/System/Library/User Template" -name Preferences -exec cp -vf "$1" "{}/$2" \;
    rm "$1"
}

icloud_plist_path="/tmp/$(uuidgen)"
echo "Disabling iCloud prompt on login"
defaults write "$icloud_plist_path" DidSeeCloudSetup -bool TRUE
defaults write "$icloud_plist_path" DidSeeSyncSetup -bool TRUE
defaults write "$icloud_plist_path" DidSeeSyncSetup2 -bool TRUE
defaults write "$icloud_plist_path" GestureMovieSeen none
defaults write "$icloud_plist_path" LastSeenCloudProductVersion "$(sw_vers -productVersion)"
defaults write "$icloud_plist_path" LastSeenBuddyBuildVersion "$(sw_vers -buildVersion)"
defaults write "$icloud_plist_path" ShowKeychainSyncBuddyAtLogin -bool FALSE

create_user_template "${icloud_plist_path}.plist" com.apple.SetupAssistant.plist

exit 0
