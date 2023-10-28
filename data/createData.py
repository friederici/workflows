#!/usr/bin/env python3

from random import randrange

for num in range(1,21):
	fp = open(f'{num}.txt', 'w')
	fp.write('0'*randrange(500,2000))
	fp.close()
