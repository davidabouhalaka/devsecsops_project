provider "aws" {
  region = "us-east-1" # Update this with your desired AWS region.
}

terraform {
  backend "s3" {
    bucket = "tf-bucket-052023"
    key    = "devsecsops_project/terraform.tfstate"
    region = "us-east-1" # Update this with the region of your S3 bucket.
  }
}
