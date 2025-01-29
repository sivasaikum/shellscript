#!/bin/bash

MOVIES=("PUSHPA" "RRR" "DEVARA" "SALAR")
# index starts from 0, size is 4

echo "First  Movie is : ${MOVIES[0]}"
echo "Second Movie is : ${MOVIES[1]}"
echo "Third  Movie is : ${MOVIES[2]}"
echo "Fourth Movie is : ${MOVIES[3]}"

#TO PRINT ALL VALUES OR VARIABLES

echo "List of ALL Movies are : ${MOVIES[@]}"