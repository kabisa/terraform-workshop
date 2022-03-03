output "ips" {
  value = aws_eip.this.*.public_ip
}
