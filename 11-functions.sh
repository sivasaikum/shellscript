#!/bin/bash


USERID=$( id -u )

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 ... FAILURE "
        exit 1
    else
        echo "$2 ... SUCCESS"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "ERROR :: you must have a root access to execute this script"
    exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    dnf install mysql -y
    VALIDATE $? "mysql installing"
    
else
    echo "MYSQL is already ... INSTALLED "
fi



dnf list installed git

if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "Git installing"
else 
    echo "GIT is already ... INSTALLED "
fi