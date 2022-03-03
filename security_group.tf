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

resource "aws_security_group_rule" "http" {
  security_group_id = aws_security_group.instances.id

  type        = "ingress"
  from_port   = 80
  to_port     = 80
  cidr_blocks = ["0.0.0.0/0"]
  protocol    = "tcp"
}

resource "aws_security_group_rule" "https" {
  security_group_id = aws_security_group.instances.id

  type        = "ingress"
  from_port   = 443
  to_port     = 443
  cidr_blocks = ["0.0.0.0/0"]
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
