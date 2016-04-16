#!/bin/bash

defaults write /Library/Preferences/com.apple.AppleShareClient afp_cleartext_allow -bool FALSE
defaults write /Library/Preferences/com.apple.AppleShareClient afp_disabled_uams -array "Cleartxt Passwrd" "MS2.0" "2-Way Randnum exchange" "DHCAST128"
