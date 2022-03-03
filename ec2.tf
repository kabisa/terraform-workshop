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


resource "aws_key_pair" "this" {
  key_name   = var.team
  public_key = var.public_key
}

resource "template_file" "user_data" {
  template = file("templates/user_data.sh.tpl")

  vars = {
    team = var.team
  }
}

resource "aws_instance" "this" {
  ami           = "ami-013e1af9930f63942"
  instance_type = var.ec2_instance_type

  vpc_security_group_ids = [aws_security_group.instances.id]
  subnet_id              = module.vpc.public_subnets[0]
  key_name               = aws_key_pair.this.key_name

  user_data = template_file.user_data.rendered

  root_block_device {
    volume_type = "gp2"
    volume_size = 16
  }
}

resource "aws_eip" "this" {
  vpc = true
}

resource "aws_eip_association" "this" {
  instance_id   = aws_instance.this.id
  allocation_id = aws_eip.this.id
}
