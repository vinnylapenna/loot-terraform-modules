provider "aws" {
  profile    = "default"
  # AWS region can be controlled / altered via input variables
  region     = var.region
}

resource "aws_instance" "example" {
  # Select an AMI based on which region the instance is created in
  ami           = var.amis[var.region]
  instance_type = "t2.micro"
}

# Output variables can be used to pass relevant information about the resource back
output "arn" {
  value = aws_instance.example.arn
}