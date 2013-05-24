#!/usr/bin/env python
import sys
reload(sys)
sys.setdefaultencoding('utf-8')

from bs4 import BeautifulSoup

def load_file(filename):
	f = open(filename)
	txt = ''.join(f.readlines())
	f.close()
	return txt

def make_date(date):
	return ('%s-%s-%s %s:%s'%(date[0:4],date[4:6],date[6:8],date[8:10],date[10:12]))

def do_dump():
	count = 0;
	soup = BeautifulSoup(load_file('entry.xml'))
	for e in soup.find_all('entry'):
		if count > 10: return
		count = count + 1
		f = open('output/'+e.title.text+'.md','w')
		f.write('Title: %s'%e.title.text)
		f.write('\nDate: %s'%make_date(e.created_on.text))
		f.write('\n\n')
		f.write(e.find('text').text)
		f.close()
		print e.title, e.created_on
		print e.find('text').contents


if __name__ == '__main__':
	do_dump()
