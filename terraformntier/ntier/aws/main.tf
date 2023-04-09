resource "aws_vpc" "ntier" {
  cidr_block = var.ntier-vpc-info.vpc_cidr
  tags = {
    "Name" = "ntier"
  }
}

resource "aws_subnet" "subnets" {
  count             = length(var.ntier-vpc-info.subnet_Names)
  cidr_block        = cidrsubnet(var.ntier-vpc-info.vpc_cidr, 8, count.index)
  availability_zone = "${var.region}${var.ntier-vpc-info.subnet_azs[count.index]}"
  vpc_id            = aws_vpc.ntier.id
  tags = {
    Name = var.ntier-vpc-info.subnet_Names[count.index]
  }


}

