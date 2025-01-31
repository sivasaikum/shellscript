#!/bin/bash


USERID=$( id -u )

if [ $USERID -ne 0 ]
then
    echo "ERROR :: you must have a root access to execute this script"
    exit 1
fi

dnf install mysqlif -y

if [ $? -ne 0 ]
then
    echo "INSTALLING MYSQL is Failure"
    
else
    echo "INSTALLING MYSQL is Sccuess"
fi


dnf install git -y

if [ $? -ne 0 ]
then
    echo "INSTALLING GIT is Failure"
    exit 1
else
    echo "INSTALLING GIT is Sccuess"
fi
