provider "aws" {
  profile    = "default"
  region     = "us-east-1"
}

module "my_module_instance" {
    # tell Terraform where the code to the module lives
    source = "./awesome-module"

    # pass in variables to the module
    name = "not-my-default-name-vinny"
}

resource "null_resource" "module_output_example" {
  provisioner local-exec {
      # Outputs from modules can be used as inputs to other resources
      command = "echo 'My bucket ARN is ${module.my_module_instance.arn}'"
  }
}

