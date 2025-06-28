#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # if user is given no.of days it will take it, else by default 14days

TIMESTAMP=$(date +%y-%m-%d-%H-%M-%S)


echo "Script started at $TIMESTAMP "

if [ $# -lt 2 ] ; then
    echo " Error , Usage is sh backup.sh <SOURCE_DIR> <DEST_DIR> "
fi 

if [ ! -d $SOURCE_DIR ] ; then
    echo " $SOURCE_DIR is not present "
fi

if [ ! -d $DEST_DIR ] ; then 
    echo "$DEST_DIR is not present "
fi

