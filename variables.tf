/* General vars */
variable "profile" {
  default = "kabisa-demo"
}

variable "shared_credentials_file" {
  default = "~/.aws/credentials"
}

variable "region" {
  default = "eu-west-3"
}

/* VPC vars */
variable "cidr" {
  default = "172.16.0.0/16"
}

variable "public_subnets" {
  type = "list"
  default = ["172.16.10.0/24", "172.16.20.0/24", "172.16.30.0/24"]
}

variable "database_subnets" {
  type = "list"
  default = ["172.16.210.0/24", "172.16.220.0/24", "172.16.230.0/24"]
}

variable "azs" {
  type = "list"
  default = ["eu-west-3a", "eu-west-3b", "eu-west-3c"]
}

/* EC2 vars */
variable "ec2_type" {}
variable "ec2_ami" {}
variable "ec2_keypair" {}

/* RDS vars */
variable "rds_count" {}
variable "rds_type" {}
variable "rds_username" {}
variable "rds_password" {}
variable "rds_db" {}
