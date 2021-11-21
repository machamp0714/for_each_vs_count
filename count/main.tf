resource "aws_vpc" "this" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
}

resource "aws_subnet" "public" {
  count = length(var.public_blocks)

  vpc_id            = aws_vpc.this.id
  cidr_block        = element(var.public_blocks, count.index)
  availability_zone = element(var.availability_zones, count.index)
}
