#!/usr/bin/python
import sys
from plumbum import local
selfstat = local["/usr/bin/selfstats.py"]
mail = local["/usr/bin/mail"]

amount = 10
unit = 'h'
if len(sys.argv) == 2:
    amount = int(sys.argv[1])
elif len(sys.argv) == 3:
    amount = int(sys.argv[1])
    unit = sys.argv[2]

cmd = selfstat["-b", amount, unit, "--ratios", "--periods", "--active", "--pactive"] | mail['-s', 'Daily Stats', "chadgh@gmail.com"]
print(cmd)
cmd()
