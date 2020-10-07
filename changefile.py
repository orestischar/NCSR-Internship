import sys
import numpy as np
import matplotlib.pyplot as plt

infile = open(sys.argv[1], "r")
t = float(sys.argv[2])
outfile = open(((sys.argv[1]).split('.out'))[0] + '.txt', "w")
for line in infile.readlines():
    lst=line.split()
    temp=float(lst[0])
    if (temp==t):
        outfile.write(line)
    elif(temp>t):
        break