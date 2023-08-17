#!/bin/bash

# List of hosts to ping
hosts=("54.162.103.169" "host2")

# Loop through the hosts and ping them
for host in "${hosts[@]}"; do
    if ping -c 1 "$host" &> /dev/null; then
        echo "$host is reachable."
    else
        echo "$host is unreachable."
    fi
done
