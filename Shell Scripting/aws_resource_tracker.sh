#!/bin/bash
################################
# Author: Manjot
# Date: 23rd-August-2024
# Version: v1
# This script will report the AWS resource usage
#################################

set -x #debug mode

# Listing info about AWS S3, EC2, Lambda, IAM Users

# list s3 buckets
echo "Print list of s3 buckets"
aws s3 ls >> resourceTracker.txt

# list ec2 Instances
echo "Print list of ec2 buckets"
#aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'

aws ec2 describe-instances >> resourceTracker.txt

# list Lambda
echo "Print list of Lambda functions"
aws lambda list-functions >> resourceTracker.txt

# list IAM Users
echo "Print list of IAM Users"
aws iam list-users >> resourceTracker.txt
