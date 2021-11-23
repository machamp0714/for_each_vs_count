output "public_1a_id" {
  value = aws_subnet.public["public_subnet_1a"].id
}

output "public_1c_id" {
  value = aws_subnet.public["public_subnet_1c"].id
}

output "public_ids" {
  value = [ for value in aws_subnet.public : value.id ]
}
