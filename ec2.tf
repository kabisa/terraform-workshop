resource "aws_instance" "kabisa-demo-instance" {
  ami = "${var.ec2_ami}"
  instance_type = "${var.ec2_type}"
  key_name = "${var.ec2_keypair}"
  vpc_security_group_ids = ["${aws_security_group.kabisa-demo-sg.id}"]
  subnet_id = "${element(module.vpc.public_subnets, 1)}"

  root_block_device {
    volume_type = "gp2"
    volume_size = 8
  }
}

/* Elastic ip */
resource "aws_eip" "elastic_ip" {
  vpc = true
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = "${aws_instance.kabisa-demo-instance.id}"
  allocation_id = "${aws_eip.elastic_ip.id}"
}

output "ip" {
  value = "${aws_eip.elastic_ip.public_ip}"
}
