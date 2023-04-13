resource "aws_instance" "apache" {
  ami = "ami-02eb7a4783e7e9317"
  instance_type = "t2.micro"
  tenancy = "default"
  availability_zone = "ap-south-1a"
}

resource "aws_instance" "nginx" {
  ami = "ami-02eb7a4783e7e9317"
  instance_type = "t2.micro"
  tenancy = "default"
  availability_zone = "ap-south-1b"
  
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "192.168.0.0/24"
  vpc_id = "vpc-05e56071ddae6df23"
  tags = {
    Name = "my_vpc"
  }
  
}