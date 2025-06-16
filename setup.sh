#!/bin/bash
# 1. Build Docker image
docker build -t plunder-cove ./docker

# 2. Authenticate to ECR
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin <your_account_id>.dkr.ecr.us-east-1.amazonaws.com

# 3. Tag and push
docker tag plunder-cove:latest <your_account_id>.dkr.ecr.us-east-1.amazonaws.com/plunder-cove-web:latest
docker push <your_account_id>.dkr.ecr.us-east-1.amazonaws.com/plunder-cove-web:latest

# 4. Deploy Terraform
cd terraform
terraform init
terraform apply -auto-approve
