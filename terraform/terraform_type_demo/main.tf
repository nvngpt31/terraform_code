#Type contraints control the type of variable values.
# Primitive = single type value like number, string, bool
#replicas = 3
#name = "abc"
#backup = true

#complex multiple types in single variables
#list, tuple, map, object, set
#list(type)
#map(type)
#set(type)
#object(type)
#tuple(type)

#complex can be devided further into two types
#First collection - multiple values of same types


variable "test" {
	type = list(string)
	default = ["abc", "xyz"]
}

# Second structural - multiple values of different types

variable "another_test" {
	type = object({
	name = string
	age = number
	})
}


# any is a placeholder for a type yet to be decided 
vairable "last_test" {
	type  = list(any)
	default = ["abc"]
}
