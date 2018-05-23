/*
resource "aws_rds_cluster" "kabisa-demo-rds" {
  cluster_identifier = "kabisa-demo-rds"
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


output "aurora-username" {
  value = "${aws_rds_cluster.kabisa-demo-rds.master_username}"
}

output "aurora-password" {
  value = "${aws_rds_cluster.kabisa-demo-rds.master_password}"
}

output "aurora-hostname" {
  value = "${aws_rds_cluster.kabisa-demo-rds.endpoint}"
}
*/