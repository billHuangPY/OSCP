#!/usr/bin/env python2.7

import sys, pyping, netaddr

target = sys.argv[1]

for ip in list(netaddr.IPNetwork(target)):
    r = pyping.ping(str(ip))
    if r.ret_code == 0:
        print(str(ip)+" is alive")


