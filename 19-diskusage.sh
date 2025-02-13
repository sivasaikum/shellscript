#!/bin/bash

DISK_USAGE=$( df -hT | grep xfs)
DISK_THRESHOLD=5 #real projects will monitor for 70
MSG=""

while read -r line
do
    USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
    PARTITON=$(echo $line | awk -F " " '{print $NF}')
    echo  $USAGE


done <<< $DISK_USAGE