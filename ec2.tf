# For the First time, we are going to create a terraform file to create an EC2 instance in AWS. The following code will create a simple EC2 instance with the specified AMI and instance type.

# Key-pair 
resource "aws_key_pair" "my_key" {
    key_name = "terra-key-ec2"
    public_key = file("terra-key-ec2.pub")
}

# vpc and Security group

resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "my_security_group" {
    name = "automate-sg"
    description = "This allows all the inbound and outbound traffic"
    vpc_id = aws_default_vpc.default.id  #Interpolation

    tags = {
    Name = "automate-sg"
  }

  #ingress rule

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH Port Open"
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP Port Open"
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
    description = "For Outbound all port open"
  }
}

#ec2 instance

resource "aws_instance" "my_instance" {
    key_name = aws_key_pair.my_key.key_name
    vpc_security_group_ids = [ aws_security_group.my_security_group.id ]
    instance_type = "t3.micro"
    ami = "ami-06468be052a4195a6"

    root_block_device {
      volume_size = 8
      volume_type = "gp3"
    }

    tags = {
        Name = "Aditya-Terraform-Ec2"
    }
}