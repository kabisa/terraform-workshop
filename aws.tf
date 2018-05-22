# General AWS data
provider "aws" {
  region                  = "${var.region}"
  shared_credentials_file = "${var.shared_credentials_file}"
  profile                 = "${var.profile}"
}

# For resouces that have to be regged in us-east-1
# use with provider = "aws.us-east-1"
provider "aws" {
  alias = "us-east-1"
  region = "us-east-1"
  shared_credentials_file = "${var.shared_credentials_file}"
  profile                 = "${var.profile}"
}
