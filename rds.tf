resource "aws_rds_cluster" "kabisa-demo-rds" {
  cluster_identifier = "kabisa-demo"
  engine = "aurora-mysql"
  engine_version = "5.7.12"
  master_username = "${var.rds_username}"
  master_password = "${var.rds_password}"
  database_name = "${var.rds_db}"
  apply_immediately = true
  db_subnet_group_name = "${module.vpc.database_subnet_group}"
  vpc_security_group_ids = ["${aws_security_group.kabisa-demo-rds-sg.id}"]
}

resource "aws_rds_cluster_instance" "kabisa-demo-rds-instance" {
  count = "${var.rds_count}"
  engine = "aurora-mysql"
  engine_version = "5.7.12"
  cluster_identifier = "${aws_rds_cluster.kabisa-demo-rds.cluster_identifier}"
  instance_class = "${var.rds_type}"
  apply_immediately = true
}


output "db-username" {
  value = "${aws_rds_cluster.kabisa-demo-rds.master_username}"
}

output "db-password" {
  value = "${aws_rds_cluster.kabisa-demo-rds.master_password}"
}

output "db-hostname" {
  value = "${aws_rds_cluster.kabisa-demo-rds.endpoint}"
}

/*
resource "aws_db_instance" "kabisa-demo-db" {
  identifier = "kabisa-demo-db"
  engine = "aurora-mysql"
  engine_version = "5.7.12"
  instance_class = "${var.rds_type}"
  username = "${var.rds_username}"
  password = "${var.rds_password}"
  name = "${var.rds_db}"
  allocated_storage = 4
  apply_immediately = true
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
*/