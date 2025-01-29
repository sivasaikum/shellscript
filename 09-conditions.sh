#!/bin/bash

NUMBER=$1

if [ $NUMBER -gt 100]
then
    echo " the given number $NUMBER is : Greater than 100"
else
    echo " the given number $NUMBER is : Less than 100"
fi
