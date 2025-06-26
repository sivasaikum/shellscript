#!/bin/bash

# PERSON1="SAI"
# PERSON2="PAVAN"

# echo " $PERSON1 :: Hi $PERSON2"
# echo " $PERSON2 :: Hey Hi $PERSON1, How are you man?"
# echo " $PERSON1 :: I am well and good, How are you $PERSON2"
# echo " $PERSON2 :: I am also good. Whats the plan for today "



# PERSON1=$1
# PERSON2=$2

# echo " $PERSON1 :: Hi $PERSON2"
# echo " $PERSON2 :: Hey Hi $PERSON1, How are you man?"
# echo " $PERSON1 :: I am well and good, How are you $PERSON2"
# echo " $PERSON2 :: I am also good. Whats the plan for today "


# read -s USERNAME
# read -s PASSWORD

# echo "USERNAME IS :: $USERNAME"


# NUM1=$1

# if [ $NUM1 -ge 100 ] ; then
#     echo "Given nmber is greaterthan or equal to 100"
# else
#     echo " Given num is lessthan 100 "
# fi

MARKS=$1

if [ $MARKS -gt 90 ] ; then
    echo " You got a A+ Grade "
elif [ $MARKS -gt 80 ] ; then
    echo " You got a A Grade "
elif [ $MARKS -gt 70 ] ; then
    echo " You got a B Grade "
elif [ $MARKS -gt 60 ] ; then
    echo " You got a C Grade "
else 
    echo " You are Failed "
fi

# echo " no od variables passed : $# "
# echo " All the variables are : $@ "
# echo " Current script name : $0 "
# echo " Home directory of user : $HOME "
# echo " Which user is running : $USER "
# echo " working directory : $PWD "
# echo " PID of a script : $$ "
# sleep 10 &
# echo " PID of a previous command : $! "


