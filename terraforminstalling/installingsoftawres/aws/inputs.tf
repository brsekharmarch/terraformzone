variable "region" {
  type        = string
  default     = "ap-south-1"
  description = "region to create resource"
}

variable "ntier-vpc-info" {
  type = object({
    vpc_cidr        = string,
    subnet_azs      = list(string),
    subnet_Names    = list(string),
    private_subnets = list(string),
    public_subnets  = list(string),
    db_subnets      = list(string),
    web_ec2_subnet  = string,
    rollout_version = string
  })
  default = {
    subnet_Names    = ["app1", "app2", "db1", "db2"]
    subnet_azs      = ["a", "b", "a", "b"]
    vpc_cidr        = "192.168.0.0/16"
    private_subnets = ["app1", "app2", "db1", "db2"]
    public_subnets  = []
    db_subnets      = ["db1", "db2"]
    web_ec2_subnet  = ""
    rollout_version = "0.0.0.0"
  }
}