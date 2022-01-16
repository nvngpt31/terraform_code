resource "aws_instance"  "test" {
	count = terraform.workspace == "default" ? 4 : 2

}

resource "aws_s3_bucket" "test" {
 	bucket = "jupiter-${terraform.workspace}"
}
