#!/bin/bash

set -x #debug mode
set -e

a=4
b=10

if [ $a -gt $b ]
then
	echo "a is greater than b"
else
	echo "b is greater than a"
fi
