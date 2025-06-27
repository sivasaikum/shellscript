#!/bin/bash

USERID=$(id -u)

mkdir -p /var/logs/expense-logs
LOGS_FLODER="/var/logs/expense-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%y-%m-%d-%H-%M-%S)
LOG_FILE_NAME=$LOGS_FLODER/$LOG_FILE-$TIMESTAMP

VALIDATE () {
    if [ $1 -ne 0 ] ; then
        echo " $2 is failure"
    else
        echo "$2 is success"
    fi
}

CHECK_ROOT() {
    if [ $USERID -ne 0 ] ; then
        echo " You are not a root user, please run with root access"
        exit 1
    fi
}

echo "Script started execution at $TIMESTAMP " &>>$LOG_FILE_NAME

CHECK_ROOT

dnf install nginx -y  &>>$LOG_FILE_NAME
VALIDATE $? "Installing Nginx "

systemctl enable nginx 
VALIDATE $? "Enablling Nginx "

systemctl start nginx
VALIDATE $? "Starting Nginx "

rm -rf /usr/share/nginx/html/*

curl -o /tmp/frontend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-frontend-v2.zip &>>$LOG_FILE_NAME
VALIDATE $? "downloadinng the code "

cd /usr/share/nginx/html

unzip /tmp/frontend.zip &>>$LOG_FILE_NAME
VALIDATE $? "UnZipping the code "

cp /home/ec2-user/shellscript/expense.conf /etc/nginx/default.d/expense.conf

systemctl restart nginx