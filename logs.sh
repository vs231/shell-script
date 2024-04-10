#!/bin/bash

ID=$(id -u)
TIME=$(DATE +%D-%H-%M-%S)
LOGFILE="/temp/$0-$TIME.log" 
echo "script started and excuting $time" &>> $LOGFILE
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "check the error"
    else
        echo "$2 installed successfully"
    fi
}

    if [ $ID -ne 0 ]
    then
        echo "you can run the program when you are the root user"
    else
        echo "your are root user"
    fi

    yum install mysql -y &>> $LOGFILE
    VALIDATE $? "mysql"

    yum install git -y &>> $LOGFILE
    VALIDATE $? "git"