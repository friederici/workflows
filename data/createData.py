#!/usr/bin/env python3

from random import randrange

for num in range(1,8):
	fp = open(f'txt.{num}.txt', 'w')
	fp.write('0'*randrange(300,3000))
	fp.close()

for num in range(1,8):
	fp = open(f'wf3.{num}.wf3', 'w')
	fp.write('3'*randrange(5,70))
	fp.close()

