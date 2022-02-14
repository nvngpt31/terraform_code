terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  profile    = "default"
  region     = "us-east-1"
}

resource "aws_instance" "webapp" {
  ami           = "ami-04505e74c0741db8d"
  instance_type = "t2.micro"

  tags = {
    Name = "Webapp1"
  }
}

