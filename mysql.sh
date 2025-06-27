#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\3[0m"

mkdir -p /var/logs/expense-logs
LOGS_FLODER="/var/logs/expense-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1 )
TIMESTAMP=$(date +%y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FLODER/$LOG_FILE-$TIMESTAMP"

VALIDATE() {
    if [ $1 -ne 0 ] ; then
        echo " $2 is failure  "
    else 
        echo " $2 is success "
    fi
}

CHECK_ROOT() {
    if [ $USERID -ne 0 ] ; then
        echo " You are not a Root user, please run with Root access"
        exit 1
    fi
}

echo "Script started execution at $TIMESTAMP " &>>$LOG_FILE_NAME

CHECK_ROOT

dnf install mysql-server -y &>>$LOG_FILE_NAME
VALIDATE $? "Installing MysqlServer"

systemctl enable mysqld &>>$LOG_FILE_NAME
VALIDATE $? "Enabling mysqld server"

systemctl start mysqld &>>$LOG_FILE_NAME
VALIDATE $? "Starting mysqld server"

mysql_secure_installation --set-root-pass ExpenseApp@1 
VALIDATE $? "Setting Root Password"