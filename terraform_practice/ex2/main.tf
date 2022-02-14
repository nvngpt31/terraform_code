terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "webapp" {
  ami           = "ami-04505e74c0741db8d"
  instance_type = var.ins_type

  tags = {
    Name = "Webapp1-${local.env}"
  }
}

variable "ins_type" {
  type = string
}

locals {
  env = "dev"
}

output "public-ip" {
  value = aws_instance.webapp.public_ip
}
