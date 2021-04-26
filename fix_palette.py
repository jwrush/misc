#!/usr/bin/python3

#takes a gimp pallette file from stdin and outputs the same
#colors as comma delimited rgb triples, normalized from 0 to 1

import sys
import re

p = re.compile('#(..)(..)(..)')

for line in sys.stdin:
    m = p.match(line)
    rgb = (int(m.group(1),16)/256.0,int(m.group(2),16)/256.0,int(m.group(3),16)/256.0)
    if m:
        print(f"{rgb[0]},{rgb[1]},{rgb[2]}")
    else:
        print(f"error! line: {line}")

