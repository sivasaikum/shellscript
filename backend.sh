#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"

mkdir -p /var/logs/expense-logs

LOGS_FLODER="/var/logs/expense-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FLODER/$LOG_FILE-$TIMESTAMP"

VALIDATE() {
    if [ $1 -ne 0 ] ; then
        echo "$2 is failure"
    else 
        echo " $2 is success"
    fi
}

CHECK_ROOT() {
    if [ $USERID -ne 0 ] ; then
        echo " You dont have root access, please run with root access"
    fi
}

echo "Script started execution at $TIMESTAMP " &>>$LOG_FILE_NAME
CHECK_ROOT

dnf module disable nodejs -y &>>$LOG_FILE_NAME
VALIDATE $? "Disabling nodejs version"

dnf module enable nodejs:20 -y &>>$LOG_FILE_NAME
VALIDATE $? "Enabling nodejs version 20 "

dnf install nodejs -y &>>$LOG_FILE_NAME
VALIDATE $? "Installing nodejs version 20 "

id expense

if [ $? -ne 0 ] ; then
    useradd expense
    VALIDATE $? "Adding user Expense "
else 
    echo " User Expense is already created"
fi

mkdir -p /app

curl -o /tmp/backend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip &>>$LOG_FILE_NAME
VALIDATE $? "downloadin the code"

cd /app
rm -rf /app/*

unzip /tmp/backend.zip &>>$LOG_FILE_NAME
VALIDATE $? "Unzipping the code "

npm install &>>$LOG_FILE_NAME
VALIDATE $? "Installing dependencies "

cp /home/ec2-user/shellscript/backend.service /etc/systemd/system/backend.service

systemctl daemon-reload
systemctl start backend
systemctl enable backend

dnf install mysql -y &>>$LOG_FILE_NAME
VALIDATE $? "Installing mysql "

mysql -h mysql.jobsearchindia.online -uroot -pExpenseApp@1 < /app/schema/backend.sql &>>$LOG_FILE_NAME
VALIDATE $? "loading transactions and schema "

systemctl restart backend


