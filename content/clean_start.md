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
try something new so no apache but []nginx][1].

dev env
=======

    apt-get install build-essential
    
install gcc, g++, gdb etc.


    
[1]: http://www.nginx.com/ "nginx"