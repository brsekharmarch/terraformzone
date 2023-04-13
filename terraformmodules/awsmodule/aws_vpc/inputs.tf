variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "vpc_cidr_block" {
  type        = string
  description = "(optional) describe your variable"
  default     = "192.168.0.0/24"
}

variable "subnet_info" {
  type = object({
    names               = list(string)
    public_subnet_names = list(string)
  })
  default = {
    names               = ["app1", "app2", "db1", "db2"]
    public_subnet_names = ["app1", "db1"]
  }
}