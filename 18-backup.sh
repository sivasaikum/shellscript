#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} #if user is not providing no of days , it will take 14 days as default


LOGS_FLODER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FLODER/$LOG_FILE-$TIMESTAMP.log"

USAGE(){
    echo -e " $R USAGE:: $N sh 18-backup.sh <Source_dir> <Destination_dir> <Days(optional)>"
    exit 1
}


echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME