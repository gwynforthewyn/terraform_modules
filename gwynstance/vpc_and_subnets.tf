resource "aws_vpc" "mystique" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support = true
}

resource "aws_subnet" "mystic" {
    vpc_id     = aws_vpc.mystique.id
    availability_zone = var.subnet_az

    cidr_block = var.mystic_subnet_cidr

    tags = {
      Name = "Mystic Testnet"
  }
}