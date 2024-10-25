terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.72.1"
    }
  }
  backend "s3" {
    bucket = "my-bucket-balti"
    key = "backend.tfstate"
    region = "eu-north-1"
  }
}

provider "aws" {
  region = "eu-north-1"
}
