resource "aws_security_group" "web" {
  name = "web"
  ingress {
    from_port   = local.ssh_port
    to_port     = local.ssh_port
    cidr_blocks = [local.anywhere]
    protocol    = local.tcp

  }
  ingress {
    from_port   = local.http_port
    to_port     = local.http_port
    cidr_blocks = [local.anywhere]
    protocol    = local.tcp

  }
  egress {
    from_port   = local.ssh_port
    to_port     = local.ssh_port
    cidr_blocks = [local.anywhere]
    protocol    = local.tcp

  }
  egress {
    from_port   = local.http_port
    to_port     = local.http_port
    cidr_blocks = [local.anywhere]
    protocol    = local.tcp

  }

  tags = {
    Name = "web"
  }
  vpc_id = local.vpc_id

  depends_on = [
    aws_subnet.subnets
  ]

}

data "aws_ami_ids" "ubuntu_2204" {
  owners = ["099720109477"]
  filter {
    name   = "description"
    values = ["Canonical, Ubuntu, 22.04 LTS, amd64 jammy image build on 2023-02-08"]
  }
  filter {
    name   = "is-public"
    values = ["true"]
  }

}

data "aws_subnet" "web" {
  vpc_id = local.vpc_id
  filter {
    name   = "tag:Name"
    values = [var.ntier-vpc-info.web_ec2_subnet]
  }
  depends_on = [
    aws_subnet.subnets
  ]

}

resource "aws_instance" "db" {
  ami                         = local.ami_id
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  subnet_id                   = data.aws_subnet.web.id
  user_data                   = file("apache.sh")
  vpc_security_group_ids      = [aws_security_group.web.id]
  tags = {
    Name = "web1"
  }

  depends_on = [
    aws_security_group.web
  ]

}

resource "null_resource" "file" {
  triggers = {
    rollout_version = "var.ntier_vpc_info.rollout_version"
  }

  connection {
    host = aws_instance.db.public_ip
    user = "ubuntu"
    type = "ssh"
  }
}

