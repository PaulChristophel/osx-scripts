#!/bin/bash
first_user=$(id -un 501)
if [ -n "$first_user" ]; then
    first_user_shell=$(dscl . read /Users/$first_user UserShell | cut -f2 -d' ')
    first_user_home=$(dscl . read /Users/$first_user NFSHomeDirectory | cut -f2 -d' ')

    dseditgroup -o edit -t user admin -d "$first_user"
    chsh -s /usr/bin/false "$first_user"
    pwpolicy disableuser -u "$first_user"
    pushd "$first_user_home/.."
    tar -czf "/var/backups/$first_user.tar.gz" ./"$(echo $first_user_home | awk -F'/' '{print $NF}')"
    rm -rf "$first_user_home"
    popd
fi
