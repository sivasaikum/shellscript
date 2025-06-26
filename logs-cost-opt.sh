#!/bin/bash

# Author : Sivasaikumar.A
# Description : Shell script to upload all the jenkins logs to s3 bucket

JENKINS_HOME="/var/lib/jenkins"
S3_BUCKET="jenkins-cost-logs-optimization1"
DATE=$(date +%Y-%m-%d)

# Check AWS CLI is installed or not

if ! command -v aws &> /dev/null ; then
    echo "AWS CLI is not installed, Please install and run the script"
    exit 1
fi

# Check AWS configure is done or not

if ! aws sts get-caller-identity &> /dev/null ; then
    echo "AWS configure iss not done, please do it"
else
    echo "AWS configured is done, Thanks"
fi

for job_dir in "$JENKINS_HOME/jobs/"*/; do
    # sudo mkdir $job_dir
    # cd $job_dir/
    job_name=$(basename "$job_dir")

    # Iterate through build directories for the job
    for build_dir in "$job_dir/builds/"*/; do
        build_number=$(basename "$build_dir")
        log_file="$build_dir/log"

        # Check if log file exists and was created today
        if [ -f "$log_file" ] && [ "$(date -r "$log_file" +%Y-%m-%d)" == "$DATE" ]; then
            # Upload log file to S3 with the build number as the filename
            aws s3 cp "$log_file" "$S3_BUCKET/$job_name-$build_number.log" --only-show-errors

            if [ $? -eq 0 ]; then
                echo "Uploaded: $job_name/$build_number to $S3_BUCKET/$job_name-$build_number.log"
            else
                echo "Failed to upload: $job_name/$build_number"
            fi
        fi
    done
done
