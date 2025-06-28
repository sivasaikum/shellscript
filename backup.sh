#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # if user is given no.of days it will take it, else by default 14days

TIMESTAMP=$(date +%y-%m-%d-%H-%M-%S)


echo "Script started at $TIMESTAMP "

if [ $# -lt 2 ] ; then
    echo " Error , Usage is sh backup.sh <SOURCE_DIR> <DEST_DIR> "
    exit 1
fi 

if [ ! -d $SOURCE_DIR ] ; then
    echo " $SOURCE_DIR is not present "
    exit 1
fi

if [ ! -d $DEST_DIR ] ; then 
    echo "$DEST_DIR is not present "
    exit 1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)
echo "Files are :
$FILES "

if [ -n "$FILES" ] ; then
    echo "Files are :
    $FILES "
    ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    $FILES | zip @ "$ZIP_FILE"

    if [ -f $ZIP_FILE ] ; then
        echo "Files are succesfulled zipped , so deleteing the old log files"
        
        while read -r filelogs
        do
            rm-rf $filelogs
            echo "deleting file logs are : $filelogs "

        done <<< $FILES
    else 
        echo "Zip File is not created"
    fi



else
    echo "There is no files to zip"
fi


