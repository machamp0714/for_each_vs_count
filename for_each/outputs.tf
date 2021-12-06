output "public_1a_id" {
  value = aws_subnet.public["ap-northeast-1a"].id
}

output "public_1c_id" {
  value = aws_subnet.public["ap-northeast-1c"].id
}

output "public_ids" {
  value = [ for value in aws_subnet.public : value.id ]
}
