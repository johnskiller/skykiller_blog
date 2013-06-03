Title: Install Pelican
Category: Python
Tags: pelican, python, blog
Date: 2013-06-03

安装Pelican很简单，基本上按照网站照做就好了

安装虚拟环境
==========
安装python虚拟环境的目的是不要搞乱系统的python环境。

安装了virtualenv之后，用下列命令创建一个pelican的环境并且激活


	$ cd ~
	$ virtualenv pelican
	$ cd palican
	$ . bin/activate

安装pelican
===========
``` pip install pelican markdown``` 就搞定了 

写博客啦
=======
正常情况需要建立一个新的blog，并且开始写作。如果是从头开始写博客，可以用```pelican-quickstart```命令建立blog环境。不过我已经做过这一步骤，并且把博客内容保存到github，那么就可以从github取回我的内容了
```git clone https://github.com/myname/myblog.git newblog```

发布
====
写blog，可以用Markdown或者reStructed等格式，写完之后需要发布。也很简单，用```make html```命令可以生成整个网站的html文件，拷贝到www服务器相应目录就好了。

自动发布
========
自动发布的前提条件是有直接访问git server的能力。我在做网站的主机上建了一个git server，这样本机写好blog，push到remote，触发如下post trigger

	#!/bin/sh

	HOME=/home/yj
	TMP=$HOME/tmp/blog
	OUT=$HOME/html/blog
	PELICAN=$HOME/bin/pelican
	
	echo "Checking-out working copy"
	rm -rf $TMP
	mkdir -p $TMP
	mkdir -p $OUT
	GIT_WORK_TREE=$TMP git checkout -f
	
	source ~/pelican/bin/activate
	echo "Generating blog"
	$PELICAN -o $OUT -s $TMP/pelicanconf.py $TMP
	rm -rf $TMP
	
	echo "Done"
