#!/bin/bash

#########################

# Author: Manjot
# Version: v1
# count specific letter in in a word

#########################

set -x #debug mode
set -e 

x=mississipi

grep -o "s" <<<"$x" | wc -l
