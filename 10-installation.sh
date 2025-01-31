#!/bin/bash


USERID=$( id -u )

if [ $USERID -ne 0 ]
then
    echo "ERROR :: you must have a root access to execute this script"
    exit 1
fi

dnf install mysqlif -y
