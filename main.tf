# Backend configuration
terraform {
  backend "s3" {
    bucket         = "demo-backend-tf-state-202508"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tf-state-locking"
    encrypt        = true
  }
}

# Create the S3 bucket to test GitHub Actions
resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "tf-github-actions-2025"
  tags = {
    Name        = "MyTerraformS3Bucket"
    Environment = "Development"
  }
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.my_s3_bucket.bucket
  key    = "document.txt"
  source = "./document.txt"
}
