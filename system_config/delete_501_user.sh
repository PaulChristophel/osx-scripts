#!/bin/bash
first_user=$(id -un 501)
if [ -n "$first_user" ]; then
    first_user_shell=$(dscl . read /Users/$first_user UserShell | cut -f2 -d' ')
    first_user_home=$(dscl . read /Users/$first_user NFSHomeDirectory | cut -f2 -d' ')

    pushd "$first_user_home/.."
    tar -czf "/var/backups/$first_user.tar.gz" ./"$(echo $first_user_home | awk -F'/' '{print $NF}')"
    rm -rf "$first_user_home"
    dscl . delete /Users/$first_user
    popd
fi
