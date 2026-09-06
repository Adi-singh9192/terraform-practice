#This file for adding the variable 

variable "aws_instance_type" {
    default = "t3.micro"
    type = string
}

variable "ec2_ami_id" {
    default = "ami-06468be052a4195a6"
    type = string
}

variable "root_block_size" {
    default = 15
    type = number
}


