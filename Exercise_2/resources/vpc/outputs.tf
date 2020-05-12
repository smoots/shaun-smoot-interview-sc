# VPC ID Generated On Build Out
output "vpc_id" {
  value = aws_vpc.vpc.id
}

# Subnet IDs Generated On Build Out
output "public_subnet_a" {
  value = aws_subnet.public_subnet_a.id
}

output "public_subnet_c" {
  value = aws_subnet.public_subnet_c.id
}

output "private_subnet_a" {
  value = aws_subnet.private_subnet_a.id
}

output "private_subnet_c" {
  value = aws_subnet.private_subnet_c.id
}

