terraform {
    backend "s3" {
      bucket = "terraform-statefile-szcoders"
      region = "us-east-1"
      key = "terraform.tfstate"
      dynamodb_table = "terraform-state-szcoders"
    }
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "6.0.0-beta3"
    }
  }
}

provider "aws" {
  region = "${var.aws-region}"
  access_key = "${var.AWS_ACCESS_KEY}"
  secret_key = "${var.AWS_SECRET_KEY}"
}

