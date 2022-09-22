#!/bin/bash
HOST=$(uname -n)

# Get OS information
cat /proc/version > ./$HOST.System.txt

# Get Env variables
cat /etc/profile > ./$HOST.Env.txt
cat /etc/bashrc >> ./$HOST.Env.txt
cat ~/.bash_profile >> ./$HOST.Env.txt
cat ~/.bashrc >> ./$HOST.Env.txt

# Get service information
systemctl list-units --type=service > ./$HOST.Services.txt

# Get processes running as root
ps aux | grep root > ./$HOST.RunningRootProcesses.txt

# Get process list
ps -aux > ./$HOST.Processes.txt

# Get listening ports
netstat -l > ./$HOST.ListeningPorts.txt

# Get installed applications
dpkg-query -l > ./$HOST.InstalledApplications.txt
