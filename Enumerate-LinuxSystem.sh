#!/bin/bash
HOST=$(uname -n)

# Get OS information
cat /proc/version >> ./$HOST.System.txt

# Get service information
systemctl list-units --type=service > ./$HOST.Services.txt

# Get process list
ps -aux > ./$HOST.Processes.txt

# Get listening ports
netstat -l > ./$HOST.ListeningPorts.txt

# Get installed applications
dpkg-query -l > ./$HOST.InstalledApplications.txt
