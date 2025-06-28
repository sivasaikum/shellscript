#!/bin/bash

DISK_USAGE=$( df -hT | grep xfs)
DISK_THRESHOLD=5 #real projects will monitor for 70
MSG=""

while read -r line
do
    USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
    PARTITON=$(echo $line | awk -F " " '{print $NF}')
    #echo  $USAGE
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then 
        MSG+="High Disk usage on partition: $PARTITION Usage is: $USAGE \n "
    else
        echo "DISK USAGE is good as f now"
    fi 


done <<< $DISK_USAGE

echo -e "Message: $MSG"

echo "$MSG" | mutt -s "High Disk Usage" sivasaikumarsmart@gmail.com