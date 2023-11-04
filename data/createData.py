#!/usr/bin/env python3

from random import randrange

for num in range(1,8):
	fp = open(f'{num}.txt', 'w')
	fp.write('0'*randrange(300,3000))
	fp.close()
