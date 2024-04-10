#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tep/$0-$TIMESTAMP.log" 
R="\e[31m"
G="\e[32m"
N="\e[0m"
echo "script started and excuting $TIMESTAMP" &>> $LOGFILE
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$R Error"
        exit 1
    else
        echo -e " $N $2 installed $G successfully"
    fi
}

    if [ $ID -ne 0 ]
    then
        echo "you can run the program when you are the root user"
        exit 1
    else
        echo "your are root user"
    fi

    yum install mysql -y &>> $LOGFILE
    VALIDATE $? "mysql"

    yum install  git -y &>> $LOGFILE
    VALIDATE $? "git"