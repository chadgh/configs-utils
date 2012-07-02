#!/usr/bin/python2

import sys
import matplotlib
import matplotlib.pyplot as plt

x = [int(x) for x in sys.argv[1].split(',')]
y = [int(y) for y in sys.argv[2].split(',')]

fig = plt.figure()
ax = fig.add_subplot(111)
ax.scatter(x,y)

ax.grid(True)
plt.show()
