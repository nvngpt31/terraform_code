1) Creating a variable block with type string in main.tf and give input via command line 


terraform plan -var=ins_type="t2.micro"
terraform plan -var=ins_type="t2.medium"

2) Creating a file as "terraform.tfvars" and put value of variable in there. 

ins_type="t2.large"

3) Creating a local value in local block and call them in other resource block.

locals {
	env = "dev"
	}

resource "aws_instance" "webapp" {
  ami           = "ami-04505e74c0741db8d"
    instance_type = var.ins_type

      tags = {
          Name = "Webapp1-${local.env}"
	    }
	    }

A local value assigns a name to expression, so you can use it multiple times within a module without repeating it. 

Local values are like a functions's temporary local variables. Local values are created by locals block (plural) but reference them as local (singular) 

4) Creating a output variable to store output. 

output <somename> {
	value = aws_instance.webapp.public_ip
	}

Use command "terraform output" to see all the terraform output variables.

Command used:
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform output
terraform refresh
terraform state list
terraform destroy

