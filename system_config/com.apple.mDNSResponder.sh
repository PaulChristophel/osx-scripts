#!/bin/bash

echo "Disable multicast advertisements and always append search domains."
if [ -f /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist ]; then
    # SIP prevents editing system launch daemons in El Capitan.
    # [https://forums.developer.apple.com/thread/17944#56482]
    if [[ "$(sw_vers -productVersion)" == "10.11"* ]]; then
        cp -fv /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist /Library/Preferences/com.apple.mDNSResponder.plist
        defaults write /Library/Preferences/com.apple.mDNSResponder AlwaysAppendSearchDomains -bool YES
        defaults write /Library/Preferences/com.apple.mDNSResponder ProgramArguments -array-add "-NoMulticastAdvertisements"
    else
        defaults write /System/Library/LaunchDaemons/com.apple.mDNSResponder AlwaysAppendSearchDomains -bool YES
        defaults write /System/Library/LaunchDaemons/com.apple.mDNSResponder ProgramArguments -array-add "-NoMulticastAdvertisements"
        plutil -convert xml1 /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist
    fi
fi

if [ -f /System/Library/LaunchDaemons/com.apple.discoveryd.plist ]; then
    defaults write /System/Library/LaunchDaemons/com.apple.discoveryd ProgramArguments -array-add "--no-multicast"
    plutil -convert xml1 /System/Library/LaunchDaemons/com.apple.discoveryd.plist
fi

