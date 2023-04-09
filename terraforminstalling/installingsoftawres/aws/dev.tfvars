region = "ap-south-1"
ntier-vpc-info = {
  subnet_Names    = ["app1", "app2", "db1", "db2", "web1", "web2"]
  subnet_azs      = ["a", "b", "a", "b", "a", "b"]
  vpc_cidr        = "192.168.0.0/16"
  public_subnets  = ["web1", "web2"]
  private_subnets = ["app1", "app2", "db1", "db2"]
  db_subnets      = ["db1", "db2"]
  web_ec2_subnet  = "web1"
  rollout_version = "0.0.0.0"
}