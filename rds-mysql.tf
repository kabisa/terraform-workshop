resource "aws_db_instance" "kabisa-demo-db" {
  identifier = "kabisa-demo-db"
  engine = "mysql"
  engine_version = "5.7"
  instance_class = "${var.rds_type}"
  username = "${var.rds_username}"
  password = "${var.rds_password}"
  name = "${var.rds_db}"
  allocated_storage = "${var.rds_storage}"
  storage_type = "gp2"
  multi_az = true
  auto_minor_version_upgrade = true
  apply_immediately = true
  db_subnet_group_name = "${module.vpc.database_subnet_group}"
  vpc_security_group_ids = ["${aws_security_group.kabisa-demo-rds-sg.id}"]
}

output "db-username" {
  value = "${aws_db_instance.kabisa-demo-db.username}"
}

output "db-password" {
  value = "${aws_db_instance.kabisa-demo-db.password}"
}

output "db-hostname" {
  value = "${aws_db_instance.kabisa-demo-db.endpoint}"
}
