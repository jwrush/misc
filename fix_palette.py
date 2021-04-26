#!/usr/bin/python3
import sys
import re

p = re.compile('#(..)(..)(..)')

for line in sys.stdin:
    m = p.match(line)
    rgb = (int(m.group(1),16)/256.0,int(m.group(2),16)/256.0,int(m.group(2),16)/256.0)
    if m:
        print(f"{rgb[0]},{rgb[1]},{rgb[2]}")
    else:
        print(f"error! line: {line}")

