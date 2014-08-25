ubiquitiflash
=============

A little bash script to automate flashing Ubiquiti routers

#USAGE:#
sudo ./flashy.sh [IMAGE URI]

NOTE that you must run as root, since this script requires setting network options

#INSTRUCTIONS:#
Connect over ethernet to the router. 

Put the router in TFTP mode. Instructions can be found here: https://commotionwireless.net/docs/cck/installing-configuring/install-and-recover-tftp/. 

You do not need to manually set your IP address at any point.

Once in TFTP mode, run the script, passing in the location of the new firmware image as the first argument. 

The image will be loaded onto the router, which will then reboot. When it reboots, it will hand your computer a DHCP lease (this will take a few minutes -- it is strongly recommended that you take this opportunity to text someone you love).

When you see "SUCCESS", you should be able to connect to the router over ethernet.

For more information, check out:
https://commotionwireless.net/
