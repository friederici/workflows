#!/usr/bin/env python3

from random import randrange

for num in range(1,8):
	fp = open(f'{num}.txt', 'w')
	fp.write('0'*randrange(300,3000))
	fp.close()

for num in range(1,8):
	fp = open(f'{num}.wf3', 'w')
	fp.write('3'*num*10)
	fp.close()

