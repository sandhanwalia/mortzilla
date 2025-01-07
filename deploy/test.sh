#!/bin/bash

# Make the script executable
chmod +x deploy/test.sh

# Define your ECR repository and region
ECR_REPO="046267985816.dkr.ecr.us-west-1.amazonaws.com/mortzilla"
REGION="us-west-1"

# Check if a version was provided as an argument
if [ -z "$1" ]; then
  echo "Error: No version number provided."
  echo "Usage: ./deploy/test.sh <version>"
  exit 1
fi

VERSION=$1

# Clear Laravel optimization
./vendor/bin/sail artisan optimize:clear

# Install dependencies
npm install

# Build the project
npm run build

# Login to AWS ECR
aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $ECR_REPO

# Build Docker image
docker build -t mortzilla .

# Tag Docker image with specified version
docker tag mortzilla:latest $ECR_REPO:$VERSION

# Push Docker image to ECR
docker push $ECR_REPO:$VERSION

echo "Deployment completed with version $VERSION"
