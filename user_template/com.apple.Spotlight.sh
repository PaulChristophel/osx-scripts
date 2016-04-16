#!/bin/bash

echo "Setting Spotlight defaults:"
function create_user_template () {
    plutil -convert binary1 "$1"
    sudo find "/System/Library/User Template" -name Preferences -exec cp -vf "$1" "{}/$2" \;
    rm "$1"
}

tmpuuid_plist="/tmp/$(uuidgen)"
tmpuuid_path="${tmpuuid_plist}.plist"

echo "Enabling applications"
defaults write "$tmpuuid_plist" orderedItems -array-add '{"enabled" = 1;"name" = "APPLICATIONS";}'
echo "Enabling system preferences"
defaults write "$tmpuuid_plist" orderedItems -array-add '{"enabled" = 1;"name" = "SYSTEM_PREFS";}'
echo "Enabling directories"
defaults write "$tmpuuid_plist" orderedItems -array-add '{"enabled" = 1;"name" = "DIRECTORIES";}'
echo "Enabling PDFs"
defaults write "$tmpuuid_plist" orderedItems -array-add '{"enabled" = 1;"name" = "PDF";}'
echo "Enabling fonts"
defaults write "$tmpuuid_plist" orderedItems -array-add '{"enabled" = 1;"name" = "FONTS";}'
echo "Disabling documents"
defaults write "$tmpuuid_plist" orderedItems -array-add '{"enabled" = 0;"name" = "DOCUMENTS";}'
echo "Disabling messages"
defaults write "$tmpuuid_plist" orderedItems -array-add '{"enabled" = 0;"name" = "MESSAGES";}'
echo "Disabling contacts"
defaults write "$tmpuuid_plist" orderedItems -array-add '{"enabled" = 0;"name" = "CONTACT";}'
echo "Disabling events/reminders"
defaults write "$tmpuuid_plist" orderedItems -array-add '{"enabled" = 0;"name" = "EVENT_TODO";}'
echo "Disabling images"
defaults write "$tmpuuid_plist" orderedItems -array-add '{"enabled" = 0;"name" = "IMAGES";}'
echo "Disabling bookmarks"
defaults write "$tmpuuid_plist" orderedItems -array-add '{"enabled" = 0;"name" = "BOOKMARKS";}'
echo "Disabling music"
defaults write "$tmpuuid_plist" orderedItems -array-add '{"enabled" = 0;"name" = "MUSIC";}'
echo "Disabling movies"
defaults write "$tmpuuid_plist" orderedItems -array-add '{"enabled" = 0;"name" = "MOVIES";}'
echo "Disabling presentations"
defaults write "$tmpuuid_plist" orderedItems -array-add '{"enabled" = 0;"name" = "PRESENTATIONS";}'
echo "Disabling spreadsheets"
defaults write "$tmpuuid_plist" orderedItems -array-add '{"enabled" = 0;"name" = "SPREADSHEETS";}'
echo "Disabling Source code"
defaults write "$tmpuuid_plist" orderedItems -array-add '{"enabled" = 0;"name" = "SOURCE";}'
echo "Disabling dictionary"
defaults write "$tmpuuid_plist" orderedItems -array-add '{"enabled" = 0;"name" = "MENU_DEFINITION";}'
echo "Disabling 'Other'"
defaults write "$tmpuuid_plist" orderedItems -array-add '{"enabled" = 0;"name" = "MENU_OTHER";}'
echo "Disabling Conversion"
defaults write "$tmpuuid_plist" orderedItems -array-add '{"enabled" = 0;"name" = "MENU_CONVERSION";}'
echo "Disabling Expressions"
defaults write "$tmpuuid_plist" orderedItems -array-add '{"enabled" = 0;"name" = "MENU_EXPRESSION";}'
echo "Disabling Bing web search"
defaults write "$tmpuuid_plist" orderedItems -array-add '{"enabled" = 0;"name" = "MENU_WEBSEARCH";}'
echo "Disabling Spotlight suggestions"
defaults write "$tmpuuid_plist" orderedItems -array-add '{"enabled" = 0;"name" = "MENU_SPOTLIGHT_SUGGESTIONS";}'

create_user_template $tmpuuid_path com.apple.Spotlight.plist
