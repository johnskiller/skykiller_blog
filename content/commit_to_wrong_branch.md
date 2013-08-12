Title: git commit to wrong branch
Category: git
Tags: git
Date: 2013-08-12

刚才突然发现git commit到一个错误的分支上了，如果还没有push到remote，可以用
	```git reset --soft HEAD^```
将commit回退到commit前的状态，再

	git checkout branch
	git commit

提交到正确分支。

下面是实际执行情况

	(pelican)tpd-yjdell:content john$ git branch
	  blog
	* deploy
	  master
	  test
	  theme
	(pelican)tpd-yjdell:content john$ git reset --soft HEAD^
	(pelican)tpd-yjdell:content john$ git checkout blog
	A	content/EM5vsIPHONE4S.jpg
	A	content/EM5vsIPHONE4S_small.jpg
	A	content/good_enough.md
	Switched to branch 'blog'
	(pelican)tpd-yjdell:content john$ git commit -m'add new blog compare iphone4s vs EM5'
	[blog 00f96c0] add new blog compare iphone4s vs EM5
	 3 files changed, 17 insertions(+), 0 deletions(-)
	 create mode 100644 content/EM5vsIPHONE4S.jpg
	 create mode 100644 content/EM5vsIPHONE4S_small.jpg
	 create mode 100644 content/good_enough.md
	(pelican)tpd-yjdell:content john$ 


