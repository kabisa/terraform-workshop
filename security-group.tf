#
# Example of a new security group that allows
#

resource "aws_security_group" "kabisa-demo-sg" {
  name = "kabisa-demo-sg"
  description = "Kabisa Demo Security Group"
  vpc_id = "${module.vpc.vpc_id}"
}

resource "aws_security_group_rule" "kabisa-demo-ssh-hq" {
  type = "ingress"
  from_port = 22
  to_port = 22
  cidr_blocks = ["212.78.221.106/32", "109.235.33.64/32"]
  protocol = "tcp"
  security_group_id = "${aws_security_group.kabisa-demo-sg.id}"
}

resource "aws_security_group_rule" "kabisa-demo-http" {
  type = "ingress"
  from_port = 80
  to_port = 80
  cidr_blocks = ["0.0.0.0/0"]
  protocol = "tcp"
  security_group_id = "${aws_security_group.kabisa-demo-sg.id}"
}

resource "aws_security_group_rule" "kabisa-demo-https" {
  type = "ingress"
  from_port = 443
  to_port = 443
  cidr_blocks = ["0.0.0.0/0"]
  protocol = "tcp"
  security_group_id = "${aws_security_group.kabisa-demo-sg.id}"
}

// Allow all outgoing traffic
resource "aws_security_group_rule" "kabisa-demo-egress_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.kabisa-demo-sg.id}"
}

#
# RDS security group
#

resource "aws_security_group" "kabisa-demo-rds-sg" {
  name = "kabisa-demo-rds-sg"
  description = "Kabisa Demo RDS security group"
  vpc_id = "${module.vpc.vpc_id}"
}

resource "aws_security_group_rule" "kabisa-demo-rds-mysql" {
  type = "ingress"
  from_port = 3306
  to_port = 3306
  protocol = "tcp"
  source_security_group_id = "${aws_security_group.kabisa-demo-sg.id}"
  security_group_id = "${aws_security_group.kabisa-demo-rds-sg.id}"
}
