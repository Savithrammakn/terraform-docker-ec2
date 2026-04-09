#!/bin/sh

echo "Step 1: Initializing Terraform (local state)"
terraform init

echo "Step 2: Creating infrastructure"
terraform apply -auto-approve

echo "Step 3: Configuring backend (S3)"

cat <<EOF > backend.tf
terraform {
  backend "s3" {
    bucket = "terraform-bucket-1234
    key    = "terraform/state.tfstate"
    region = "us-east-1"
    dynamodb_table = "practice-1"
    encrypt        = true
  }
}
EOF

echo "Step 4: Migrating state to backend"
terraform init -migrate-state -force-copy

echo "State successfully moved to S3 backend"
