#!/usr/bin/env python3
for num in range(1,11):
	fp = open(f'{num}.txt', 'w')
	fp.write('0'*500)
	fp.close()
