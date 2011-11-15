#!/usr/bin/python
import urllib2

response = urllib2.urlopen('http://whatismyip.org')
print response.read()
