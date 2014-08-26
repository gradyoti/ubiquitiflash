#! /bin/bash

if [ "$(id -u)" != "0" ]; then
	echo -e "Must have root permissions.\nExiting."
	exit 1
fi

if [ ! $1 ]; then
	echo -e "Usage: \nsudo ./ubiquitiflash.sh [IMAGE URI]"
	exit 1
fi

# read in image location
IMAGE=$1

# set eth0 ip
ifconfig eth0 192.168.1.1 

# start pinging 192.168.1.20 until we get a response
	while ! true; do ping -c1 192.168.1.20 > /dev/null && break; done

# once ping is successful, load new image
tftp <<EOF
connect 192.168.1.20
mode binary
trace
verbose
put $IMAGE
quit
EOF


echo -e "
\n\nIMAGE FLASHED

Waiting for DHCP lease...

(This will take a few minutes...)\n\n\n"

sleep 2

echo -e "(Now is a good time to text someone you love.)"

# reset DHCP and wait for node to connect
sudo dhclient eth0

echo -e "\n\nSUCCESS!"
