#!/bin/bash

echo "Disable saving documents to iCloud by default"
find "/System/Library/User Template" -name .GlobalPreferences.plist -exec defaults write "{}" NSDocumentSaveNewDocumentsToCloud -bool false \;

echo "Disable natural scrolling"
find "/System/Library/User Template" -name .GlobalPreferences.plist -exec defaults write "{}" com.apple.swipescrolldirection -bool false \;

echo "Disable automatic spell check"
find "/System/Library/User Template" -name .GlobalPreferences.plist -exec defaults write "{}" NSAutomaticSpellingCorrectionEnabled -bool false \;

echo "Disable automatic quote substitution"
find "/System/Library/User Template" -name .GlobalPreferences.plist -exec defaults write "{}" NSAutomaticQuoteSubstitutionEnabled -bool false \;

echo "Disable automatic dash substitution"
find "/System/Library/User Template" -name .GlobalPreferences.plist -exec defaults write "{}" NSAutomaticDashSubstitutionEnabled -bool false \;

echo "Expand the save window by default"
defaults write -g NSNavPanelExpandedStateForSaveMode -boolean true
