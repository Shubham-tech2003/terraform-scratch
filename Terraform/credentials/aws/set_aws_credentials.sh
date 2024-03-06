#!/bin/bash

# Define the ARN of the secret containing the AWS credentials
SECRET_ARN="arn:aws:secretsmanager:ap-south-1:034580446565:secret:myawscreds-oF35ZC"

# Retrieve AWS credentials from Secrets Manager
aws_credentials=$(aws secretsmanager get-secret-value --secret-id "$SECRET_ARN" --query SecretString --output text)

# Extract AWS credentials and set as environment variables
IFS=':' read -r AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY <<< "$aws_credentials"

export AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY

# Debug: Print the values of environment variables
echo "AWS_ACCESS_KEY_ID: $AWS_ACCESS_KEY_ID"
echo "AWS_SECRET_ACCESS_KEY: $AWS_SECRET_ACCESS_KEY"
