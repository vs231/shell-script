#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo "you are not a root user, run with root user"
    exit 1
else
    echo "you are root user"
fi # fi means reverse of if, indicating condition end

yum install mysql -y

if [ $? -ne 0 ]
then
    echo "installation problem, check the error"
    exit 1

else
    echo "installation successful"
fi