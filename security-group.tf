#
# Example of a new security group
#

resource "aws_security_group" "kabisa-demo-sg" {
  name = "kabisa-demo-sg"
  description = "Security Group for our Kabisa Demo"
  vpc_id = "${module.vpc.vpc_id}"
}

resource "aws_security_group_rule" "ssh-kabisa-hq" {
  type = "ingress"
  from_port = 22
  to_port = 22
  cidr_blocks = ["212.78.221.106/32", "109.235.33.64/32"]
  protocol = "tcp"
  security_group_id = "${aws_security_group.kabisa-demo-sg.id}"
}

resource "aws_security_group_rule" "allow-http" {
  type = "ingress"
  from_port = 80
  to_port = 80
  cidr_blocks = ["0.0.0.0/0"]
  protocol = "tcp"
  security_group_id = "${aws_security_group.kabisa-demo-sg.id}"
}

resource "aws_security_group_rule" "allow-https" {
  type = "ingress"
  from_port = 443
  to_port = 443
  cidr_blocks = ["0.0.0.0/0"]
  protocol = "tcp"
  security_group_id = "${aws_security_group.kabisa-demo-sg.id}"
}

// Allow all outgoing traffic
resource "aws_security_group_rule" "egress_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.kabisa-demo-sg.id}"
}
