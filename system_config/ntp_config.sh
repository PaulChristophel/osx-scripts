#!/bin/bash

echo "Setting time zone to America/Chicago."
systemsetup -settimezone "America/Chicago"

systemsetup setusingnetworktime Off

echo "Setting NTP servers:"
tee /etc/ntp.conf <<EOF
server 0.north-america.pool.ntp.org
server 1.north-america.pool.ntp.org
server 2.north-america.pool.ntp.org
server 3.north-america.pool.ntp.org

EOF

sleep 2
echo "Synchronizing time."
systemsetup setusingnetworktime On
sleep 2
ntpdc -p

