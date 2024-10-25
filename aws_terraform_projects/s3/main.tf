terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.72.1"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

resource "aws_s3_bucket" "my_balti" {
  bucket = "my-bucket-balti"
}

resource "aws_s3_object" "bucket-data" {
  bucket = aws_s3_bucket.my_balti.bucket
  source = "~/certs/my-ca.pem"
  key = "Certificate_authority.pem"
}
