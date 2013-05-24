FUSE for OS X
#############
:date: 2012-11-05 17:06
:author: john
:category: apple
:tags: filesystem, fuse, osx
:slug: fuse-for-os-x

sublime text 2
有个很方便的plugin，可以用sftp直接编辑remote的文件，可是这个plugin是收费的，而且界面也不够友好。想到可以用FUSE把remote的文件系统mount到本地，于是查找macfuse，才发现这个项目已经停止了，后继者是\ `FUSE
for OS X`_

直接下载两个package，安装。然后用

``sshfs john@remote_host:/mydir ~/sshfs/ -ocache=no -onolocalcaches -ovolname=ssh``

命令mount remote的文件系统，卸载就直接用\ ``umount ~/sshfs``\ 就可以了

.. _FUSE for OS X: http://osxfuse.github.com/
