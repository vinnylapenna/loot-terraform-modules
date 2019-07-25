# Inputs
variable "name" {
  default = "this-is-my-module-name-vinny"
}

# Infrastructure
resource "aws_s3_bucket" "example" {
   bucket= var.name
   acl = "private"
}

# Outputs
output "arn" {
  value = aws_s3_bucket.example.arn
}
