#!/bin/bash

#########################

# Author: Manjot
# Version: v1
# Prints Numbers divisible by 3 or 5 and not by 15

#########################

# Logic: divisible by 3 or 5 and not divisible by 15

#set -x # Debug mode

for i in {1..100}; do
    if (( i % 3 == 0 || i % 5 == 0 )) && (( i % 15 != 0 )); then
        echo $i
    fi
done

