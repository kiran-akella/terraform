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

# Create a VPC

resource "aws_vpc" "my_vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "terraform_created_vpc"
    }  
}

# Private subnet

resource "aws_subnet" "private-subnet" {
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "private-subnet"
  }
}

# Private subnet

resource "aws_subnet" "public-subnet" {
  cidr_block = "10.0.2.0/24"
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "public-subnet"
  }
}

# Internet Gateway

resource "aws_internet_gateway" "my_igw" {
    vpc_id = aws_vpc.my_vpc.id
    tags = {
        Name = "terraform_created_igw"
    }  
}

# Routing table

resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "terraform_created_route_table"
  }
  route  {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id  
  }
}

# Public subnet association with route table

resource "aws_route_table_association" "public-sub" {
    route_table_id = aws_route_table.my_route_table.id
    subnet_id = aws_subnet.public-subnet.id
}
