django 403 error
################
:date: 2011-08-08 11:41
:author: john
:category: Python
:tags: django, python
:slug: django-403-error

遇到一个奇怪的问题，一个很简单的django页面，GET方式可以正常访问但是在POST报403错误。

后来查到是1.3版本settings.py 文件中
'django.middleware.csrf.CsrfViewMiddleware',
造成的，把这句注掉就可以了。
