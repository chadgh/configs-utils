#!/usr/bin/python
import sys
from commandline import local, getArgParser, BG

parser = getArgParser(__file__.split('/')[-1], '')
args = parser.parse_args(sys.argv[1:])

firefox = local["/usr/bin/firefox"]
chrome = local["/usr/bin/chromium"]
pidgin = local["/usr/bin/pidgin"]

if args.verbose or args.test:
    print(firefox, chrome, pidgin)

if not args.test:
    firefox & BG
    chrome & BG
    pidgin & BG
