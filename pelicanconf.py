#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

AUTHOR = u'John Skiller'
SITENAME = u"John's Silly Ideas"
SITEURL = ''

TIMEZONE = 'Asia/Shanghai'

DEFAULT_LANG = u'zh'
DEFAULT_DATE_FORMAT = '%Y-%m-%d'

DATE_FORMATS = {
    'en': ('en_US','%a, %d %b %Y'),
    'jp': ('ja_JP','%Y-%m-%d(%a)'),
    'cn': ('zh_CN','%Y-%m-%d(%a)'),
}
LOCALE = ('zh_CN',)

THEME = 'bootstrap3'

# urls
ARTICLE_URL = '{date:%Y}/{date:%m}/{date:%d}/{slug}.html'
ARTICLE_SAVE_AS = '{date:%Y}/{date:%m}/{date:%d}/{slug}.html'
YEAR_ARCHIVE_SAVE_AS = '{date:%Y}/index.html'
MONTH_ARCHIVE_SAVE_AS = '{date:%Y}/{date:%m}/index.html'

# Feed generation is usually not desired when developing
FEED_ALL_ATOM = None
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None

# Blogroll
LINKS =  (('Pelican', 'http://getpelican.com/'),
          ('Python.org', 'http://python.org/'),
          ('Jinja2', 'http://jinja.pocoo.org/'),
          )

# Social widget
SOCIAL = (('twitter', 'http://twitter.com/johnskiller'),)

DEFAULT_PAGINATION = 5
DISPLAY_PAGES_ON_MENU = True
DISPLAY_CATEGORIES_ON_MENU = False


# Uncomment following line if you want document-relative URLs when developing
#RELATIVE_URLS = True
