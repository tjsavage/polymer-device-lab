#!/bin/bash
# client.sh - Starts the MMDL Client

echo Starting Mini Mobile Device Lab Client in 5 seconds...

current_commit=$(git rev-list HEAD --max-count=1 | cut -c1-7)
echo ""
echo Current commit ${current_commit}
echo "${current_commit}" > version.txt

cd PiLab

echo ""
echo Starting ADB Server with sudo
sudo adb start-server

echo ""
echo Installing and updating node modules
npm install

echo ""
echo Starting MMDL Client
OUTPUT=$(node client.js 2>&1 >/dev/tty)
echo "${OUTPUT}"
date >> last_failure.txt
echo "" >> last_failure.txt
echo "${OUTPUT}" >> last_failure.txt
echo "" >> last_failure.txt
echo "" >> last_failure.txt
echo "-----" >> last_failure.txt
echo "" >> last_failure.txt

echo ""
echo Rebooting in 30 seconds...
sleep 30
sudo reboot
