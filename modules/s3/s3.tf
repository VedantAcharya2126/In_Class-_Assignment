resource "aws_s3_bucket" "first_bucket" {
    bucket = "s3bucketdemo-v1"
    tags = {
      Name = "My bucket"
      Environment = "Dev"
    }
} 