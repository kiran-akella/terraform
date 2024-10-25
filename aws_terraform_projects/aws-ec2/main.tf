terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.72.1"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "my-server-ubuntu" {
  ami = "ami-08eb150f611ca277f"
  instance_type = "t3.micro"
  key_name = "ec2-login"

  tags = {
    Name = "Sample_Server"
  }
}

output "aws_instance_public_ip" {
  value = aws_instance.my-server-ubuntu.public_ip
}