Create an Android App: Step 1
#############################
:date: 2010-11-11 21:27
:author: john
:category: android
:tags: android, development, eclipse,Java
:slug: create-an-android-app-step-1

开发Android
app的第一步，当然是建立开发环境。这里简单记录一下windows环境下面的设定方法。

第一步，当然是安装eclipse，就用最新版Galileo好了，当然为了eclipse能运行起来，jdk是少不了的，先安装\ [STRIKEOUT:sun]\ Oracle的jdk6.

第二步就是安装android sdk,可以从\ `android开发网站`_
(可能要翻墙,没天理啊)下载.
注意下载下来的只是一个23M的安装文件,实际上还要根据开发目标(比如2.2froyo)继续下载其他东西,一共有几百兆,考验带宽啊.

第三步就是安装ADT(Android Development
Tools),一个eclipse的插件,可以编译并且运行android程序,
在eclipse里面指明remote update
server为\ https://dl-ssl.google.com/android/eclipse/\ 就可以了.

最后，在eclipse的设置里面，指定一下第一步android
sdk的安装路径，就可以了。

恭喜，一个完整的android
开发调试环境准备好了，下一步需要一个好的idea，快动手吧，伟大的android
app正等着你去实现呢。

.. _android开发网站: http://developer.android.com/sdk/index.html
