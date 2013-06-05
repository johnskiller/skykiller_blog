Title: Install Pelican
Category: Python
Tags: pelican, python, blog
Date: 2013-06-03

安装Pelican很简单，基本上按照网站照做就好了

安装虚拟环境
==========
安装python虚拟环境的目的是不要搞乱系统的python环境。

推荐用pip安装virtualenv

    pip install virtualenv

如果没有pip，只好从source安装了

    curl -O https://pypi.python.org/packages/source/v/virtualenv/virtualenv-1.9.1.tar.gz
    tar xvfz virtualenv-1.9.1.tar.gz
    cd virtualenv-1.9.1
    python setup.py install
    
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
写blog，可以用Markdown或者reStructedtext等格式，直接用文本编辑器编写。Sublime或者Mou等编辑器可以预览Markdown格式。写完之后需要发布。也很简单，用```make html```命令可以生成整个网站的html文件，拷贝到www服务器相应目录就好了。

自动发布
========
自动发布的前提条件是有直接访问git server的能力。我在做网站的主机上建了一个git server，这样本机写好blog，push到remote，触发post trigger, `myblog.git/hooks/post-recieve`内容如下

```
#! /bin/bash
#
# handle updates to our two interesting branches, staging and master.

# function to dump given commit state to target directory
# arguments: $1 - rev; $2 - target dir
copy_to_dir() {
    HOME=/home/yj
    TMP=$HOME/tmp/blog
    echo "checking-out working copy"
    rm -rf $TMP
    mkdir -p $TMP
    
    GIT_WORK_TREE="$TMP" git checkout -f "$1"
    echo " GIT_WORK_TREE=$TMP git checkout -q -f $1"
    #GIT_WORK_TREE="$TMP" git checkout -q -f "$1"
. ~/pelican/bin/activate
    echo "Generating blog"
    cd $TMP
    make publish
    cp -r output/* /var/www/skykiller.com
    echo "Done"
}

# function to handle an update to staging branch.
# arguments: $1 - rev to check out
update_deploy() {
    copy_to_dir $1 /path/to/staging/site/webroot
}

# function to handle an update to master branch.
update_test() {
    copy_to_dir $1 /var/www
}

# function to handle one reference-change.
# arguments:
#    $1 - old revision, or all-0s on create
#    $2 - new revision, or all-0s on removal
#    $3 - reference (refs/heads/*, refs/tags/*, etc)
refchange() {
    local oldrev="$1" newrev="$2" ref="$3"
    local deleted=false
    local short_revname

    echo "enter refchange(), args=$oldrev, $newrev, $ref"

    if expr "$newrev" : '0*$' >/dev/null; then
        deleted=true
    elif ! git rev-parse "$newrev"; then
        return # git rev-parse already printed an error
    fi

    case $ref in
    refs/heads/deploy|refs/heads/test)
        shortref=${refname#refs/heads/};;
    *)
        return;;
    esac

    # someone pushed a change to staging branch or master branch
    if $deleted; then {
        echo "WARNING: you've deleted branch $shortref"
        echo "are you sure you wanted to do that?"
        echo "The operating copy is still operating, and"
        echo "will be updated when the branch is re-created."
        } 1>&2
        return
    fi

    # update either the staging copy or the master copy
    update_$shortref "$newrev"
}

# main driver: update from input stream (if no arguments) or use arguments
case $# in
3)  refchange "$1" "$2" "$3";;
0)  while read oldrev newrev refname; do
        refchange $oldrev $newrev $refname
    done;;
*)  echo "ERROR: update hook called with $# arguments, expected 0 or 3" 1>&2;;
esac
```