kindle: run script when wifi on
###############################
:date: 2010-11-28 10:03
:author: john
:category: kindle
:slug: kindle-run-script-when-wifi-on

first you need jailbreak your kindle

then SSH to your Kindle and run: mntroot rw

You can then put your script in /etc/network/if-up.d/ and edit the
/etc/network/interfaces file and add this line at the end of the file
after "iface wlan0 inet dhcp"

::

    post-up /etc/network/if-up.d/YOURSCRIPT.sh

You could probably check the SSID in the script to see if you are
connecting to your university access point, but that's up to you.
