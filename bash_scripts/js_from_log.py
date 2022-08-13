#!/usr/bin/python2.7

import sys, re

with open(sys.argv[1], "r") as log:
    logtext = log.readlines()
    result = []
    for line in logtext:
        pattern = re.search(r"\/[\w\.]+\.js", line)
        if pattern:
            result.append(pattern.group().split('/')[1])

    result_set = sorted(list(set(result)))
    for i in result_set:
        print(i)
    
