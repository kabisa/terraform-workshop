#
# Define any vars that are user/environment-specific in <something>.auto.tfvars and add it to the .gitignore
#

/* EC2 vars */
ec2_type = "t2.micro"
ec2_ami = "ami-e7cf7e9a"

/* RDS vars */
rds_count = 2
rds_type = "db.t2.small"
rds_db = "wordpress"
rds_username = "wordpress"
