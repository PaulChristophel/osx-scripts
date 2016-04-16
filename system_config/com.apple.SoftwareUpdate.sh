#!/usr/bin/env python

import os, plistlib, subprocess, sys

commerce_plist_path = '/Library/Preferences/com.apple.commerce.plist'
softwareupdate_plist_path = '/Library/Preferences/com.apple.SoftwareUpdate.plist'
reschedule_updates = False

if not os.path.exists(commerce_plist_path):
    sys.exit(0)

def plist_to_xml(path):
    subprocess.call(['plutil', '-convert', 'xml1', path])

def plist_to_binary(path):
    subprocess.call(['plutil', '-convert', 'binary1', path])

def reenable_updates():
    subprocess.call(['softwareupdate', '--schedule', 'on'])

plist_to_xml(commerce_plist_path)
plist_to_xml(softwareupdate_plist_path)
commerce_plist =  plistlib.readPlist(commerce_plist_path)
softwareupdate_plist = plistlib.readPlist(softwareupdate_plist_path)

# Update Commerce plist
if hasattr(commerce_plist, 'AutoUpdate'):
    if not commerce_plist['AutoUpdate']:
        commerce_plist['AutoUpdate'] = True
        reschedule_updates = True
else:
    commerce_plist['AutoUpdate'] = True
    reschedule_updates = True

if hasattr(commerce_plist, 'AutoUpdateRestartRequired'):
    if not commerce_plist['AutoUpdateRestartRequired']:
        commerce_plist['AutoUpdateRestartRequired'] = True
        reschedule_updates = True
else:
    commerce_plist['AutoUpdateRestartRequired'] = True
    reschedule_updates = True

# Update SoftwareUpdate plist
if hasattr(softwareupdate_plist, 'AutomaticCheckEnabled'):
    if not softwareupdate_plist['AutomaticCheckEnabled']:
        softwareupdate_plist['AutomaticCheckEnabled'] = True
        reschedule_updates = True
else:
    softwareupdate_plist['AutomaticCheckEnabled'] = True
    reschedule_updates = True

if hasattr(softwareupdate_plist, 'AutomaticDownload'):
    if not softwareupdate_plist['AutomaticDownload']:
        softwareupdate_plist['AutomaticDownload'] = True
        reschedule_updates = True
else:
    softwareupdate_plist['AutomaticDownload'] = True
    reschedule_updates = True

if hasattr(softwareupdate_plist, 'ConfigDataInstall'):
    if not softwareupdate_plist['ConfigDataInstall']:
        softwareupdate_plist['ConfigDataInstall'] = True
        reschedule_updates = True
else:
    softwareupdate_plist['ConfigDataInstall'] = True
    reschedule_updates = True

if hasattr(softwareupdate_plist, 'CriticalUpdateInstall'):
    if not softwareupdate_plist['CriticalUpdateInstall']:
        softwareupdate_plist['CriticalUpdateInstall'] = True
        reschedule_updates = True
else:
    softwareupdate_plist['CriticalUpdateInstall'] = True
    reschedule_updates = True

if hasattr(softwareupdate_plist, 'ScheduleFrequency'):
    if softwareupdate_plist['ScheduleFrequency'] > 1:
        softwareupdate_plist['ScheduleFrequency'] = 1
        reschedule_updates = True;
else:
    softwareupdate_plist['ScheduleFrequency'] = 1
    reschedule_updates = True;

# Update plists 
plistlib.writePlist(commerce_plist, commerce_plist_path)
plistlib.writePlist(softwareupdate_plist, softwareupdate_plist_path)

# Convert plists to binary
plist_to_binary(commerce_plist_path)
plist_to_binary(softwareupdate_plist_path)

# Reschedule Updates as needed
if reschedule_updates:
    reenable_updates()
