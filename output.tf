output "ip" {
  value = aws_eip.this.public_ip
}

output "team_name" {
  value = random_pet.team_name.id
}
