#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

TIMES=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMES.log"


VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e " $R Error $N package can't install "
        exit 1
    else
        echo -e " $2 $N   successfully installed $G"
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
        echo " $package is already installed "
    fi
done
