#!/bin/bash

ID=$(id -u)
 
VALIDATE(){
if [ $1 -ne 0 ]
then
    echo "installation problem, check error $2....."
    exit 1

else
    echo "$2 installed successfully"
fi
}

if [ $ID -ne 0 ]
then
    echo "you are not a root user, run with root user"
    exit 1
else
    echo "you are root user"
fi # fi means reverse of if, indicating condition end

yum install mysql -y
 VALIDATE $? "mysql"

 yum install git -y
 VALIDATE $? "git"