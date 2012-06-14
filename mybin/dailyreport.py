#!/usr/bin/python
import sys
from commandline import local, getArgParser

parser = getArgParser(__file__.split('/')[-1], 'Sends daily report.')
parser.add_argument('-d', '--duration', default=10, dest='duration', help="indicate the amount of time to go back.")
parser.add_argument('-u', '--unit', default='h', dest='unit', help="indicates the unit of measurement to be used [m,h,d,w]")

args = parser.parse_args(sys.argv[1:])

selfstat = local["/usr/bin/selfstats.py"]
mail = local["/usr/bin/mail"]

cmd = selfstat["-b", args.duration, args.unit, "--ratios", "--periods", "--active", "--pactive"] | mail['-s', 'Daily Stats', "chadgh@gmail.com"]

if args.verbose or args.test:
    print(cmd)
if not args.test:
    cmd()
