#!/bin/bash

hdiutil attach -nobrowse https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg
ditto --noqtn '/Volumes/Google Chrome/Google Chrome.app' '/Applications/Google Chrome.app'
chown -R root:wheel '/Applications/Google Chrome.app'
chmod 755 '/Applications/Google Chrome.app'
hdiutil detach -force '/Volumes/Google Chrome'
