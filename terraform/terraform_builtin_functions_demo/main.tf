variable "project-name" {
	type = string
	default = "prod"
}

resource "aws_vpc" "my-vpc" {
	cidr_block = "10.0.0.0/16"
	tags = {
		Name = join("-", ["terraform",var.project_name])
	}
}


#file
#max
#flatten
#With terraform console you can test built-in functions 
#max(5,3,1,2,10)
#timestamp()
#join("_",["FirstName", "LastName"])
#contains(["abc", "xyz", "123"], "abc")
#will return true and false

