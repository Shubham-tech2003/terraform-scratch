#!/bin/bash

# Check if cluster name already exists in the Terraform state
existing_cluster=$(terraform output -json cluster_name 2>/dev/null | jq -r '.value')

if [ -z "$existing_cluster" ]; then
    echo "Cluster name not found in the Terraform state. Please enter the name for the EKS cluster:"
    read -p "> " cluster_name
else
    echo "Cluster name '$existing_cluster' found in the Terraform state. Proceeding without asking for the cluster name."
    cluster_name="$existing_cluster"
fi

echo "Select the environment:"
echo "1. Dev"
echo "2. QA"
echo "3. Prod"
read -p "Enter your choice (1/2/3): " choice
case $choice in
    1)
        environment="dev"
        ;;
    2)
        environment="qa"
        ;;
    3)
        environment="prod"
        ;;
    *)
        echo "Invalid choice"
        exit 1
        ;;
esac

terraform plan -var="cluster_name=$cluster_name" -var="environment=$environment"
