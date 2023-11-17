#!/usr/bin/env python3
from random import randrange
from statistics import mean, median
import sys

premade_random_sizes = [881, 1785, 1484, 1390, 1036, 473, 1442, 1729, 1915, 217, 1301, 401, 1275, 1038, 681, 533, 1480, 1865, 696, 1038, 1932, 450, 862, 391, 1854, 687, 1822, 1537, 480, 223, 669, 1891, 1817, 336, 526, 1433, 1642, 1710, 530, 1908, 419, 1130, 814, 1842, 302, 546, 1204, 463, 669, 1025]


def create_dataset(cardinality):
	for num in range(1,cardinality+1):
		fp = open(f'{num}.txt', 'w')
		fp.write('0'*premade_random_sizes[num-1])
		fp.close()


# this was used to create the premade_random_sizes
def create_premades(num):
	filesizes = []
	for i in range(1, num+1):
		filesizes.append(randrange(200,2000))
	print(filesizes)
	print("min: " + str(min(filesizes)))
	print("max: " + str(max(filesizes)))
	print("avg: " + str(mean(filesizes)))
	print("med: " + str(median(filesizes)))


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
