provider "aws" {
  region = "ap-south-1"

}

module "aws_vpc" {
  source = "./awsmodule/aws_vpc"
  region = "ap-south-1"
  subnet_info = {
    names               = ["app", "app1", "db", "db1"]
    public_subnet_names = ["app"]
  }

}

