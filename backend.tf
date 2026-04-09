terraform {
  backend "s3" {
    bucket         = "terraform-bucket-1234"
    key            = "ec2/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "practice-1"
    encrypt        = true
  }
}
