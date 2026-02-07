variable "aws_region" {
	description = "AWS region to deploy resources"
	type = string
}
variable "ami_id" {
	description = "AMI id for ubuntu 22.04"
	type = string
}
variable "instance_type" {
	description = "EC2 instance type"
	type = string
	default = "t2.micro"
}
