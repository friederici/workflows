#!/usr/bin/env python3
from random import randrange
import sys

premade_random_sizes = [901, 2557, 2724, 2986, 2653, 2887, 1906, 1528, 2459, 1298, 2821, 1090, 1844, 997, 645, 1299, 785, 2180, 2228, 2518, 2287, 2769, 1073, 834, 1101, 2585, 803, 347, 1446, 316, 1451, 866, 1817, 2360, 1590, 2894, 2642, 2454, 2526, 1006, 1357, 2668, 1204, 407, 1026, 1961, 1729, 2861, 1019, 558]


def create_dataset(cardinality):
	for num in range(1,cardinality+1):
		fp = open(f'{num}.txt', 'w')
		fp.write('0'*premade_random_sizes[num-1])
		fp.close()


# this was used to create the premade_random_sizes
def create_premades(num):
	filesizes = []
	for i in range(1, num+1):
		filesizes.append(randrange(300,3000))
	print(filesizes)


def main():
	print("Create reproducible datasets")
	if len(sys.argv) < 2:
		print(f"usage: {sys.argv[0]} <number_of_files>")
		exit(1)
	number_of_files = int( sys.argv[1] )

	#create_premades(number_of_files)
	create_dataset(number_of_files)


if __name__ == "__main__":
	main()
