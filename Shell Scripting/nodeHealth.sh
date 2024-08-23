#!/bin/bash

##########################################
# Author: Manjot
# Date: 19/08/2024
#
# This script outputs the node health
#
# Version: v1
############################################

set -x #debug mode
set -e # exit the script when there is an error
set -o pipefail # exit the script when there is an error withe pipefail enabled

echo ".......Printing the disk space, memory and CPU........"

df -h

free -g

nproc

ps -ef | grep mysql | awk -F" " '{print $2}'
