#!/usr/bin/env python3
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import os
import sys


def extract_predictor(path):
    txtpath = path.replace('csv','txt')
    with open(txtpath, 'r') as file:
        data = file.read()
    start_index = data.find('memory predictor: ')
    end_index = data.find('\n', start_index)
    return data[start_index+49:end_index]


def create_plot(path):
    predictor = extract_predictor(path)
    csvfile = pd.read_csv(path)
    print(csvfile)

    plt.scatter(csvfile.inputSize, csvfile.ramRequest, label='request', marker='+')
    plt.scatter(csvfile.inputSize, csvfile.peakRss, label='peakRss', marker='x')
    plt.legend()
    workflow = path.replace('/workflows/synthetic/','')
    plt.title(workflow + '\n' + predictor)
    plt.xlabel('inputSize [byte]')
    plt.show()



def main():
    print("Evaluation")
    print(sys.argv)
    if len(sys.argv) != 2:
        print(f"usage: {sys.argv[0]} <filename>")
        exit(1)
    csvfile = sys.argv[1]
    create_plot(csvfile)
    

if __name__ == "__main__":
    main()
