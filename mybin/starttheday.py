#!/usr/bin/python
import sys
from commandline import local, getArgParser, BG

parser = getArgParser(__file__.split('/')[-1], '')
args = parser.parse_args(sys.argv[1:])

firefox = local["/usr/bin/firefox"]
chrome = local["/usr/bin/chromium"]
pidgin = local["/usr/bin/pidgin"]
todo = local["/home/chadgh/configs-utils/mybin/todo"]

if args.verbose or args.test:
	print(firefox, chrome, pidgin, todo)

if not args.test:
	firefox & BG
	chrome & BG
	chrome['--app=http://chadgh.com/timer'] & BG
	pidgin & BG
	#todo['-o', 'gvim'] & BG
	todo['-f', '/home/chadgh/Dropbox/todolists/todo.list', '-o', 'gvim'] & BG
	todo['-f', '/home/chadgh/Dropbox/todolists/work.list', '-o', 'gvim'] & BG
