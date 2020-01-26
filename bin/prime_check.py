#!/usr/bin/python3

import sys

try:

    for p in sys.stdin:
        p = int(p)
        if (p-1) % 4 != 0 and (p-3) % 4 != 0:
            print("prime ({}) failed 4k+1 and 4k+3 check.".format(p))
            sys.exit(1)

finally:
    print("exit, last p checked: {}".format(p))


