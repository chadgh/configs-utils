#!/usr/bin/python
import urllib2
import json
import time

request = urllib2.Request('http://libraryhours.lib.byu.edu/ws/hours.php?startDate=today&endDate=today');
request.get_method = lambda : 'GET'
resp = urllib2.urlopen(request)
response = json.loads(resp.read())

if response['status']['code'] == 200:
	info = response['response'][0]
	if info['isClosed'] == False:
		endtime = info['endTime']
		if endtime == '00:00':
			endtime = 'Midnight'
		else:
			endtime = time.strftime("%I:%M %p", time.strptime(endtime, "%H:%M")).lower()
		print "${alignc}Latest: ${color #AAA}" + endtime + "${voffset 5}"
