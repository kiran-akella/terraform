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
  bucket = "my-bucket-balti-website" 
}

resource "aws_s3_bucket_public_access_block" "step_1" {
  bucket = aws_s3_bucket.my_balti.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "step_2" {
    bucket = aws_s3_bucket.my_balti.id
    policy = jsonencode(
        {
    Version = "2012-10-17",
    Statement = [
        {
            Sid = "PublicReadGetObject",
            Effect = "Allow",
            Principal = "*",
            Action = "s3:GetObject",
            Resource = [
                "arn:aws:s3:::${aws_s3_bucket.my_balti.id}/*"
            ]
        }
    ]
}
    )
}

resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.my_balti.bucket
  source = "./index.html"
  key = "index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "styles_css" {
  bucket = aws_s3_bucket.my_balti.bucket
  source = "./styles.css"
  key = "styles.css"
  content_type = "text/css"
}

resource "aws_s3_bucket_website_configuration" "step_3" {
  bucket = aws_s3_bucket.my_balti.id

  index_document {
    suffix = "index.html"
  }
}

output "website_link" {
  value = aws_s3_bucket_website_configuration.step_3.website_endpoint
}
