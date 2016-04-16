#!/bin/bash

echo "Disabling crash reporting."

# Hide the diagnostics login window.
cr_path="/Library/Application Support/CrashReporter"
diag_msg_hist="$cr_path/DiagnosticMessagesHistory"
if [ ! -d "${cr_path}" ]; then
    mkdir -p -m 775 "${cr_path}"
    chown root:admin "${cr_path}"
fi

defaults write "$diag_msg_hist" AutoSubmit -boolean FALSE
defaults write "$diag_msg_hist" AutoSubmitVersion -int 4
defaults write "$diag_msg_hist" ThirdPartyDataSubmit -boolean FALSE
defaults write "$diag_msg_hist" ThirdPartyDataSubmitVersion -int 4
chmod 664 "${diag_msg_hist}.plist"
chown root:admin "${diag_msg_hist}.plist"

exit 0
