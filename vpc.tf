module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.12"

  name = "cloud-legends-demo-${var.team}"

  cidr           = var.cidr
  azs            = var.azs
  public_subnets = var.public_subnets
}
