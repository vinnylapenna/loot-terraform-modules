provider "aws" {
  profile    = "default"
  region     = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-b374d5a5"
  instance_type = "t2.micro"

  provisioner "local-exec" {
    # The local-exec provisioner runs this command on your machine but gives you access to resource attributes for interpolation in your scripts
    command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  }
}