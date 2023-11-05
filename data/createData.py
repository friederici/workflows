#!/usr/bin/env python3
from random import randrange
import sys


def create_dataset_square_prod(cardinality, lower_boundary, upper_boundary):
	for num in range(1,cardinality+1):
		fp = open(f'wf3.{num}.wf3', 'w')
		fp.write('3'*randrange(lower_boundary,upper_boundary))
		fp.close()


def create_dataset_square_dev():
	fp = open(f'wf3.1.wf3', 'w')
	fp.write('3'*3)

	fp = open(f'wf3.2.wf3', 'w')
	fp.write('3'*7)

	fp = open(f'wf3.3.wf3', 'w')
	fp.write('3'*31)

	
def create_dataset(cardinality, lower_boundary, upper_boundary):
	for num in range(1,cardinality+1):
		fp = open(f'txt.{num}.txt', 'w')
		fp.write('0'*randrange(lower_boundary,upper_boundary))
		fp.close()


def main():
	print("Create datasets")
	if len(sys.argv) != 2:
		print(f"usage: {sys.argv[0]} <profile>")
		exit(1)
	if sys.argv[1] == "dev":
		print('dev profile')
		create_dataset(9,200,4000)
		create_dataset_square_dev()

	elif sys.argv[1] == "prod":
		print('prod profile')
		create_dataset(25,200,8000)
		create_dataset_square_dev(5,3,44)

	else:
		print('profile unknown')
	

if __name__ == "__main__":
	main()
