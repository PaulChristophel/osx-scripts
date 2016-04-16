#!/bin/bash

function create_user_template () {
    plutil -convert binary1 "$1"
    sudo find "/System/Library/User Template" -name Preferences -exec cp -vf "$1" "{}/$2" \;
    rm "$1"
}

tmpuuid_plist="/tmp/$(uuidgen)"
tmpuuid_path="${tmpuuid_plist}.plist"

# Website use of location services:
# 0: Deny without prompting
# 1: Prompt for each website once each day
# 2: Prompt for each website one time only
echo "Deny websites location information."
defaults write $tmpuuid_plist SafariGeolocationPermissionPolicy -int 0
# Setup new window and tab behvior
# 0: Homepage
# 1: Empty Page
# 2: Same Page
# 3: Bookmarks
# 4: Top Sites
echo "Setting new tab/window behavior."
defaults write $tmpuuid_plist NewTabBehavior -int 1
defaults write $tmpuuid_plist NewWindowBehavior -int 0
# Reading list
echo "Disable reading lists"
defaults write $tmpuuid_plist com.apple.Safari.ReadingListFetcher.WebKit2PluginsEnabled -bool false
defaults write $tmpuuid_plist com.apple.Safari.ReadingListFetcher.WebKit2LoadsImagesAutomatically -bool false
defaults write $tmpuuid_plist com.apple.Safari.ReadingListFetcher.WebKit2LoadsSiteIconsIgnoringImageLoadingPreference -bool true
defaults write $tmpuuid_plist com.apple.Safari.ReadingListFetcher.WebKit2JavaScriptEnabled -bool false

echo "Set the default homepage to https://google.com/"
defaults write $tmpuuid_plist HomePage "https://google.com/"
echo "Show the full url in the address bar"
defaults write $tmpuuid_plist ShowFullURLInSmartSearchField -bool true
echo "Do not automatically open 'safe' downloads"
defaults write $tmpuuid_plist AutoOpenSafeDownloads -bool false
echo "Send 'DoNotTrack' in HTTP header"
defaults write $tmpuuid_plist SendDoNotTrackHTTPHeader -bool true
echo "Warn about fraudulent webistes"
defaults write $tmpuuid_plist WarnAboutFraudulentWebsites -bool true
echo "Don't restore the last session on launch"
defaults write $tmpuuid_plist AlwaysRestoreSessionAtLaunch -bool false
echo "Show the status bar"
defaults write $tmpuuid_plist ShowStatusBar -bool true
echo "Set the history to 30 days"
defaults write $tmpuuid_plist HistoryAgeInDaysLimit -int 30
echo "Include the developer menu"
defaults write $tmpuuid_plist IncludeDevelopMenu -bool true
echo "Enable the Web Inspector"
defaults write $tmpuuid_plist WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write $tmpuuid_plist com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
echo "Don't offer to setup email for google.com"
defaults write $tmpuuid_plist DomainsToNeverSetUp -array-add "google.com"
echo "Don't offer to setup email for gmail.com"
defaults write $tmpuuid_plist DomainsToNeverSetUp -array-add "gmail.com"
echo "Don't offer to setup email for inbox.google.com"
defaults write $tmpuuid_plist DomainsToNeverSetUp -array-add "inbox.google.com"
echo "Don't offer to setup email for yahoo.com"
defaults write $tmpuuid_plist DomainsToNeverSetUp -array-add "yahoo.com"
echo "Don't offer to setup email for apple.com"
defaults write $tmpuuid_plist DomainsToNeverSetUp -array-add "apple.com"
echo "Don't offer to setup email for icloud.com"
defaults write $tmpuuid_plist DomainsToNeverSetUp -array-add "icloud.com"
echo "Don't offer to setup email for me.com"
defaults write $tmpuuid_plist DomainsToNeverSetUp -array-add "me.com"

create_user_template $tmpuuid_path com.apple.Safari.plist
