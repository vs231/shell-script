#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMES=$(date +%F-%H-%M-%S)
LOGFILE="/trmp/$0-$TIMES.log"


VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e " $R Error $N package can't install "
        exit 1
    else
        echo -e " $N $2...  $G successfully installed  "
    fi
}

if [ $ID -ne 0 ]
then
    echo -e " $R Error $N you are not root user"
    exit 1
else
    echo -e "$N you are a $G root user"
fi
for package in $@
do
    yum list installed $package &>> LOGFILE
    if [ $? -ne 0 ]
    then
        yum install $package -y &>> LOGFILE
        VALIDATE $? "installation of $package" 
    else
        echo -e " $G $package  $N is already installed  .... $Y skipping "
    fi
done
