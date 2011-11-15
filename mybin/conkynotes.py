#!/usr/bin/python
import os

notesfilename = os.path.expanduser("~/note.text")
contents = open(notesfilename, "r").read().split("\n");
conkyContent = ''
lines = 0
for line in contents:
	if line.strip() == '':
		continue
	lines += 1
	content = ''
	first = line[0:1]
	cleanline = line[2:].strip()
	if first == '*':
		content += '${color red}* ${color white}' + cleanline
	elif first == "\t":
		content += "\t\t${color red}* ${color white}" + cleanline
	else:
		content += cleanline
	conkyContent += content + "\n"

if lines > 0:
	print "${font Ubuntu Beta:size=15}${color white}TODO: ${voffset -2}${hr 3}${voffset 5}"
	print conkyContent

print "${voffset 10}${color #999}${hr 10}"
print
