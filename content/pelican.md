Title: Install Pelican
Category: Python
Tags: pelican, python, blog
Date: 2013-06-03

安装Pelican很简单，基本上按照网站照做就好了

安装虚拟环境
==========
安装python虚拟环境的目的是不要搞乱系统的python环境。

安装了virtualenv之后，用下列命令创建一个pelican的环境并且激活

```
cd ~
virtualenv pelican
cd palican
. bin/activate
```

安装pelican
===========
``` pip install pelican``` 就搞定了 

写博客啦
=======
正常情况需要建立一个新的blog，并且开始写作。如果是从头开始写博客，可以用```pelican-quickstart```命令建立blog环境。不过我已经做过这一步骤，并且把博客内容保存到github，那么就可以从github取回我的内容了
```git clone https://github.com/myname/myblog.git newblog```

发布
====
写blog，可以用Markdown或者reStructed等格式，写完之后需要发布。也很简单，用```make html```命令可以生成整个网站的html文件，拷贝到www服务器相应目录就好了。

