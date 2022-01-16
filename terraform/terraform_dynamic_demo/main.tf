#repeatable configuration blocks inside terraform

#supported into following blocks:
#resource
#data
#provider
#provisioner

#used to look code more cleaner 

resource "aws_security_group" "my-sg" {
	name = "my-security-group"
	vpc_id = aws_vpc.abc.id
	ingress {
	from_port = 22
	to_port = 22
	protocol = "tcp"
	cidr_blocks = ["144.112.0.12/132"]
	}
	ingress {
	#second ingress
	}
	ingress {
	#third ingress
	}
}

#this can be rewritten with dynamic block

resource "aws_security_group" "my-sg" {
	name = "my-security-group"
	vpc_id aws_vpc.abc.id
	dynamic "ingress" {
	for_each = var.rules
	content {
		from_port = ingress.value.["port"]
		to_port = ingress.value.["port"]
		protocol = ingress.value.["protocol"]
		cidr_blocks = ingress.value.["cidr"]
	}
	}
	}


variable "rules" {
	default = [
	{
		port = 80
		protocol = "tcp"
		cidr_blocks = ["144.112.0.12/132"]
},
	{
		port = 22
		protocol = "tcp"
		cidr_blocks = ["10.0.0.1/24"]
	}
]
}
