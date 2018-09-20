terraform {
  backend "s3" {
    region          = "eu-west-1"
    bucket          = "kabisa-terraform-statefiles"
    dynamodb_table  = "kabisa-terraform-lockfiles"
    key             = "workshop/terraform.tfstate"
    encrypt         = true
    role_arn        = "arn:aws:iam::003476575487:role/OrganizationAccountAccessRole"
    session_name    = "terraform"
  }
}

provider "aws" {
  region = "eu-west-1"

  assume_role {
    role_arn     = "arn:aws:iam::820116308106:role/OrganizationAccountAccessRole"
  }
}

provider "aws" {
  alias =     "us-east-1"
  region =    "us-east-1"

  assume_role {
    role_arn     = "arn:aws:iam::820116308106:role/OrganizationAccountAccessRole"
  }
}