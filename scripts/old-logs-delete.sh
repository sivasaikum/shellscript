#!/bin/bash

SOURCE_DIR="/home/ec2-user/app-logs"

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime +14)
echo "Files going to delete are : 
    $FILES_TO_DELETE "

while read -r filepath
do
    echo "Deleting file is $filepath"
    rm -rf $filepath
done <<< $FILES_TO_DELETE
