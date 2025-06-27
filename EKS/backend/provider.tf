terraform {
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

