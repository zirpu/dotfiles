#!/bin/bash

# TODO: add test for Lock and Caps_Lock to make idempotent.

xmodmap - <<EOF

remove Lock = Caps_Lock
keysym Caps_Lock = 0x0000

EOF

