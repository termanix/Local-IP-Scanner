#!/bin/bash

Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
NC='\033[0m'      	      # Text Reset

if [ "$1" == "" ]
then
	echo -e "${Red}[-]${NC} Wrong syntax!"
	echo -e "${Yellow}[!]${NC} Syntax: ./ipsweep.sh 192.168.1"
else
	echo -e "${Yellow}[!]${NC} Scanning $1 hosts..."
	for ip in `seq 1 254` ; do
		ping -c 1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
	done
	
fi

sleep 0.1
echo -e "${Green}[+]${NC} Done!"
