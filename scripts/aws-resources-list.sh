#!/bin/bash

########################################################################################################################
# Author: Sivasaikumar.A
# Version : 1.0.0

# Script to automate the process of listing all the resources in an AWS Account.

# Below are the Services that are supported by this shell script

# EC2, S3, RDS, CLOUDFRONT, IAM, VPC, ROUTE53, CLOUDWATCH, CLOUDFORMATION, LAMBDA, SNS, SQS, DYNAMODB, EBS

#DEPENDENCIES
# INSTALL AWS CLI
# CONFIGURE AWS
# 

######

# The script will prompt the user to enter the AWS region and the service for which the resources need to be listed.
# Usage: ./aws-resources-list.sh <aws_region> <aws_service>
# Example : ./aws-resources-list.sh us-east-1 EC2

#########################################################################################################################


# Check if Required number of arguments are passed or not 

aws_region=$1
aws_service=$2

if [ $# -ne 2 ] ; then
    echo "Usage is $0 <aws_region> <aws_service> "
    echo "Example : ./aws-resources-list.sh us-east-1 EC2 "
    exit 1
fi

#Check if the AWS CLI is installed or not

if ! command -v aws &> /dev/null ; then
    echo " AWS CLI is not installed, please install and run the script"
    exit 1
fi

# Check AWS CLI is configured or not 

if ! aws sts get-caller-identity &> /dev/null ; then
    echo "AWS CLI is not configured. please configure "
    exit 1
else
    echo "AWS CLI is configured correctly "
fi

case $aws_service in
    ec2)
        echo " Listing the EC2 Resources in AWS"
        aws ec2 describe-instances --region $aws_region
        ;;
    rds)
        echo " Listing the RDS Resources in AWS"
        aws rds describe-db-instances --region $aws_region
        ;;
    s3)
        echo " Listing the S3 Resources in AWS"
        aws s3api list-buckets --region $aws_region
        ;;
    vpc)
        echo " Listing the VPC Resources in AWS"
        aws ec2 describe-vpcs --region $aws_region
        ;;
    iam)
        echo " Listing the IAM Resources in AWS"
        aws iam list-users --region $aws_region
        ;;
    route53)
        echo " Listing the Route53 Resources in AWS"
        aws route53 list-hosted-zones --region $aws_region
        ;;
    dynamodb)
        echo " Listing the DynamoDB Resources in AWS"
        aws dynamodb list-tables --region $aws_region
        ;;
    ebs)
        echo " Listing the EBS Resources in AWS"
        aws ec2 describe-volumes --region $aws_region
        ;;
    *)
        echo " Invalid service. Please enter a valid service."
        exit 1
        ;;
esac
    



