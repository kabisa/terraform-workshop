module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name = "kabisa-demo"
  cidr = "172.16.0.0/16"
  azs = "${var.azs}"
  public_subnets = "${var.public_subnets}"
}

