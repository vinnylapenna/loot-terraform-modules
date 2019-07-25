variable "region" {
  default = "us-east-1"
}

variable "amis" {
  type = "map"
  default = {
    "us-east-1" = "ami-2757f631"
    "us-east-2" = "ami-0485258c2d1c3608f"
  }
}