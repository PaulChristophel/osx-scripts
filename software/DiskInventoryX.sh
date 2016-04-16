#!/bin/bash
check_root

echo 'Downloading and installing Disk Inventory X'
url="http://www.alice-dsl.net/tjark.derlien/DIX1.0Universal.dmg"
hdiutil attach -nobrowse "$url"

echo 'Installing Disk Inventory X'
find /Volumes/*nventory* -name '*.app' -exec ditto --noqtn '{}' '/Applications/Disk Inventory X.app' \;
chown -R root:wheel '/Applications/Disk Inventory X.app'
touch '/Applications/Disk Inventory X.app'

hdiutil detach /Volumes/*nventory*

exit $?