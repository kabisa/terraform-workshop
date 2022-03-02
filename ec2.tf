data "aws_ami" "generic" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
}

resource "aws_instance" "this" {
  ami           = data.aws_ami.generic.id
  instance_type = var.ec2_instance_type

  vpc_security_group_ids = [aws_security_group.this.id]
  subnet_id              = module.vpc.public_subnets[0]

  root_block_device {
    volume_type = "gp2"
    volume_size = 8
  }
}

resource "aws_eip" "this" {
  vpc = true
}

resource "aws_eip_association" "this" {
  instance_id   = aws_instance.this.id
  allocation_id = aws_eip.this.id
}
