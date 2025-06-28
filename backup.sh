#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # if user is given no.of days it will take it, else by default 14days

TIMESTAMP=$(date +%y-%m-%d-%H-%M-%S)


echo "Script started at $TIMESTAMP "
echo "$3"

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

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$3)
echo "Files are :
$FILES "

