#!/bin/bash

echo "Cleaning ${mounted_volume}/var/log"
find /var/log -name  "*.gz"-depth -exec rm '{}' \;
find /var/log -name  "*.bz2"   -depth -exec rm '{}' \;
find /var/log -iname "*.log.[0-9]" -depth -exec rm '{}' \;
find /var/log -type f  -depth -exec cp /dev/null '{}' \;

echo "Cleaning ${mounted_volume}/Library/Logs"
find /Library/Logs -name  "*.gz"-depth -exec rm '{}' \;
find /Library/Logs -name  "*.bz2"   -depth -exec rm '{}' \;
find /Library/Logs -iname "*.log.[0-9]" -depth -exec rm '{}' \;
find /Library/Logs -type f  -depth -exec cp /dev/null '{}' \;

echo "Cleaning ~/Library/Logs for all users on volume."
ls -1 /Users | grep -v -e Shared -e .localized | xargs -I user find /Users/user/Library/Logs -name  "*.gz"-depth -exec rm '{}' \;
ls -1 /Users | grep -v -e Shared -e .localized | xargs -I user find /Users/user/Library/Logs -name  "*.bz2"   -depth -exec rm '{}' \;
ls -1 /Users | grep -v -e Shared -e .localized | xargs -I user find /Users/user/Library/Logs -iname "*.log.[0-9]" -depth -exec rm '{}' \;
ls -1 /Users | grep -v -e Shared -e .localized | xargs -I user find /Users/user/Library/Logs -type f  -depth -exec cp /dev/null '{}' \;

