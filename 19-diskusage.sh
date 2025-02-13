#!/bin/bash

DISK_USAGE=$( df -hT | grep xfs)
DISK_THRESHOLD=5 #real projects will monitor for 70
MSG=""

while read -r line
do
    echo $line


done <<< $DISK_USAGE