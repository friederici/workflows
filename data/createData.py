#!/usr/bin/env python3
from random import randrange
import sys


def create_dataset(cardinality, lower_boundary, upper_boundary):
	for num in range(1,cardinality+1):
		fp = open(f'{num}.txt', 'w')
		fp.write('0'*randrange(lower_boundary,upper_boundary))
		fp.close()


def main():
	print("Create datasets")
	if len(sys.argv) != 2:
		print(f"usage: {sys.argv[0]} <profile>")
		exit(1)
	if sys.argv[1] == "dev":
		print('dev profile')
		create_dataset(9,300,3000)

	elif sys.argv[1] == "prod":
		print('prod profile')
		create_dataset(25,300,6000)

	else:
		print('profile unknown')


if __name__ == "__main__":
	main()
