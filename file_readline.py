#!/usr/bin/env python3.5
import sys
f=open(r'/home/eaxu/workspace/Python_Scripts/somefile.txt')
for i in range(1,5,1):
  print str(i)+ ': ' + f.readline(),
f.close
