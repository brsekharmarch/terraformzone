variable "region" {
  type        = string
  default     = "ap-south-1"
  description = "region to create resource"
}

variable "ntier-vpc-info" {
  type = object({
    vpc_cidr     = string,
    subnet_azs   = list(string),
    subnet_Names = list(string)
  })
  default = {
    subnet_Names = ["app1", "app2", "db1", "db2"]
    subnet_azs   = ["a", "b", "a", "b"]
    vpc_cidr     = "192.168.0.0/16"
  }

}
