# General
variable "region" {
  type    = string
  default = "eu-west-3"
}

# VPC
variable "cidr" {
  type    = string
  default = "172.16.0.0/16"
}

variable "public_subnets" {
  type    = list(string)
  default = ["172.16.10.0/24", "172.16.20.0/24", "172.16.30.0/24"]
}

variable "azs" {
  type    = list(string)
  default = ["eu-west-3a", "eu-west-3b", "eu-west-3c"]
}

variable "team" {
  type = string
}

variable "ssh_cidr_blocks" {
  type = list(string)
}

variable "public_key" {
  type = string
}

# EC2
variable "ec2_instance_type" {
  type = string
}

variable "ec2_ami" {
  type = string
}
