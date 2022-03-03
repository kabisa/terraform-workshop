resource "aws_key_pair" "this" {
  key_name   = var.team
  public_key = var.public_key
}

data "template_file" "user_data" {
  count    = local.instance_count
  template = file("templates/user_data.sh.tpl")

  vars = {
    team     = var.team
    instance = count.index
  }
}

resource "aws_instance" "this" {
  count         = local.instance_count
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type

  vpc_security_group_ids = [aws_security_group.instances.id]
  subnet_id              = module.vpc.public_subnets[0]
  key_name               = aws_key_pair.this.key_name

  user_data = data.template_file.user_data[count.index].rendered

  root_block_device {
    volume_type = "gp2"
    volume_size = 16
  }
}
