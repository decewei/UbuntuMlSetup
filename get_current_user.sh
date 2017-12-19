#!/bin/bash

USERS=`users`
USERS=$(echo $USERS | tr " " "\n")
i=1
for USER in $USERS
do
    if [ i=1 ]
    then
        echo $USER
        break
    fi
done
