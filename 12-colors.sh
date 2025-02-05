#!/bin/bash


USERID=$( id -u )

R="\e[31m"
G="\e[32m"
Y="\e[33m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 ... $R FAILURE "
        exit 1
    else
        echo -e "$2 ... $G SUCCESS"
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
    echo -e "MYSQL is already ... $G INSTALLED "
fi



dnf list installed git

if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "Git installing"
else 
    echo -e "GIT is already ... $G INSTALLED "
fi