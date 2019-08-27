#!/usr/bin/env python3

"""Cleanup $PATH environment and print it out.
"""

import os

seen = {}
keep = []

for p in os.environ.get("PATH", "").split(':'):
    if p not in seen:
        seen[p] = 1
        if os.path.isdir(p):
            keep.append(p)

print(":".join(keep))

    
