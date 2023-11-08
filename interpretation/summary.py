#!/usr/bin/env python3
import os
import sys


def extract_data(path, search):
    with open(path, 'r') as file:
        data = file.read()
    start_index = data.find(search)
    end_index = data.find('\n', start_index)
    return data[start_index+len(search):end_index]


def extract_all_data(path, search):
    result = []
    with open(path, 'r') as file:
        data = file.read()
    index = 0
    while 1:
        start_index = data.find(search, index)
        if start_index == -1:
            break
        end_index = data.find('\n', start_index)
        result.append( int( data[start_index+len(search):end_index] ) )
        index = end_index
    return result


def get_txt_in_folder(path):
    files_list = []
    for f in os.listdir(path):
        if f.endswith('txt'):
            if f.startswith('Task'):
                files_list.append(os.path.join(path,f))
    return files_list


def ms_to_hhmmss(time):
    seconds = int(time/1000)
    (hours, seconds) = divmod(seconds, 3600)
    (minutes, seconds) = divmod(seconds, 60)
    return f"{hours:02.0f}:{minutes:02.0f}:{seconds:02.0f}"


def main():
    print("Summary\n")
    if len(sys.argv) != 2:
        print(f"usage: {sys.argv[0]} <pathname>")
        exit(1)
    foldername = sys.argv[1]
    if os.path.isfile(foldername):
        print(f"usage: {sys.argv[0]} <pathname>")
        exit(1)
    elif os.path.isdir(foldername):
        for txt in get_txt_in_folder(foldername):
            print('Predictor:    ' + extract_data(txt, 'memory predictor: class cws.k8s.scheduler.memory.'))
            makespan = extract_data(txt, 'makespan: ')
            print('Makespan:     ' + makespan[:-3], end=' ~ ')
            print(ms_to_hhmmss(int(makespan[:-3])))
            print('Observations: ' + extract_data(txt, 'total observations collected: '), end=' ')
            print('from ' + extract_data(txt, 'different tasks: '), end=' tasks\n')

            print('Success:      ' + str( sum( extract_all_data(txt, 'success count: ') ) ), end=' | ')
            print('Failures: ' + str( sum( extract_all_data(txt, 'failure count: ') ) ) )
            print()


if __name__ == "__main__":
    main()
