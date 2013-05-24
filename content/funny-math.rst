趣味数学题
###########
:date: 2012-06-14 02:34
:author: john
:category: misc
:tags: Python
:slug: funny-math

幸运的饭桶发布了一道小学2年级女儿的数学题：有4个算盘珠子，能够在算盘上组成几个3位数？一帮人热烈讨论。我晚上一边游泳一边不停的心算，得出来49。出来后在iphone上整理思路发现漏了一个400，答案应该是50。

可是这个50到底对不对，作为程序员自然想法是编程验算一下，于是晚上看球的时候，拿出ipad，装了个python，很快写出了下面的程序：

::

    def spn(n):
        h = n / 100
        t = (n - h * 100)/10
        s = n - h *100 - t*10
        return [h,t,s]
    def sum(list):
        s=0
        for i in list:
            s+=i
        return s
    def ck(n):
        return sum([d[x] for x in spn(n)])
    d ={1:1,2:2,3:3,4:4,5:1,6:2,7:3,8:4,9:5,0:0}

    r=[x for x in range(100,801) if ck(x)==4]
    print r
    print "resulr ",len(r)

运行结果，证明我的答案50是正确的，可是这段代码不够漂亮，google一下，发现我写的sum函数系统已经有了，把一个数字拆开的函数spn也有更好的方法：用str变成字符串，再当作list处理。

.. raw:: html

   <p>

::

    def ck(n):
        return sum( [d[int(x)] for x in str(n)] )

    d=[0,1,2,3,4,1,2,3,4,5]

    r=[i for i in range(100,801) if ck(i)==4]
    print r
    print "result ",len(r)

运行结果如下

::

    Johns-Air:Helper(master) john$ python /tmp/p.py
    [103, 107, 112, 116, 121, 125, 130, 152, 156, 161, 165, 170, 202, 206, 211, 215, 220, 251, 255, 260, 301, 305, 310, 350, 400, 503, 507, 512, 516, 521, 525, 530, 552, 556, 561, 565, 570, 602, 606, 611, 615, 620, 651, 655, 660, 701, 705, 710, 750, 800]
    result  50

思路很简单，就是算100到801每个数字需要几个珠子，等于四就记下来。
