resource "aws_security_group" "this" {
  name        = "cloud-legends-demo-${random_pet.team_name.id}"
  vpc_id      = module.vpc.vpc_id
}

resource "aws_security_group_rule" "http" {
  security_group_id = aws_security_group.this.id

  type        = "ingress"
  from_port   = 80
  to_port     = 80
  cidr_blocks = ["0.0.0.0/0"]
  protocol    = "tcp"
}

resource "aws_security_group_rule" "https" {
  security_group_id = aws_security_group.this.id

  type        = "ingress"
  from_port   = 443
  to_port     = 443
  cidr_blocks = ["0.0.0.0/0"]
  protocol    = "tcp"
}

resource "aws_security_group_rule" "egress_all" {
  security_group_id = aws_security_group.this.id

  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}
