resource "aws_security_group" "instances" {
  name   = "cloud-legends-demo-${var.team}"
  vpc_id = module.vpc.vpc_id
}

resource "aws_security_group_rule" "ssh" {
  security_group_id = aws_security_group.instances.id

  type        = "ingress"
  from_port   = 22
  to_port     = 22
  cidr_blocks = var.ssh_cidr_blocks
  protocol    = "tcp"
}

resource "aws_security_group_rule" "egress_all" {
  security_group_id = aws_security_group.instances.id

  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}
