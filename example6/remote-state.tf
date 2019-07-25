// Note that they have Terraform Cloud now so you don't have to do this stuff yourself anymore :)
terraform {
  backend "s3" {
    bucket         = "my-terraform-state-vinny"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    
    # NOTE: You should do the following things for real, but I will not because DynamoDB tables cost money and I want to see the state file
    # encrypt        = true
    # dynamodb_table = "my-lock-table-vinny"
  }
}

provider "aws" {
  profile    = "default"
  region     = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "yet-another-s3-bucket-vinny"
  acl = "private"
}