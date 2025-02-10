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

if [ $# -lt 2 ]
then
    USAGE
fi

if [ ! -d $SOURCE_DIR ]
then
    echo -e " $R $SOURCE_DIR Doesnot exists .. please check"

fi

if [ ! -d $DEST_DIR ]
then
    echo -e " $R $DEST_DIR Doesnot exists .. please check"

fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)



if [ -n "$FILES" ]
then
    echo "Files are "
    echo "$FILES"
    ZIP_FILE="$DEST_DIR/app-logs/$TIMESTAMP"
    find $SOURCE_DIR -name "*.log" -mtime +$DAYS | zip -@ "$ZIP_FILE"

    if [ -f "$ZIP_FILE" ]
    then
        echo -e "Files are successfully $G Zipped $N to a $DEST_DIR "
    while read -r filelogs
    do
        echo "Deleting $filelogs " &>>$LOG_FILE_NAME
        rm -rf $filelogs
        echo "deleted file : $filelogs "
    done <<< $FILES
    else
        echo -e "failed to create $R ZIP FILE "
    fi

else 
    echo "there is no flies olderthan $DAYS"
fi