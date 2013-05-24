#!/usr/bin/env python

import pybsddb

db = pybsddb.btopen('entry.db')

for k,v in db.iteritems():
	print k,v
