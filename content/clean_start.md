Title: Clean Start
Category: linux
Tags: linux, debian, security
Date: 2013-06-05

firewall
========

    apt-get update
    apt-get install arno-iptables-firewall

open ports: 80 443 22

fix locale problem
==================

    dpkg-reconfigure locales
    
    or
    
    locale-gen zh_CN.UTF-8
    
add user
========
add an user for everyday use, and add he to `www-data` group for publish

    adduser john
    usermod -a -G www-data john
    
use `id john` to confirm john is in `www-data` group now.

nginx
=====
try something new so no apache but [nginx][1].

dev env
=======

    apt-get install build-essential
    
install gcc, g++, gdb etc.

pptp
====
install pptp vpn and setup firewall to allow pptp traffic， please refer [this site][1] for detail

    apt-get install pptp
    
modify `/etc/pptp.conf`:
    
    localip 192.168.1.1
    remoteip 192.168.1.232-238

and `/etc/ppp/pptp-option`:

    ms-dns 8.8.8.8  # setup dns for ms client
    #proxyarp       # turn off arp proxy
    
modify `/etc/arno-iptables-firewall/conf.d/00debian.conf`

    OPEN_TCP="80 22 1723"   # add pptp port as well as others
    INTERNAL_NET="192.168.1.232/29"  
    INT_IF="ppp+"
    
  



    
[1]: http://www.nginx.com/ "nginx"
[2]: http://sysadmin.compxtreme.ro/how-to-install-a-pptp-server-on-debian-squeeze/