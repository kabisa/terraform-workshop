/* General vars */
variable "profile" {}
variable "shared_credentials_file" {}

variable "region" {
  default = "eu-west-3"
}

/* VPC vars */
variable "public_subnets" {
  type = "list"
  default = []
}

variable "azs" {
  type = "list"
  default = ["eu-west-3a", "eu-west-3b", "eu-west-3c"]
}

/* EC2 vars */
variable "ec2_type" {}
variable "ec2_ami" {}