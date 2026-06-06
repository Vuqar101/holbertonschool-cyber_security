#!/bin/bash
sudo [ "$EUID" -ne 0 ] && echo "root required" >&2 && exit 1; nmap -sn "$1" -n -oG - | awk '/Up$/{print $2}'
