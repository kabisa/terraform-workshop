module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.12"

  name = "cloud-legends-demo-${random_pet.team_name.id}"

  cidr             = var.cidr
  azs              = var.azs
  public_subnets   = var.public_subnets
  database_subnets = var.database_subnets

  create_database_subnet_group = true
}
