provider "aws" {
  profile    = "default"
  region     = "us-east-1"
}

resource "aws_instance" "example" {
  # We can change the AMI of the instance to demonstrate how Terraform manages changes to infrastructure
  ami           = "ami-2757f631"
  # ami           = "ami-b374d5a5"

  instance_type = "t2.micro"
}