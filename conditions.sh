#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo "you are not a root user, run with root user"
else
    echo "you are root user"
fi