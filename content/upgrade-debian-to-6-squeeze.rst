upgrade debian to 6.0 (Squeeze)
###############################
:date: 2013-04-15 14:32
:author: john
:category: linux
:tags: linux, debian, linode
:slug: upgrade-debian-to-6-squeeze

`linode`_\ 上的\ `debian`_\ 一直跑的是5.0
lenny，想做一次\ ``apt-get update``\ 居然失败，连续换了几个repo都不行，仔细检查，原来2009年发布的lenny已经处于unsupport状态了，一般的repo里面都已经不再有lenny，而需要要archive.debian.org的repo。

改好source.list，想着干脆升级到debian
6（squeeze）算了，于是按照通常思路，\ ``apt-get update; apt-get upgrade; apt-get dist-upgrade``
期间遇到一个package依赖不对，干脆删除，升级完成后，修改source.list指向
squeeze，重新更新，悲剧了，网络不通，仔细调查，发现是ipv6好好的，ipv4不行，需要手工配置，折腾几下没弄好，干脆恢复升级前的snapshot\ **（备份备份，对系统做重大改变之前一定要备份啊！）**
， 按照linode\ `文档里面的方法`_\ ，基本上就是：

先把source.list改成下面的

.. raw:: html

   <p>

::

    # main repo
    deb http://ftp.debian.org/debian/ squeeze main
    deb-src http://ftp.debian.org/debian/ squeeze main
    deb http://security.debian.org/ squeeze/updates main
    deb-src http://security.debian.org/ squeeze/updates main

在做\ ``apt-get update; apt-get dist-upgrade``\ 就搞定了。

奇怪的是升级完成后，没有装mysql，wordpress自然也无法启动，手动装一下就好。

.. _linode: http://www.linode.com
.. _debian: http://www.debian.org
.. _文档里面的方法: http://library.linode.com/upgrading/upgrade-to-debian-6-squeeze
