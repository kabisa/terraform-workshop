# Define any vars that are user/environment-specific in <something>.auto.tfvars.

# ECS
ec2_instance_type = "t3.micro"
ec2_instance_ami  = "ami-0ce164d54ac79b582"

# RDS
rds_instance_type = "db.t3.micro"
rds_username      = "wordpress"
rds_db_name       = "wordpress"
