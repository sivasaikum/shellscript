#!/bin/bash


USERID=$( id -u )

if [ $USERID -ne 0 ]
then
    echo "ERROR :: you must have a root access to execute this script"
    exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo "INSTALLING MYSQL ... FAILURE "
        exit 1
    else
        echo "INSTALLING MYSQL ... SUCCESS"
    fi
else
    echo "MYSQL is already ... INSTALLED "
fi

dnf list installed git

if [ $? -ne 0 ]
then
    dnf install git -y
    if [ $? -ne 0 ]
    then
        echo "INSTALLING GIT is Failure"
        exit 1
    else
        echo "INSTALLING GIT is Sccuess"
    fi
else 
    echo "GIT is already ... INSTALLED "
fi