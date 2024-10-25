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

resource "random_id" "rand_id" {
  byte_length = 8
}

output "random_output" {
  value = random_id.rand_id.dec
}