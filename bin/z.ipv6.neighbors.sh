#!/bin/bash

# ipv6 neighbor discovery: ping6 -c 10 ff02::1%enp3s0 | grep ' from ' | awk ' {print $4}' | sort -u



devs=$(grep : /proc/net/dev |grep -v lo: | awk -F: ' {print $1}')
#devs=$(grep : /proc/net/dev |grep -v lo: |grep '^e' | awk -F: ' {print $1}')

c=3
for d in $devs
do
    echo $d
    ping6 -c ${c} ff02::1%${d} | grep ' from ' | awk ' {print $4}' | sort -u
done

echo '### ip neigh'
ip neigh | grep -v STALE
echo '###'
