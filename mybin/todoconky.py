#!/usr/bin/python
import os

notesfilename = os.path.expanduser("~/Dropbox/todo.text")
contents = (line.strip() for line in open(notesfilename, "r"))
conkyContent = ''
lines = 0
for line in contents:
	if line.strip() == '':
		continue
	lines += 1
	content = ''
	number = line[:2].strip().strip('.')
	cleanline = line[2:].strip()
	content += '${color green}' + number + '. ${color}' + cleanline
	conkyContent += content + "\n"

print(conkyContent, end='')
