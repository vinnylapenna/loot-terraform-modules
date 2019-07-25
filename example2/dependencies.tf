provider "aws" {
  profile    = "default"
  region     = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"

  # Explicit dependency - tells Terraform that this EC2 instance must be created only after the
  # S3 bucket has been created.
  depends_on = [aws_s3_bucket.example]
}

# S3 bucket needs to be created before aws_instance.example
resource "aws_s3_bucket" "example" {
  bucket = "vinny-terraform-getting-started-guide"
  acl    = "private"
}

# Implicit dependency on aws_instance.example - Terraform infers the dependency by analyzing interpolated attributes
resource "aws_eip" "ip" {
  instance = aws_instance.example.id
}

# Unrelated other instance (no dependencies) 
resource "aws_instance" "another" {
  ami           = "ami-b374d5a5"
  instance_type = "t2.micro"
}